import { api } from "./api";

export async function getNavigationOptions() {
    const request = await api.get('/navigation/options');
    return request.data;
}

export async function getForms() {
    const request = await api.get('/form/get-all');
    return request.data;
}

export async function getAccessLevelOptions() {
    const request = await api.get('/access-level/get-all');
    return request.data;
}