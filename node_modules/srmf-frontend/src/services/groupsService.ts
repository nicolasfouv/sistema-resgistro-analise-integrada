import { api } from "./api";

export async function getGroups() {
    const response = await api.get('/group/get-all');
    return response.data;
}