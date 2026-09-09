import z from 'zod';
export declare const createApplicantInputSchema: z.ZodObject<{
    name: z.ZodString;
    email: z.ZodString;
    password: z.ZodString;
    message: z.ZodOptional<z.ZodString>;
}, z.z.core.$strip>;
export declare const getAllApplicantOutputSchema: z.ZodObject<{
    id: z.ZodString;
    name: z.ZodString;
    email: z.ZodString;
    date: z.ZodString;
    message: z.ZodOptional<z.ZodString>;
}, z.z.core.$strip>;
export type CreateApplicantInput = z.infer<typeof createApplicantInputSchema>;
export type GetAllApplicantOutput = z.infer<typeof getAllApplicantOutputSchema>;
//# sourceMappingURL=applicant.d.ts.map