
import { Request, Response } from "express";
import { AuditService } from "../services/auditService";

class AuditController {

    // For testing purposes - in a real app this would be internal or triggered by business logic
    async createLog(req: Request, res: Response) {
        try {
            const { userId, formId, actionType, changes } = req.body;
            if (!userId || !formId || !actionType || !changes) {
                return res.status(400).json({ error: "Campos obrigatórios não informados" });
            }

            const log = await new AuditService().logTransaction(userId, formId, actionType, changes);
            return res.status(201).json(log);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }

    async checkEditPermission(req: Request, res: Response) {
        try {
            const { table, recordId, formId } = req.query;
            const userId = req.userId;

            if (!table || !recordId || !formId) {
                return res.status(400).json({ error: "table, recordId e formId são obrigatórios" });
            }

            const result = await new AuditService().canUserEditRecord(userId, String(table), String(recordId), String(formId));
            return res.status(200).json(result);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }
}

export { AuditController };
