import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { AuditController } from "../controllers/auditController";

export const auditRoutes = Router();

const auditController = new AuditController();

auditRoutes.get('/audit/can-edit', authMiddleware(), auditController.checkEditPermission);