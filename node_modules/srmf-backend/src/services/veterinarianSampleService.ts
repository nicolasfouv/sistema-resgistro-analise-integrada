import { prisma } from "..";
import { AuditService } from "./auditService";
import {
    type GetAllVeterinarianSampleOutput,
    type GetFormOptionsVeterinarianSampleOutput
} from "srf-shared-types";

import {
    type CreateVeterinarianSampleInput,
    type UpdateVeterinarianSampleInput
} from "srf-shared-types";

export class VeterinarianSampleService {
    private auditService = new AuditService();
    private formId = 'amostras-av';

    async getAll(userId: string): Promise<GetAllVeterinarianSampleOutput[]> {
        const samples = await prisma.sampleAllocationVeterinarian.findMany({
            select: {
                id: true,
                veterinarianVisit: {
                    select: {
                        id: true, date: true,
                        liveAnimal: { select: { id: true, name: true } },
                        veterinarian: { select: { id: true, name: true } }
                    }
                },
                sampleType: {
                    select: { id: true, description: true }
                },
                status: {
                    select: { id: true, name: true }
                },
                storage: {
                    select: { id: true, name: true }
                },
                quantity: true,
                imageLink: true,
                note: true,
                sendSampleVeterinarian: {
                    select: {
                        id: true,
                        storage: {
                            select: { id: true, name: true }
                        },
                        status: {
                            select: { id: true, name: true }
                        },
                        quantity: true,
                        sendDate: true,
                        note: true
                    }
                }
            },
            orderBy: {
                veterinarianVisit: {
                    date: 'desc'
                }
            }
        });

        const sampleIds = samples.map(s => s.id);

        const createLogs = await prisma.changeLog.findMany({
            where: {
                table: 'sampleAllocationVeterinarian',
                recordId: { in: sampleIds.map(String) },
                action: 'CREATE',
            },
            select: {
                recordId: true,
                auditLog: { select: { userId: true } }
            }
        });
        const creatorMap = new Map<string, string>();
        for (const log of createLogs) {
            creatorMap.set(log.recordId, log.auditLog.userId);
        }

        const samplesWithPermission = await Promise.all(
            samples.map(async (s) => {
                const permission = await this.auditService.canUserEditRecord(userId, 'sampleAllocationVeterinarian', String(s.id), this.formId);
                return {
                    id: s.id,
                    canEdit: permission.canEdit,
                    createdByMe: creatorMap.get(String(s.id)) === userId,
                    veterinarianVisitId: s.veterinarianVisit.id,
                    veterinarianVisitDate: s.veterinarianVisit.date.toISOString(),
                    liveAnimalId: s.veterinarianVisit.liveAnimal.id,
                    liveAnimalName: s.veterinarianVisit.liveAnimal.name,
                    veterinarianId: s.veterinarianVisit.veterinarian.id,
                    veterinarianName: s.veterinarianVisit.veterinarian.name,
                    sampleTypeId: s.sampleType.id,
                    sampleTypeDescription: s.sampleType.description,
                    statusId: s.status.id,
                    statusName: s.status.name,
                    storageId: s.storage.id,
                    storageName: s.storage.name,
                    quantity: s.quantity,
                    imageLink: s.imageLink || undefined,
                    note: s.note || undefined,
                    sendSamples: s.sendSampleVeterinarian.map(sends => ({
                        id: sends.id,
                        storageId: sends.storage.id,
                        storageName: sends.storage.name,
                        statusId: sends.status.id,
                        statusName: sends.status.name,
                        sendDate: sends.sendDate.toISOString(),
                        quantity: sends.quantity,
                        note: sends.note || undefined
                    }))
                };
            })
        );

        return samplesWithPermission;
    }

    async getFormOptions(): Promise<GetFormOptionsVeterinarianSampleOutput> {
        const [veterinarianVisits, sampleTypes, status, storages] = await Promise.all([
            prisma.veterinarianVisit.findMany({
                select: {
                    id: true,
                    date: true,
                    liveAnimal: { select: { id: true, name: true } },
                    veterinarian: { select: { id: true, name: true } }
                },
                orderBy: { date: 'desc' }
            }),
            prisma.veterinarianSampleType.findMany({
                select: { id: true, description: true },
                orderBy: { description: 'asc' }
            }),
            prisma.enumVeterinarianSampleAllocationStatus.findMany({
                select: { id: true, name: true },
                orderBy: { name: 'asc' }
            }),
            prisma.storage.findMany({
                select: { id: true, name: true },
                orderBy: { name: 'asc' }
            })
        ]);

        return {
            veterinarianVisits: veterinarianVisits.map(v => ({
                id: v.id,
                date: v.date.toISOString(),
                liveAnimal: v.liveAnimal,
                veterinarian: v.veterinarian
            })),
            sampleTypes, status, storages
        };
    }

