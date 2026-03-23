import { Request, Response } from "express";
import { ApplicantService } from "../services/applicantService";
import { ZodError } from "zod";

class ApplicantController {

    async createApplicant(req: Request, res: Response) {
        try {
            const data = req.body;
            const applicantService = new ApplicantService();
            const applicant = await applicantService.createApplicant(data);
            return res.status(201).json(applicant);
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            if (error.message === 'Email já utilizado') return res.status(409).json({ message: error.message });
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

    async getApplicants(req: Request, res: Response) {
        const applicantService = new ApplicantService();
        const applicants = await applicantService.getApplicants();
        return res.status(201).json(applicants);
    }

    async acceptApplicant(req: Request, res: Response) {
        try {
            const { id } = req.body;
            const applicantService = new ApplicantService();
            const user = await applicantService.acceptApplicant(id);
            return res.status(201).json(user)
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            if (error.message === 'Identificador (ID) é obrigatório' || error.message === 'Solicitante não encontrado') return res.status(400).json({ message: error.message });
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

    async rejectApplicant(req: Request, res: Response) {
        try {
            const id = req.query.applicant_id as string;
            const applicantService = new ApplicantService();
            await applicantService.rejectApplicant(id);
            return res.status(200).json({ message: 'Solicitante rejeitado' });
        } catch (error: any) {
            if (error.message === 'Identificador (ID) é obrigatório') return res.status(400).json({ message: error.message });
            if (error.message === 'Solicitante não encontrado') return res.status(400).json({ message: error.message });
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

}

export { ApplicantController };