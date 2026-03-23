import { Router } from "express";
import { userRoutes } from "./userRoutes";
import { applicantRoutes } from "./applicantRoutes";
import { groupRoutes } from "./groupRoutes";
import { formRoutes } from "./formRoutes";
import { auditRoutes } from "./auditRoutes";
import { veterinarianVisitRoutes } from "./veterinarianVisitRoutes";
import { veterinarianSampleRoutes } from "./veterinarianSampleRoutes";

export const router = Router();

router.use(userRoutes);
router.use(applicantRoutes);
router.use(groupRoutes);
router.use(formRoutes);
router.use(auditRoutes);
router.use(veterinarianVisitRoutes);
router.use(veterinarianSampleRoutes);
