import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { GroupController } from "../controllers/groupController";

export const groupRoutes = Router();

const groupController = new GroupController();

groupRoutes.get('/group/get-all', authMiddleware('admin'), groupController.getAllGroups);