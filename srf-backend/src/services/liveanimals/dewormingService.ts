import { prisma } from "../..";
import { AuditService } from "../auditService";
import {
    type CreateDewormingInput,
    type GetAllDewormingOutput,
    type GetFormOptionsDewormingOutput,
    type UpdateDewormingInput
} from "srf-shared-types";

export class DewormingService {
    private auditService = new AuditService();
    private formId = 'vermifugacao';
    private tableName = 'deworming';

    async getAll(userId: string): Promise<GetAllDewormingOutput[]> {
        const records = await prisma.deworming.findMany({
            select: {
                id: true,
                liveAnimal: { select: { id: true, code: true } },
                assignee: { select: { id: true, name: true } },
                veterinarianVisit: { select: { id: true, date: true } },
                medication: { select: { id: true, name: true } },
                startDate: true,
                endDate: true,
                note: true
            },
            orderBy: { startDate: 'desc' }
        });

        const recordIds = records.map(record => String(record.id));
        const createLogs = await prisma.changeLog.findMany({
            where: {
                table: this.tableName,
                recordId: { in: recordIds },
                action: 'CREATE'
            },
            select: {
                recordId: true,
                auditLog: { select: { userId: true } }
            }
        });
        const creatorMap = new Map(createLogs.map(log => [log.recordId, log.auditLog.userId]));

        return Promise.all(records.map(async record => {
            const permission = await this.auditService.canUserEditRecord(
                userId,
                this.tableName,
                String(record.id),
                this.formId
            );
            return {
                id: record.id,
                liveAnimalId: record.liveAnimal.id,
                liveAnimalCode: record.liveAnimal.code,
                assigneeId: record.assignee.id,
                assigneeName: record.assignee.name,
                veterinarianVisitId: record.veterinarianVisit?.id,
                veterinarianVisitDate: record.veterinarianVisit?.date.toISOString(),
                medicationId: record.medication.id,
                medicationName: record.medication.name,
                startDate: record.startDate.toISOString(),
                endDate: record.endDate?.toISOString(),
                note: record.note ?? undefined,
                canEdit: permission.canEdit,
                createdByMe: creatorMap.get(String(record.id)) === userId
            };
        }));
    }

    async getFormOptions(): Promise<GetFormOptionsDewormingOutput> {
        const [liveAnimals, assignees, medications, veterinarianVisits] = await Promise.all([
            prisma.liveAnimal.findMany({
                select: { id: true, code: true },
                where: { active: true },
                orderBy: { code: 'asc' }
            }),
            prisma.veterinarian.findMany({
                select: { id: true, name: true },
                orderBy: { name: 'asc' }
            }),
            prisma.medication.findMany({
                select: { id: true, name: true },
                orderBy: { name: 'asc' }
            }),
            prisma.veterinarianVisit.findMany({
                select: {
                    id: true,
                    date: true,
                    liveAnimal: { select: { id: true, code: true } }
                },
                orderBy: { date: 'desc' }
            })
        ]);

        return {
            liveAnimals,
            assignees,
            medications,
            veterinarianVisits: veterinarianVisits.map(visit => ({
                id: visit.id,
                date: visit.date.toISOString(),
                liveAnimal: visit.liveAnimal
            }))
        };
    }

    private validatePeriod(startDate: string, endDate?: string) {
        const start = new Date(startDate);
        const end = endDate ? new Date(endDate) : undefined;
        if (Number.isNaN(start.getTime()) || (end && Number.isNaN(end.getTime()))) {
            throw new Error('Informe datas válidas para a vermifugação.');
        }
        if (end && end < start) {
            throw new Error('A data de fim deve ser igual ou posterior à data de início.');
        }
    }

    private async validateReferences(
        tx: Parameters<Parameters<typeof prisma.$transaction>[0]>[0],
        data: CreateDewormingInput | UpdateDewormingInput
    ) {
        const [animal, assignee, medication] = await Promise.all([
            tx.liveAnimal.findUnique({ where: { id: data.liveAnimalId }, select: { id: true } }),
            tx.veterinarian.findUnique({ where: { id: data.assigneeId }, select: { id: true } }),
            tx.medication.findUnique({ where: { id: data.medicationId }, select: { id: true } })
        ]);
        if (!animal) throw new Error('Animal não encontrado.');
        if (!assignee) throw new Error('Responsável não encontrado.');
        if (!medication) throw new Error('Medicamento não encontrado.');
    }

