import { prisma } from "..";
import { createApplicantRequest } from "../models/applicantModel";
import { UserService } from "./userService";

class ApplicantService {

    async createApplicant(data: any) {
        const { name, email, password, message } = createApplicantRequest.parse(data);

        // Verificações
        const emailAlreadyExists = await prisma.user.findUnique({
            where: { email: email.toLowerCase() }
        }) || await prisma.applicant.findUnique({
            where: { email: email.toLowerCase() }
        });
        if (emailAlreadyExists) throw new Error('Email já utilizado');

        // Criação do solicitante
        const applicant = await prisma.applicant.create({
            data: {
                name: name,
                email: email.toLowerCase(),
                password: password,
                message: message || null,
            },
            select: {
                id: true,
                name: true,
                email: true,
                message: true,
            }
        });
        return applicant;
    }

    async getApplicants() {
        const applicants = await prisma.applicant.findMany({
            select: {
                id: true,
                name: true,
                email: true,
                date: true,
                message: true,
            }
        });
        return applicants;
    }

    async acceptApplicant(id: string) {
        if (!id) throw new Error('Identificador (ID) é obrigatório');

        const applicant = await prisma.applicant.findUnique({ where: { id: id } });
        if (!applicant) throw new Error('Solicitante não encontrado');

        const userService = new UserService();
        const userData = {
            name: applicant.name,
            email: applicant.email.toLowerCase(),
            password: applicant.password,
        }
        const user = await userService.createUser(userData);
        await prisma.applicant.delete({ where: { id: id } });

        return user;
    }

    async rejectApplicant(id: string) {
        // Verificações
        if (!id) throw new Error('Identificador (ID) é obrigatório');

        const applicant = await prisma.applicant.findUnique({ where: { id: id } });
        if (!applicant) throw new Error('Solicitante não encontrado');

        // Remoção do solicitante
        const deletedApplicant = await prisma.applicant.delete({ where: { id: id } });
        return deletedApplicant;
    }

}

export { ApplicantService };