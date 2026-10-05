import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { DewormingController } from "../controllers/liveanimals/dewormingController";

export const dewormingRoutes = Router();
const dewormingController = new DewormingController();

dewormingRoutes.get('/deworming/get-all', authMiddleware(), dewormingController.getAll);
dewormingRoutes.get('/deworming/get-form-options', authMiddleware(), dewormingController.getFormOptions);
dewormingRoutes.post('/deworming/create', authMiddleware(), dewormingController.create);
dewormingRoutes.put('/deworming/update/:recordId', authMiddleware(), dewormingController.update);
dewormingRoutes.delete('/deworming/delete/:recordId', authMiddleware(), dewormingController.delete);
