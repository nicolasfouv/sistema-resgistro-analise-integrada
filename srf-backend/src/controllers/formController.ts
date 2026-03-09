import { Request, Response } from "express";
import { FormService } from "../services/formService";

class FormController {

    async getNavigationOptions(req: Request, res: Response) {
        const formService = new FormService();
        const options = await formService.getNavigationOptions();
        return res.status(200).json(options);
    }

    async getForms(req: Request, res: Response) {
        const formService = new FormService();
        const forms = await formService.getForms();
        return res.status(200).json(forms);
    }

    async getAccessLevel(req: Request, res: Response) {
        const formService = new FormService();
        const accessLevel = await formService.getAccessLevel();
        return res.status(200).json(accessLevel);
    }

}

export { FormController };