    private async validateAnimalHasNoOtherDeworming(
        tx: Parameters<Parameters<typeof prisma.$transaction>[0]>[0],
        liveAnimalId: number,
        currentRecordId?: number
    ) {
        const existing = await tx.deworming.findFirst({
            where: { liveAnimalId },
            select: { id: true }
        });
        if (existing && existing.id !== currentRecordId) {
            throw new Error('Este animal já possui uma vermifugação registrada.');
        }
    }

    private async validateVeterinarianVisit(
        tx: Parameters<Parameters<typeof prisma.$transaction>[0]>[0],
        data: CreateDewormingInput | UpdateDewormingInput,
        currentRecordId?: number
    ) {
        if (!data.veterinarianVisitId) return;

        const visit = await tx.veterinarianVisit.findUnique({
            where: { id: data.veterinarianVisitId },
            select: { id: true, liveAnimalId: true, date: true }
        });
        if (!visit) throw new Error('Visita veterinária não encontrada.');
        if (visit.liveAnimalId !== data.liveAnimalId) {
            throw new Error('A visita veterinária deve pertencer ao animal selecionado.');
        }
        if (visit.date.toISOString().slice(0, 10) !== data.startDate.slice(0, 10)) {
            throw new Error('A data de início da vermifugação deve ser a mesma da visita veterinária associada.');
        }

        const existingAssociation = await tx.deworming.findUnique({
            where: { veterinarianVisitId: data.veterinarianVisitId },
            select: { id: true }
        });
        if (existingAssociation && existingAssociation.id !== currentRecordId) {
            throw new Error('Esta visita veterinária já possui uma vermifugação associada.');
        }
    }

    async create(data: CreateDewormingInput, requesterId: string) {
        this.validatePeriod(data.startDate, data.endDate);
        return prisma.$transaction(async tx => {
            await this.validateReferences(tx, data);
            await this.validateAnimalHasNoOtherDeworming(tx, data.liveAnimalId);
            await this.validateVeterinarianVisit(tx, data);
            const record = await tx.deworming.create({
                data: {
                    liveAnimalId: data.liveAnimalId,
                    assigneeId: data.assigneeId,
                    veterinarianVisitId: data.veterinarianVisitId || null,
                    medicationId: data.medicationId,
                    startDate: new Date(`${data.startDate}T12:00:00`),
                    endDate: data.endDate ? new Date(`${data.endDate}T12:00:00`) : null,
                    note: data.note || null
                }
            });
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', [{
                table: this.tableName,
                recordId: String(record.id),
                action: 'CREATE',
                newData: record
            }]);
            return record;
        });
    }

    async update(recordId: number, data: UpdateDewormingInput, requesterId: string) {
        this.validatePeriod(data.startDate, data.endDate);
        return prisma.$transaction(async tx => {
            const existing = await tx.deworming.findUnique({ where: { id: recordId } });
            if (!existing) throw new Error('Vermifugação não encontrada.');
            await this.validateReferences(tx, data);
            await this.validateAnimalHasNoOtherDeworming(tx, data.liveAnimalId, recordId);
            await this.validateVeterinarianVisit(tx, data, recordId);
            const record = await tx.deworming.update({
                where: { id: recordId },
                data: {
                    liveAnimalId: data.liveAnimalId,
                    assigneeId: data.assigneeId,
                    veterinarianVisitId: data.veterinarianVisitId || null,
                    medicationId: data.medicationId,
                    startDate: new Date(`${data.startDate}T12:00:00`),
                    endDate: data.endDate ? new Date(`${data.endDate}T12:00:00`) : null,
                    note: data.note || null
                }
            });
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', [{
                table: this.tableName,
                recordId: String(record.id),
                action: 'UPDATE',
                oldData: existing,
                newData: record
            }]);
            return record;
        });
    }

    async delete(recordId: number, requesterId: string) {
        return prisma.$transaction(async tx => {
            const existing = await tx.deworming.findUnique({ where: { id: recordId } });
            if (!existing) throw new Error('Vermifugação não encontrada.');
            await tx.deworming.delete({ where: { id: recordId } });
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', [{
                table: this.tableName,
                recordId: String(recordId),
                action: 'DELETE',
                oldData: existing
            }]);
            return { message: 'Vermifugação excluída com sucesso.' };
        });
    }
}
