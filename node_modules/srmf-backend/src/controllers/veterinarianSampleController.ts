import { Request, Response } from "express";
import { ZodError } from "zod";
import { VeterinarianSampleService } from "../services/veterinarianSampleService";
import { AuditService } from "../services/auditService";
import {
    type CreateVeterinarianSampleInput
} from "srf-shared-types";

class VeterinarianSampleController {
    private auditService = new AuditService();
    private veterinarianSampleService = new VeterinarianSampleService();
    private formId = 'amostras-av' as const;

    getAll = async (req: Request, res: Response) => {
        try {
            const samples = await this.veterinarianSampleService.getAll(req.userId);
            return res.status(200).json(samples);
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) {
                return res.status(400).json({ message: error.flatten().fieldErrors });
            }
            return res.status(500).json({ error: error.message });
        }
    }

    getFormOptions = async (req: Request, res: Response) => {
        try {
            const options = await this.veterinarianSampleService.getFormOptions();
            return res.status(200).json(options);
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) {
                return res.status(400).json({ message: error.flatten().fieldErrors });
            }
            return res.status(500).json({ error: error.message });
        }
    }

    create = async (req: Request, res: Response) => {
        try {
            const requesterId = req.userId as string;
            const permissionCheck = await this.auditService.canUserCreateRecord(requesterId, this.formId);
            if (!permissionCheck.canCreate) {
                return res.status(403).json({ error: permissionCheck.reason });
            }

            const { veterinarianVisitId, sampleTypeId, storageId, statusId, quantity, imageLink, note, sendSamples } = req.body as CreateVeterinarianSampleInput;

            const result = await this.veterinarianSampleService.create(
                { veterinarianVisitId, sampleTypeId, storageId, statusId, quantity, imageLink, note, sendSamples }, requesterId
            );
            return res.status(201).json(result);
        } catch (error: any) {
            console.error(error);
            if (error instanceof ZodError) {
                return res.status(400).json({ message: error.flatten().fieldErrors });
            }
            if (error.message === 'Não é possível criar amostras que compartilhem visita veteriária e tipo.') return res.status(400).json({ error: error.message });
            if (error.message === 'Não é possível enviar a mesma amostra para o mesmo local.') return res.status(400).json({ error: error.message });
            return res.status(500).json({ error: error.message });
        }
    }

    // async update(req: Request, res: Response) {
    //     try {
    //         const { id } = req.params;
    //         const { visitId, sampleTypeId, date, statusId, storageId, quantity, note } = req.body;

    //         if (!visitId || !sampleTypeId || !statusId || !storageId || !quantity) {
    //             return res.status(400).json({ error: "Campos obrigatórios não informados" });
    //         }

    //         const sample = await new VeterinarianSampleService().update(
    //             String(id),
    //             { visitId, sampleTypeId, date, statusId, storageId, quantity, note },
    //             req.userId
    //         );
    //         return res.status(200).json(sample);
    //     } catch (error: any) {
    //         console.error(error);
    //         return res.status(500).json({ error: error.message });
    //     }
    // }

    // async delete(req: Request, res: Response) {
    //     try {
    //         const { id } = req.params;
    //         const result = await new VeterinarianSampleService().delete(String(id), req.userId);
    //         return res.status(200).json(result);
    //     } catch (error: any) {
    //         console.error(error);
    //         return res.status(500).json({ error: error.message });
    //     }
    // }
}

export { VeterinarianSampleController };
