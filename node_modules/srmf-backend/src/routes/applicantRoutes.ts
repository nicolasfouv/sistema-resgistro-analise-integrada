import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { ApplicantController } from "../controllers/applicantController";

export const applicantRoutes = Router();

const applicantController = new ApplicantController();

applicantRoutes.get('/applicant/get-all', authMiddleware('admin'), applicantController.getApplicants);
applicantRoutes.post('/applicant/create', applicantController.createApplicant);
applicantRoutes.post('/applicant/accept', authMiddleware('admin'), applicantController.acceptApplicant);
applicantRoutes.delete('/applicant/reject', authMiddleware('admin'), applicantController.rejectApplicant);

