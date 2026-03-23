import { api } from "./api";

export async function checkEditPermission(table: string, recordId: string, formId: string): Promise<{ canEdit: boolean; reason: string }> {
    const response = await api.get('/audit/can-edit', { params: { table, recordId, formId } });
    return response.data;
}
