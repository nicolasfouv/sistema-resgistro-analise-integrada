import { Request, Response } from "express";
import { ZodError } from "zod";
import { DewormingService } from "../../services/liveanimals/dewormingService";
import { AuditService } from "../../services/auditService";
import { type CreateDewormingInput, type UpdateDewormingInput } from "srf-shared-types";

export class DewormingController {
    private auditService = new AuditService();
    private dewormingService = new DewormingService();
    private formId = 'vermifugacao' as const;

    getAll = async (req: Request, res: Response) => {
        try {
            const records = await this.dewormingService.getAll(req.userId as string);
            return res.status(200).json(records);
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            return res.status(500).json({ error: error.message });
        }
    };

    getFormOptions = async (_req: Request, res: Response) => {
        try {
            return res.status(200).json(await this.dewormingService.getFormOptions());
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            return res.status(500).json({ error: error.message });
        }
    };

    create = async (req: Request, res: Response) => {
        try {
            const requesterId = req.userId as string;
            const permission = await this.auditService.canUserCreateRecord(requesterId, this.formId);
            if (!permission.canCreate) return res.status(403).json({ error: permission.reason });
            const result = await this.dewormingService.create(req.body as CreateDewormingInput, requesterId);
            return res.status(201).json(result);
        } catch (error: any) {
            console.error(error);
            if (error.code === 'P2002') {
                return res.status(400).json({ error: 'Este animal já possui uma vermifugação registrada.' });
            }
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Animal não encontrado.' || error.message === 'Responsável não encontrado.' || error.message === 'Medicamento não encontrado.' || error.message === 'Visita veterinária não encontrada.') {
                return res.status(404).json({ error: error.message });
            }
            if (error.message === 'A data de fim deve ser igual ou posterior à data de início.' || error.message === 'Informe datas válidas para a vermifugação.' || error.message === 'A visita veterinária deve pertencer ao animal selecionado.' || error.message === 'A data de início da vermifugação deve ser a mesma da visita veterinária associada.' || error.message === 'Esta visita veterinária já possui uma vermifugação associada.' || error.message === 'Este animal já possui uma vermifugação registrada.') {
                return res.status(400).json({ error: error.message });
            }
            return res.status(500).json({ error: error.message });
        }
    };

    update = async (req: Request, res: Response) => {
        try {
            const recordId = req.params.recordId as string;
            const requesterId = req.userId as string;
            const permission = await this.auditService.canUserEditRecord(requesterId, 'deworming', recordId, this.formId);
            if (!permission.canEdit) return res.status(403).json({ error: permission.reason });
            const result = await this.dewormingService.update(Number(recordId), req.body as UpdateDewormingInput, requesterId);
            return res.status(200).json(result);
        } catch (error: any) {
            console.error(error);
            if (error.code === 'P2002') {
                return res.status(400).json({ error: 'Este animal já possui uma vermifugação registrada.' });
            }
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Vermifugação não encontrada.' || error.message === 'Animal não encontrado.' || error.message === 'Responsável não encontrado.' || error.message === 'Medicamento não encontrado.' || error.message === 'Visita veterinária não encontrada.') {
                return res.status(404).json({ error: error.message });
            }
            if (error.message === 'A data de fim deve ser igual ou posterior à data de início.' || error.message === 'Informe datas válidas para a vermifugação.' || error.message === 'A visita veterinária deve pertencer ao animal selecionado.' || error.message === 'A data de início da vermifugação deve ser a mesma da visita veterinária associada.' || error.message === 'Esta visita veterinária já possui uma vermifugação associada.' || error.message === 'Este animal já possui uma vermifugação registrada.') {
                return res.status(400).json({ error: error.message });
            }
            return res.status(500).json({ error: error.message });
        }
    };

    delete = async (req: Request, res: Response) => {
        try {
            const recordId = req.params.recordId as string;
            const requesterId = req.userId as string;
            const permission = await this.auditService.canUserEditRecord(requesterId, 'deworming', recordId, this.formId);
            if (!permission.canEdit) return res.status(403).json({ error: permission.reason });
            return res.status(200).json(await this.dewormingService.delete(Number(recordId), requesterId));
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Vermifugação não encontrada.') return res.status(404).json({ error: error.message });
            if (error.message.includes('Foreign key constraint violated')) {
                return res.status(400).json({ error: 'Não é possível excluir pois existem outros registros vinculados. Remova os registros antes de excluir.' });
            }
            return res.status(500).json({ error: error.message });
        }
    };
}
