import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { VeterinarianSampleController } from "../controllers/veterinarianSampleController";

export const veterinarianSampleRoutes = Router();

const veterinarianSampleController = new VeterinarianSampleController();

veterinarianSampleRoutes.get('/veterinarian-sample/get-all', authMiddleware(), veterinarianSampleController.getAll);