import z from "zod";

export const userSchema = z.object({
    id: z.string().nonempty({ error: 'ID do usuário inválido' }),
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
    roleId: z.string().nonempty({ error: 'ID da função inválido' }),
    userPic: z.string().optional(),
});

export const userLoginSchema = userSchema.pick({
    email: true,
    password: true
});

export const createUserInputSchema = userSchema.pick({
    name: true,
    email: true,
    password: true
});

export const updateUserDetailsInputSchema = userSchema.pick({
    id: true,
    name: true,
    email: true
}).extend({
    roleName: z.string().nonempty({ error: 'Nome da função inválido' })
});

export const updateUserPicInputSchema = userSchema.pick({
    id: true,
    userPic: true
});

export const updateUserPasswordInputSchema = userSchema.pick({
    id: true,
    password: true
});

export const userAccessPropsSchema = z.object({
    formId: z.string().nonempty({ error: 'ID do formulário inválido' }),
    accessLevelId: z.string().optional(),
});

export const updateUserAccessInputSchema = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    userAccess: z.array(userAccessPropsSchema),
});

export type User = z.infer<typeof userSchema>;
export type UserLoginInput = z.infer<typeof userLoginSchema>;
export type CreateUserInput = z.infer<typeof createUserInputSchema>;
export type UpdateUserDetailsInput = z.infer<typeof updateUserDetailsInputSchema>;
export type UpdateUserPicInput = z.infer<typeof updateUserPicInputSchema>;
export type UpdateUserPasswordInput = z.infer<typeof updateUserPasswordInputSchema>;
export type UserAccessProps = z.infer<typeof userAccessPropsSchema>;
export type UpdateUserAccessInput = z.infer<typeof updateUserAccessInputSchema>;