import { prisma } from "..";
import { AuditService } from "./auditService";

interface SampleInput {
    visitId: string,
    sampleTypeId: string,
    date: string | null,
    statusId: string,
    storageId: string,
    quantity: number,
    note: string | null,
}

export class VeterinarianSampleService {
    private auditService = new AuditService();
    private formId = 'amostras-av';

    async getAll(userId: string) {
        const samples = await prisma.sampleAllocationVeterinarian.findMany({
            select: {
                id: true,
                veterinarianVisit: { select: { id: true, date: true } },
                sampleType: { select: { id: true, description: true } },
                sendDate: true,
                status: { select: { id: true, name: true } },
                storage: { select: { id: true, name: true } },
                //quantity: true, for necropsy
                note: true,
            },
            orderBy: {
                veterinarianVisit: {
                    date: 'desc'
                }
            }
        });

        const samplesWithPermission = await Promise.all(
            samples.map(async (s) => {
                const permission = await this.auditService.canUserEditRecord(userId, 'sampleAllocationVeterinarian', s.id, this.formId);
                return {
                    id: s.id,
                    canEdit: permission.canEdit,
                    veterinarianVisitId: s.veterinarianVisit.id,
                    veterinarianVisitDate: s.veterinarianVisit.date,
                    sampleTypeId: s.sampleType.id,
                    sampleTypeDescription: s.sampleType.description,
                    sendDate: s.sendDate,
                    statusId: s.status.id,
                    statusName: s.status.name,
                    storageId: s.storage.id,
                    storageName: s.storage.name,
                    note: s.note,
                };
            })
        );

        return samplesWithPermission;
    }

}