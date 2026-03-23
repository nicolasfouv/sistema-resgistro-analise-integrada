import { Request, Response } from "express";
import { GroupService } from "../services/groupService";


export class GroupController {
    async getAllGroups(req: Request, res: Response) {
        const groupService = new GroupService()
        const groups = await groupService.getAllGroups();
        return res.status(200).json(groups);
    }
}