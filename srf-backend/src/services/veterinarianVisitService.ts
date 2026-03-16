import { prisma } from "..";
import { AuditService } from "./auditService";

interface BodyMeasurementInput {
    bodyMeasurementTypeId: string,
    value: number,
}

interface VeterinarianVisitCreateInput {
    id: string,
    liveAnimalId: string,
    veterinarianId: string,
    date: string,
    cardLink: string | null,
    bodyMeasurements: BodyMeasurementInput[],
}

interface VeterinarianVisitUpdateInput {
    liveAnimalId: string,
    veterinarianId: string,
    date: string,
    cardLink: string | null,
    bodyMeasurements: BodyMeasurementInput[],
}

class VeterinarianVisitService {
    private auditService = new AuditService();
    private formId = 'visitaveterinaria';

    async getAll(userId: string) {
        const visits = await prisma.veterinarianVisit.findMany({
            select: {
                id: true,
                liveAnimal: { select: { id: true, name: true } },
                veterinarian: { select: { id: true, name: true } },
                date: true,
                cardLink: true,
                bodyMeasurement: {
                    select: {
                        id: true,
                        bodyMeasurementType: { select: { id: true, description: true, unit: true } },
                        value: true,
                    }
                }
            },
            orderBy: { date: 'desc' }
        });

        const visitsWithPermission = await Promise.all(
            visits.map(async (v) => {
                const permission = await this.auditService.canUserEditRecord(userId, 'veterinarianVisit', v.id, this.formId);
                return {
                    id: v.id,
                    canEdit: permission.canEdit,
                    hasSample: await prisma.sampleAllocationVeterinarian.count({ where: { veterinarianVisitId: v.id } }) > 0,
                    liveAnimalId: v.liveAnimal.id,
                    liveAnimalName: v.liveAnimal.name,
                    veterinarianId: v.veterinarian.id,
                    veterinarianName: v.veterinarian.name,
                    date: v.date,
                    cardLink: v.cardLink,
                    bodyMeasurements: v.bodyMeasurement.map(bm => ({
                        id: bm.id,
                        bodyMeasurementTypeId: bm.bodyMeasurementType.id,
                        bodyMeasurementTypeDescription: bm.bodyMeasurementType.description,
                        bodyMeasurementTypeUnit: bm.bodyMeasurementType.unit,
                        value: bm.value,
                    }))
                };
            })
        );

        return visitsWithPermission;
    }

    async getFormOptions() {
        const [liveAnimals, veterinarians, bodyMeasurementTypes] = await Promise.all([
            prisma.liveAnimal.findMany({ select: { id: true, name: true }, where: { active: true } }),
            prisma.veterinarian.findMany({ select: { id: true, name: true } }),
            prisma.bodyMeasurementTypeVeterinarian.findMany({ select: { id: true, description: true, unit: true } }),
        ]);
        return { liveAnimals, veterinarians, bodyMeasurementTypes };
    }

    async create(data: VeterinarianVisitCreateInput, userId: string) {

        return prisma.$transaction(async (tx) => {
            // Create veterinarian visit
            const visitExists = await tx.veterinarianVisit.findUnique({ where: { id: data.id } });
            if (visitExists) throw new Error('Visita veterinária já existe');

            const visit = await tx.veterinarianVisit.create({
                data: {
                    id: data.id,
                    liveAnimalId: data.liveAnimalId,
                    veterinarianId: data.veterinarianId,
                    date: new Date(data.date + 'T12:00:00'),
                    cardLink: data.cardLink || null,
                }
            });

            // Create body measurements
            const measurements = [];
            for (const bm of data.bodyMeasurements) {
                const measurement = await tx.bodyMeasurementVeterinarian.create({
                    data: {
                        veterinarianVisitId: visit.id,
                        bodyMeasurementTypeId: bm.bodyMeasurementTypeId,
                        value: bm.value,
                    }
                });
                measurements.push(measurement);
            }

            // Audit log
            const changes = [
                {
                    table: 'veterinarianVisit',
                    recordId: visit.id,
                    action: 'CREATE' as const,
                    newData: visit,
                },
                ...measurements.map(m => ({
                    table: 'bodyMeasurementVeterinarian',
                    recordId: m.id,
                    action: 'CREATE' as const,
                    newData: m,
                }))
            ];

            await this.auditService.logTransaction(userId, this.formId, 'SUBMIT', changes);

            return visit;
        });
    }

