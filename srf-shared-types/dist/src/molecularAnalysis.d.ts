import z from 'zod';
export declare const molecularAnalysisSchema: z.ZodObject<{
    id: z.ZodNumber;
    stoolAnalysisId: z.ZodNumber;
    eggCystSpecieId: z.ZodNumber;
    note: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    assigneeId: z.ZodNumber;
}, z.z.core.$strip>;
export declare const createMolecularAnalysisInputSchema: z.ZodObject<{
    assigneeId: z.ZodNumber;
    note: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    stoolAnalysisId: z.ZodNumber;
    eggCystSpecieId: z.ZodNumber;
}, z.z.core.$strip>;
export declare const updateMolecularAnalysisInputSchema: z.ZodObject<{
    assigneeId: z.ZodNumber;
    note: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    stoolAnalysisId: z.ZodNumber;
    eggCystSpecieId: z.ZodNumber;
}, z.z.core.$strip>;
export declare const getAllMolecularAnalysisOutputSchema: z.ZodObject<{
    id: z.ZodNumber;
    stoolAnalysisId: z.ZodNumber;
    eggCystSpecieId: z.ZodNumber;
    note: z.ZodOptional<z.ZodNullable<z.ZodString>>;
    canEdit: z.ZodBoolean;
    createdByMe: z.ZodBoolean;
    veterinarianVisitDate: z.ZodString;
    veterinarianVisitDateFormatted: z.ZodOptional<z.ZodString>;
    veterinarianVisitId: z.ZodNumber;
    liveAnimalId: z.ZodNumber;
    liveAnimalCode: z.ZodString;
    assigneeId: z.ZodNumber;
    assigneeName: z.ZodString;
    eggCystSpecieName: z.ZodString;
}, z.z.core.$strip>;
export declare const getFormOptionsMolecularAnalysisOutputSchema: z.ZodObject<{
    stoolAnalyses: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        veterinarianVisit: z.ZodObject<{
            id: z.ZodNumber;
            date: z.ZodString;
            liveAnimal: z.ZodObject<{
                id: z.ZodNumber;
                code: z.ZodString;
            }, z.z.core.$strip>;
        }, z.z.core.$strip>;
    }, z.z.core.$strip>>;
    eggCystSpecies: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
    assignees: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
}, z.z.core.$strip>;
export type MolecularAnalysis = z.infer<typeof molecularAnalysisSchema>;
export type CreateMolecularAnalysisInput = z.infer<typeof createMolecularAnalysisInputSchema>;
export type UpdateMolecularAnalysisInput = z.infer<typeof updateMolecularAnalysisInputSchema>;
export type GetAllMolecularAnalysisOutput = z.infer<typeof getAllMolecularAnalysisOutputSchema>;
export type GetFormOptionsMolecularAnalysisOutput = z.infer<typeof getFormOptionsMolecularAnalysisOutputSchema>;
//# sourceMappingURL=molecularAnalysis.d.ts.map