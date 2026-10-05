import z from 'zod';
export declare const dewormingSchema: z.ZodObject<{
    id: z.ZodNumber;
    liveAnimalId: z.ZodNumber;
    assigneeId: z.ZodNumber;
    veterinarianVisitId: z.ZodOptional<z.ZodNumber>;
    startDate: z.ZodString;
    endDate: z.ZodOptional<z.ZodString>;
    medicationId: z.ZodNumber;
    note: z.ZodOptional<z.ZodString>;
}, z.z.core.$strip>;
export declare const createDewormingInputSchema: z.ZodObject<{
    liveAnimalId: z.ZodNumber;
    veterinarianVisitId: z.ZodOptional<z.ZodNumber>;
    assigneeId: z.ZodNumber;
    note: z.ZodOptional<z.ZodString>;
    startDate: z.ZodString;
    endDate: z.ZodOptional<z.ZodString>;
    medicationId: z.ZodNumber;
}, z.z.core.$strip>;
export declare const updateDewormingInputSchema: z.ZodObject<{
    liveAnimalId: z.ZodNumber;
    veterinarianVisitId: z.ZodOptional<z.ZodNumber>;
    assigneeId: z.ZodNumber;
    note: z.ZodOptional<z.ZodString>;
    startDate: z.ZodString;
    endDate: z.ZodOptional<z.ZodString>;
    medicationId: z.ZodNumber;
}, z.z.core.$strip>;
export declare const getAllDewormingOutputSchema: z.ZodObject<{
    id: z.ZodNumber;
    liveAnimalId: z.ZodNumber;
    assigneeId: z.ZodNumber;
    veterinarianVisitId: z.ZodOptional<z.ZodNumber>;
    startDate: z.ZodString;
    endDate: z.ZodOptional<z.ZodString>;
    medicationId: z.ZodNumber;
    note: z.ZodOptional<z.ZodString>;
    canEdit: z.ZodBoolean;
    createdByMe: z.ZodBoolean;
    liveAnimalCode: z.ZodString;
    assigneeName: z.ZodString;
    medicationName: z.ZodString;
    veterinarianVisitDate: z.ZodOptional<z.ZodString>;
}, z.z.core.$strip>;
export declare const getFormOptionsDewormingOutputSchema: z.ZodObject<{
    liveAnimals: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        code: z.ZodString;
    }, z.z.core.$strip>>;
    assignees: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
    veterinarianVisits: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        date: z.ZodString;
        liveAnimal: z.ZodObject<{
            id: z.ZodNumber;
            code: z.ZodString;
        }, z.z.core.$strip>;
    }, z.z.core.$strip>>;
    medications: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
}, z.z.core.$strip>;
export type Deworming = z.infer<typeof dewormingSchema>;
export type CreateDewormingInput = z.infer<typeof createDewormingInputSchema>;
export type UpdateDewormingInput = z.infer<typeof updateDewormingInputSchema>;
export type GetAllDewormingOutput = z.infer<typeof getAllDewormingOutputSchema>;
export type GetFormOptionsDewormingOutput = z.infer<typeof getFormOptionsDewormingOutputSchema>;
//# sourceMappingURL=deworming.d.ts.map