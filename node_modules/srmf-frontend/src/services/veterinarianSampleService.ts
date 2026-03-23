import { api } from "./api";

export interface VeterinarianSampleData {
    id: number,
    canEdit: boolean,
    createdByMe: boolean,
    veterinarianVisitId: number,
    sampleTypeId: number,
    sampleTypeDescription: string,
    sendDate?: string,
    sendDateFormatted?: string,
    statusId: number,
    statusName: string,
    storageId: number,
    storageName: string,
    note?: string,
}

export interface VeterinarianSampleFormOptions {
    veterinarianVisit: { id: number },
    sampleType: { id: number, description: string },
    status: { id: number, name: string },
    storage: { id: number, name: string },
}

export async function getVeterinarianSamples(): Promise<VeterinarianSampleData[]> {
    const response = await api.get('/veterinarian-sample/get-all');
    return response.data;
}