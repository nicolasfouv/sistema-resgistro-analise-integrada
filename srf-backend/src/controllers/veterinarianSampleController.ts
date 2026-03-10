import { Request, Response } from "express";
import { VeterinarianSampleService } from "../services/veterinarianSampleService";

class VeterinarianSampleController {

    async getAll(req: Request, res: Response) {
        try {
            const samples = await new VeterinarianSampleService().getAll(req.userId);
            return res.status(200).json(samples);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }

    // async getFormOptions(req: Request, res: Response) {
    //     try {
    //         const options = await new VeterinarianSampleService().getFormOptions();
    //         return res.status(200).json(options);
    //     } catch (error: any) {
    //         console.error(error);
    //         return res.status(500).json({ error: error.message });
    //     }
    // }

    // async create(req: Request, res: Response) {
    //     try {
    //         const { visitId, sampleTypeId, date, statusId, storageId, quantity, note } = req.body;

    //         if (!visitId || !sampleTypeId || !statusId || !storageId || !quantity) {
    //             return res.status(400).json({ error: "Campos obrigatórios não informados" });
    //         }

    //         const sample = await new VeterinarianSampleService().create(
    //             { visitId, sampleTypeId, date, statusId, storageId, quantity, note },
    //             req.userId
    //         );
    //         return res.status(201).json(sample);
    //     } catch (error: any) {
    //         console.error(error);
    //         return res.status(500).json({ error: error.message });
    //     }
    // }

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
