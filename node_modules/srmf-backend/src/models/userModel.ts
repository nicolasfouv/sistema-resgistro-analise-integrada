import z from "zod";

export const createUserRequest = z.object({
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});


export const updateUserDetailsRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    role: z.string().nonempty({ error: 'Função inválida' }),
});

export const updateUserPicRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    userPic: z.string().optional(),
});

const userAccessProps = z.object({
    formId: z.string().nonempty({ error: 'ID do furmulário inválido' }),
    accessLevelId: z.string().optional(),
});

export const updateUserAccessRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    userAccess: z.array(userAccessProps),
});

export const updateUserPasswordRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});

export const loginRequest = z.object({
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});