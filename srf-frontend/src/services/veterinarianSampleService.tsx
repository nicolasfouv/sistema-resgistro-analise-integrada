import { api } from "./api";

export interface VeterinarianSampleData {
    id: string,
    canEdit: boolean,
    veterinarianVisitId: string,
    sampleTypeId: string,
    sampleTypeDescription: string,
    sendDate?: string,
    sendDateFormatted?: string,
    statusId: string,
    statusName: string,
    storageId: string,
    storageName: string,
    note?: string,
}

export interface VeterinarianSampleFormOptions {
    veterinarianVisit: { id: string },
    sampleType: { id: string, description: string },
    status: { id: string, name: string },
    storage: { id: string, name: string },
}

export async function getVeterinarianSamples(): Promise<VeterinarianSampleData[]> {
    const response = await api.get('/veterinarian-sample/get-all');
    return response.data;
}