    async update(visitId: string, data: VeterinarianVisitUpdateInput, userId: string) {

        return prisma.$transaction(async (tx) => {
            // Get old data
            const oldVisit = await tx.veterinarianVisit.findUnique({
                where: { id: visitId },
                include: { bodyMeasurement: true }
            });

            if (!oldVisit) {
                throw new Error('Visita veterinária não encontrada');
            }

            // Update veterinarian visit
            const updatedVisit = await tx.veterinarianVisit.update({
                where: { id: visitId },
                data: {
                    liveAnimalId: data.liveAnimalId,
                    veterinarianId: data.veterinarianId,
                    date: new Date(data.date + 'T12:00:00'),
                    cardLink: data.cardLink || null,
                }
            });

            // Delete old body measurements
            await tx.bodyMeasurementVeterinarian.deleteMany({
                where: { veterinarianVisitId: visitId }
            });

            // Create new body measurements
            const newMeasurements = [];
            for (const bm of data.bodyMeasurements) {
                const measurement = await tx.bodyMeasurementVeterinarian.create({
                    data: {
                        veterinarianVisitId: visitId,
                        bodyMeasurementTypeId: bm.bodyMeasurementTypeId,
                        value: bm.value,
                    }
                });
                newMeasurements.push(measurement);
            }

            // Audit log
            const changes = [
                {
                    table: 'veterinarianVisit',
                    recordId: visitId,
                    action: 'UPDATE' as const,
                    oldData: oldVisit,
                    newData: updatedVisit,
                },
                ...oldVisit.bodyMeasurement.map(m => ({
                    table: 'bodyMeasurementVeterinarian',
                    recordId: m.id,
                    action: 'DELETE' as const,
                    oldData: m,
                })),
                ...newMeasurements.map(m => ({
                    table: 'bodyMeasurementVeterinarian',
                    recordId: m.id,
                    action: 'CREATE' as const,
                    newData: m,
                }))
            ];

            await this.auditService.logTransaction(userId, this.formId, 'SUBMIT', changes);

            return updatedVisit;
        });
    }

    async delete(visitId: string, userId: string) {

        return prisma.$transaction(async (tx) => {
            // Get old data for audit
            const oldVisit = await tx.veterinarianVisit.findUnique({
                where: { id: visitId },
                include: { bodyMeasurement: true }
            });

            if (!oldVisit) {
                throw new Error('Visita veterinária não encontrada');
            }

            // Check for linked sample allocations
            const linkedSamples = await tx.sampleAllocationVeterinarian.count({
                where: { veterinarianVisitId: visitId }
            });
            if (linkedSamples > 0) {
                throw new Error('Não é possível excluir a visita pois existem amostras vinculadas a ela. Remova as amostras antes de excluir a visita.');
            }

            // Delete body measurements first
            await tx.bodyMeasurementVeterinarian.deleteMany({
                where: { veterinarianVisitId: visitId }
            });

            // Delete the visit
            await tx.veterinarianVisit.delete({
                where: { id: visitId }
            });

            // Audit log
            const changes = [
                ...oldVisit.bodyMeasurement.map(m => ({
                    table: 'bodyMeasurementVeterinarian',
                    recordId: m.id,
                    action: 'DELETE' as const,
                    oldData: m,
                })),
                {
                    table: 'veterinarianVisit',
                    recordId: visitId,
                    action: 'DELETE' as const,
                    oldData: oldVisit,
                },
            ];

            await this.auditService.logTransaction(userId, this.formId, 'SUBMIT', changes);

            return { success: true };
        });
    }
}

export { VeterinarianVisitService };
