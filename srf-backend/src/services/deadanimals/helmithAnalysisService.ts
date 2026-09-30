import { prisma } from "../..";
import { AuditService } from "../auditService";
import {
    type GetAllHelminthAnalysisOutput,
    type GetFormOptionsHelminthAnalysisOutput,
    type CreateHelminthAnalysisInput,
    type UpdateHelminthAnalysisInput
} from "srf-shared-types";

export class HelminthAnalysisService {
    private auditService = new AuditService();
    private formId = 'analisehelmintos';
    private tableName = 'helminthAnalysis';

    async getAll(userId: string): Promise<GetAllHelminthAnalysisOutput[]> {
        const analysis = await prisma.helminthAnalysis.findMany({
            select: {
                id: true,
                necropsy: {
                    select: {
                        id: true,
                        performedDate: true,
                        deadAnimal: { select: { id: true, code: true } }
                    }
                },
                helminthSpecie: { select: { id: true, name: true } },
                helmithAllocation: { select: { location: { select: { id: true, name: true } } } },
                maleQuantity: true,
                femaleQuantity: true,
                totalQuantity: true,
                note: true
            },
            orderBy: { necropsy: { performedDate: 'desc' } }
        });

        // Permissões
        const analysisIds = analysis.map(a => a.id);

        const createLogs = await prisma.changeLog.findMany({
            where: {
                table: this.tableName,
                recordId: { in: analysisIds.map(String) },
                action: 'CREATE'
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

        const analysisWithPermissions = await Promise.all(analysis.map(async (a) => {
            const permission = await this.auditService.canUserEditRecord(userId, this.tableName, String(a.id), this.formId);
            return {
                id: a.id,
                canEdit: permission.canEdit,
                createdByMe: creatorMap.get(String(a.id)) === userId,
                necropsyId: a.necropsy.id,
                necropsyDate: a.necropsy.performedDate.toISOString(),
                deadAnimalId: a.necropsy.deadAnimal.id,
                deadAnimalCode: a.necropsy.deadAnimal.code,
                helminthSpecieId: a.helminthSpecie.id,
                helminthSpecieName: a.helminthSpecie.name,
                locations: a.helmithAllocation.map(ha => ({ locationId: ha.location.id, locationName: ha.location.name })),
                maleQuantity: a.maleQuantity,
                femaleQuantity: a.femaleQuantity,
                totalQuantity: a.totalQuantity,
                note: a.note || undefined
            };
        }));

        return analysisWithPermissions;
    }

    async getFormOptions(): Promise<GetFormOptionsHelminthAnalysisOutput> {
        const [necropsies, helminthSpecies, locations] = await Promise.all([
            prisma.necropsy.findMany({
                select: {
                    id: true,
                    performedDate: true,
                    deadAnimal: { select: { id: true, code: true } }
                },
                orderBy: { performedDate: 'desc' }
            }),
            prisma.helminthSpecie.findMany({
                select: {
                    id: true,
                    name: true
                },
                orderBy: { name: 'asc' }
            }),
            prisma.helminthLocation.findMany({
                select: {
                    id: true,
                    name: true
                },
                orderBy: { name: 'asc' }
            })
        ]);

        return {
            necropsies: necropsies.map(n => ({
                id: n.id,
                performedDate: n.performedDate.toISOString(),
                deadAnimal: {
                    id: n.deadAnimal.id,
                    code: n.deadAnimal.code
                }
            })),
            helminthSpecies,
            locations
        }
    }

    async create(data: CreateHelminthAnalysisInput, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se já existe um registro de análise de helminto para esta necropsia e espécie de helminto
            const existingAnalysis = await tx.helminthAnalysis.findFirst({
                where: {
                    necropsyId: data.necropsyId,
                    helminthSpecieId: data.helminthSpecieId,
                }
            });
            if (existingAnalysis) throw new Error('Já existe um registro de análise de helminto para esta necropsia e espécie de helminto.');

            // Soma macho e femea e verifica se é maior que o total
            if (data.maleQuantity + data.femaleQuantity > data.totalQuantity) throw new Error('A soma de machos e fêmeas deve ser igual ou inferior ao total.');

            // Verifica se há locação informada
            if (data.locations.length === 0) throw new Error('Deve haver pelo menos uma localização informada.');

            // Cria o registro de análise de helminto
            const analysis = await tx.helminthAnalysis.create({
                data: {
                    necropsyId: data.necropsyId,
                    helminthSpecieId: data.helminthSpecieId,
                    maleQuantity: data.maleQuantity,
                    femaleQuantity: data.femaleQuantity,
                    totalQuantity: data.totalQuantity,
                    note: data.note || null
                }
            });

            const allocation = await Promise.all(data.locations.map(async (location) => {
                return tx.helmithAllocation.create({
                    data: {
                        helminthAnalysisId: analysis.id,
                        locationId: location.locationId
                    }
                });
            }));

            // Audit log
            const changes = [
                {
                    table: this.tableName,
                    recordId: String(analysis.id),
                    action: 'CREATE' as const,
                    newData: analysis
                }
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', changes);

            return { analysis };
        });
    }

    async update(recordId: number, data: UpdateHelminthAnalysisInput, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se a análise de helminto existe
            const existingAnalysis = await tx.helminthAnalysis.findUnique({
                where: {
                    id: recordId
                }
            });
            if (!existingAnalysis) throw new Error('Análise de helminto não encontrada.');

            // Verifica se já existe um registro de análise de helminto para esta necropsia e espécie de helminto
            const existingAnalysisForNecropsyAndSpecie = await tx.helminthAnalysis.findFirst({
                where: {
                    necropsyId: data.necropsyId,
                    helminthSpecieId: data.helminthSpecieId,
                    id: { not: recordId }
                }
            });
            if (existingAnalysisForNecropsyAndSpecie) throw new Error('Já existe um registro de análise de helminto para esta necropsia e espécie de helminto.');

            // Soma macho e femea e verifica se é maior que o total
            if (data.maleQuantity + data.femaleQuantity > data.totalQuantity) throw new Error('A soma de machos e fêmeas deve ser igual ou inferior ao total.');

            // Verifica se há locação informada
            if (data.locations.length === 0) throw new Error('Deve haver pelo menos uma localização informada.');

            // Atualiza o registro de análise de helminto
            const analysis = await tx.helminthAnalysis.update({
                where: {
                    id: recordId
                },
                data: {
                    necropsyId: data.necropsyId,
                    helminthSpecieId: data.helminthSpecieId,
                    maleQuantity: data.maleQuantity,
                    femaleQuantity: data.femaleQuantity,
                    totalQuantity: data.totalQuantity,
                    note: data.note || null
                }
            });

            // Remove as localizações existentes
            await tx.helmithAllocation.deleteMany({
                where: {
                    helminthAnalysisId: recordId
                }
            });

            // Cria as novas localizações
            await Promise.all(data.locations.map(async (location) => {
                return tx.helmithAllocation.create({
                    data: {
                        helminthAnalysisId: recordId,
                        locationId: location.locationId
                    }
                });
            }));

            // Audit log
            const changes = [
                {
                    table: this.tableName,
                    recordId: String(analysis.id),
                    action: 'UPDATE' as const,
                    oldData: existingAnalysis,
                    newData: analysis
                }
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'SUBMIT', changes);

            return { analysis };
        });
    }

    async delete(recordId: number, requesterId: string) {
        return prisma.$transaction(async (tx) => {
            // Verifica se a análise de helminto existe
            const existingAnalysis = await tx.helminthAnalysis.findUnique({
                where: {
                    id: recordId
                }
            });
            if (!existingAnalysis) throw new Error('Análise de helminto não encontrada.');

            // Remove as alocações
            await tx.helmithAllocation.deleteMany({
                where: {
                    helminthAnalysisId: recordId
                }
            });

            // Remove a análise de helminto
            await tx.helminthAnalysis.delete({
                where: {
                    id: recordId
                }
            });

            // Audit log
            const changes = [
                {
                    table: this.tableName,
                    recordId: String(recordId),
                    action: 'DELETE' as const,
                    oldData: existingAnalysis
                }
            ];
            await this.auditService.logTransaction(requesterId, this.formId, 'DELETE', changes);

            return { message: 'Registro deletado com sucesso.' };
        });
    }
}