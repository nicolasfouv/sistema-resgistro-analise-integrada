import { api } from "./api";

export interface VeterinarianVisitData {
    id: string;
    canEdit: boolean;
    liveAnimalId: string;
    liveAnimalName: string;
    veterinarianId: string;
    veterinarianName: string;
    date: string;
    dateFormatted?: string;
    cardLink: string;
    bodyMeasurements: BodyMeasurementData[];
}

export interface BodyMeasurementData {
    id?: string;
    bodyMeasurementTypeId: string;
    bodyMeasurementTypeDescription?: string;
    bodyMeasurementTypeUnit?: string;
    value: number;
}

export interface VeterinarianVisitFormOptions {
    liveAnimals: { id: string; name: string }[];
    veterinarians: { id: string; name: string }[];
    bodyMeasurementTypes: { id: string; description: string; unit: string }[];
}

export async function getVeterinarianVisits(): Promise<VeterinarianVisitData[]> {
    const response = await api.get('/veterinarian-visit/get-all');
    return response.data;
}

export async function getVeterinarianVisitOptions(): Promise<VeterinarianVisitFormOptions> {
    const response = await api.get('/veterinarian-visit/options');
    return response.data;
}

export async function createVeterinarianVisit(data: {
    id: string,
    liveAnimalId: string,
    veterinarianId: string,
    date: string,
    cardLink: string,
    bodyMeasurements: { bodyMeasurementTypeId: string; value: number }[];
}) {
    const response = await api.post('/veterinarian-visit/create', data);
    return response.data;
}

export async function updateVeterinarianVisit(visitId: string, data: {
    liveAnimalId: string,
    veterinarianId: string,
    date: string,
    cardLink: string,
    bodyMeasurements: { bodyMeasurementTypeId: string; value: number }[],
}) {
    const response = await api.put(`/veterinarian-visit/update/${visitId}`, data);
    return response.data;
}

export async function deleteVeterinarianVisit(id: string) {
    const response = await api.delete(`/veterinarian-visit/delete/${id}`);
    return response.data;
}
