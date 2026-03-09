import { Request, Response } from "express";
import { VeterinarianVisitService } from "../services/veterinarianVisitService";

class VeterinarianVisitController {

    async getAll(req: Request, res: Response) {
        try {
            const visits = await new VeterinarianVisitService().getAll(req.userId);
            return res.status(200).json(visits);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }

    async getFormOptions(req: Request, res: Response) {
        try {
            const options = await new VeterinarianVisitService().getFormOptions();
            return res.status(200).json(options);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }

    async create(req: Request, res: Response) {
        try {
            const { id, liveAnimalId, veterinarianId, date, cardLink, bodyMeasurements } = req.body;

            if (!liveAnimalId || !veterinarianId || !date) {
                return res.status(400).json({ error: "Campos obrigatórios não informados" });
            }

            const visit = await new VeterinarianVisitService().create(
                { id, liveAnimalId, veterinarianId, date, cardLink, bodyMeasurements: bodyMeasurements || [] },
                req.userId
            );
            return res.status(201).json(visit);
        } catch (error: any) {
            console.error(error);
            if (error.message)
                if (error.message === 'Visita veterinária já existe' || 'O ID deve ser fornecido') return res.status(400).json({ error: error.message });
            return res.status(500).json({ error: error.message });
        }
    }

    async update(req: Request, res: Response) {
        try {
            const { id } = req.params;
            const { liveAnimalId, veterinarianId, date, cardLink, bodyMeasurements } = req.body;

            if (!liveAnimalId || !veterinarianId || !date) {
                return res.status(400).json({ error: "Campos obrigatórios não informados" });
            }

            const visit = await new VeterinarianVisitService().update(
                String(id),
                { liveAnimalId, veterinarianId, date, cardLink, bodyMeasurements: bodyMeasurements || [] },
                req.userId
            );
            return res.status(200).json(visit);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }

    async delete(req: Request, res: Response) {
        try {
            const { id } = req.params;
            const result = await new VeterinarianVisitService().delete(String(id), req.userId);
            return res.status(200).json(result);
        } catch (error: any) {
            console.error(error);
            return res.status(500).json({ error: error.message });
        }
    }
}

export { VeterinarianVisitController };
