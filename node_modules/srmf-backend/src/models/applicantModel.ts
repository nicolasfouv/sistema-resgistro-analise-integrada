import z from "zod";

export const createApplicantRequest = z.object({
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
    message: z.string().optional(),
});