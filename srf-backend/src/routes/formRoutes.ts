import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { FormController } from "../controllers/formController";

export const formRoutes = Router();

const formController = new FormController();

formRoutes.get('/navigation/options', authMiddleware(), formController.getNavigationOptions);
formRoutes.get('/form/get-all', authMiddleware(), formController.getForms);
formRoutes.get('/access-level/get-all', authMiddleware(), formController.getAccessLevel);