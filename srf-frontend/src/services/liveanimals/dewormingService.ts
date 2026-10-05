import { api } from "../api";
import {
    type CreateDewormingInput,
    type GetAllDewormingOutput,
    type GetFormOptionsDewormingOutput,
    type UpdateDewormingInput
} from "srf-shared-types";

export async function getDewormings(): Promise<GetAllDewormingOutput[]> {
    const response = await api.get('/deworming/get-all');
    return response.data;
}

export async function getDewormingFormOptions(): Promise<GetFormOptionsDewormingOutput> {
    const response = await api.get('/deworming/get-form-options');
    return response.data;
}

export async function createDeworming(data: CreateDewormingInput) {
    const response = await api.post('/deworming/create', data);
    return response.data;
}

export async function updateDeworming(recordId: number, data: UpdateDewormingInput) {
    const response = await api.put(`/deworming/update/${recordId}`, data);
    return response.data;
}

export async function deleteDeworming(recordId: number) {
    const response = await api.delete(`/deworming/delete/${recordId}`);
    return response.data;
}