    async create(data: CreateVeterinarianSampleInput, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se a amostra já existe
            const existingSample = await tx.sampleAllocationVeterinarian.findFirst({
                where: {
                    veterinarianVisitId: data.veterinarianVisitId,
                    sampleTypeId: data.sampleTypeId
                }
            });
            if (existingSample) throw new Error('Não é possível criar amostras que compartilhem visita veteriária e tipo.');

            // Cria a amostra veterinária
            const sample = await tx.sampleAllocationVeterinarian.create({
                data: {
                    veterinarianVisitId: data.veterinarianVisitId,
                    sampleTypeId: data.sampleTypeId,
                    storageId: data.storageId,
                    statusId: data.statusId,
                    quantity: data.quantity,
                    imageLink: data.imageLink || null,
                }
            });

            if (data.sendSamples) {
                // Verifica duplicidade de amostras enviadas
                data.sendSamples.forEach(sendSample => {
                    const countStorageId = data.sendSamples!.filter(sends => sends.storageId === sendSample.storageId).length;
                    if (countStorageId > 1) throw new Error('Não é possível enviar a mesma amostra para o mesmo local.')
                });
            }

            // Cria as amostras enviadas
            const sendSamples = [];
            if (data.sendSamples) {
                for (const sendSample of data.sendSamples) {
                    const sendSampleCreated = await tx.sendSampleVeterinarian.create({
                        data: {
                            sampleAllocationVeterinarianId: sample.id,
                            storageId: sendSample.storageId,
                            statusId: sendSample.statusId,
                            quantity: sendSample.quantity,
                            sendDate: sendSample.sendDate,
                            note: sendSample.note || null
                        }
                    });
                    sendSamples.push(sendSampleCreated);
                }
            }

            // Audit log
            const changes = [
                {
                    table: 'sampleAllocationVeterinarian',
                    recordId: String(sample.id),
                    action: 'CREATE' as const,
                    newData: sample

                },
                ...sendSamples.map(sendSample => ({
                    table: 'sendSampleVeterinarian',
                    recordId: String(sendSample.id),
                    action: 'CREATE' as const,
                    newData: sendSample
                }))
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', changes);

            return { sample, sendSamples };
        });
    }

    async update(recordId: number, data: UpdateVeterinarianSampleInput, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se a amostra veterinária existe
            const existingSample = await tx.sampleAllocationVeterinarian.findUnique({
                where: { id: recordId }
            });
            if (!existingSample) throw new Error('Amostra veterinária não encontrada.');

            // Verifica se a amostra veterinária já existe
            const existingSampleWithSameData = await tx.sampleAllocationVeterinarian.findFirst({
                where: {
                    veterinarianVisitId: data.veterinarianVisitId,
                    sampleTypeId: data.sampleTypeId,
                    id: { not: recordId }
                }
            });
            if (existingSampleWithSameData) throw new Error('Não é possível atualizar amostras que compartilhem visita veteriária e tipo.');

            // Atualiza a amostra veterinária
            const sample = await tx.sampleAllocationVeterinarian.update({
                where: { id: recordId },
                data: {
                    veterinarianVisitId: data.veterinarianVisitId,
                    sampleTypeId: data.sampleTypeId,
                    storageId: data.storageId,
                    statusId: data.statusId,
                    quantity: data.quantity,
                    imageLink: data.imageLink || null,
                }
            });

            if (data.sendSamples) {
                // Verifica duplicidade de amostras enviadas
                data.sendSamples.forEach(sendSample => {
                    const countStorageId = data.sendSamples!.filter(sends => sends.storageId === sendSample.storageId).length;
                    if (countStorageId > 1) throw new Error('Não é possível enviar a mesma amostra para o mesmo local.')
                });
            }

            // Atualiza as amostras enviadas
            const sendSamples = [];
            if (data.sendSamples) {
                for (const sendSample of data.sendSamples) {
                    const sendSampleUpdated = await tx.sendSampleVeterinarian.update({
                        where: { id: sendSample.id },
                        data: {
                            sampleAllocationVeterinarianId: sample.id,
                            storageId: sendSample.storageId,
                            statusId: sendSample.statusId,
                            quantity: sendSample.quantity,
                            sendDate: sendSample.sendDate,
                            note: sendSample.note || null
                        }
                    });
                    sendSamples.push(sendSampleUpdated);
                }
            }

            // Audit log
            const changes = [
                {
                    table: 'sampleAllocationVeterinarian',
                    recordId: String(sample.id),
                    action: 'UPDATE' as const,
                    newData: sample

                },
                ...sendSamples.map(sendSample => ({
                    table: 'sendSampleVeterinarian',
                    recordId: String(sendSample.id),
                    action: 'UPDATE' as const,
                    newData: sendSample
                }))
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', changes);

            return { sample, sendSamples };
        });
    }

    async delete(recordId: number, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se a amostra veterinária existe
            const existingSample = await tx.sampleAllocationVeterinarian.findUnique({
                where: { id: recordId },
                include: {
                    sendSampleVeterinarian: true
                }
            });
            if (!existingSample) throw new Error('Amostra veterinária não encontrada.');

            // Salva dados para o audit log
            const oldData = {
                ...existingSample,
                sendSamples: existingSample.sendSampleVeterinarian
            };

            // Verifica se há algum registro ligado a amostra (que não seja amostras enviadas)
            // Atualmente não há registros "fora" da página de amostra veterinária que dependam dela.

            // Deleta as amostras enviadas
            await tx.sendSampleVeterinarian.deleteMany({
                where: { sampleAllocationVeterinarianId: recordId }
            });

            // Deleta a amostra veterinária
            await tx.sampleAllocationVeterinarian.delete({
                where: { id: recordId }
            });

            // Audit log
            const changes = [
                ...oldData.sendSamples.map(sendSample => ({
                    table: 'sendSampleVeterinarian',
                    recordId: String(sendSample.id),
                    action: 'DELETE' as const,
                    oldData: sendSample
                })),
                {
                    table: 'sampleAllocationVeterinarian',
                    recordId: String(recordId),
                    action: 'DELETE' as const,
                    oldData: oldData
                }
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'DELETE', changes);

            return { message: 'Amostra veterinária deletada com sucesso.' };
        });
    }

}