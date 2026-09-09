import z from 'zod';
export declare const createVeterinarianVisitInputSchema: z.ZodObject<{
    liveAnimalId: z.ZodNumber;
    veterinarianId: z.ZodNumber;
    date: z.ZodString;
    animalPicture: z.ZodOptional<z.ZodString>;
    note: z.ZodOptional<z.ZodString>;
    bodyMeasurements: z.ZodOptional<z.ZodArray<z.ZodObject<{
        bodyMeasurementTypeId: z.ZodNumber;
        value: z.ZodNumber;
    }, z.z.core.$strip>>>;
}, z.z.core.$strip>;
export declare const updateVeterinarianVisitInputSchema: z.ZodObject<{
    liveAnimalId: z.ZodNumber;
    veterinarianId: z.ZodNumber;
    date: z.ZodString;
    animalPicture: z.ZodOptional<z.ZodString>;
    note: z.ZodOptional<z.ZodString>;
    bodyMeasurements: z.ZodOptional<z.ZodArray<z.ZodObject<{
        bodyMeasurementTypeId: z.ZodNumber;
        value: z.ZodNumber;
    }, z.z.core.$strip>>>;
}, z.z.core.$strip>;
export declare const getAllVeterinarianVisitOutputSchema: z.ZodObject<{
    id: z.ZodNumber;
    canEdit: z.ZodBoolean;
    createdByMe: z.ZodBoolean;
    hasSample: z.ZodBoolean;
    hasPhysicalExam: z.ZodBoolean;
    hasVaccine: z.ZodBoolean;
    hasExamResult: z.ZodBoolean;
    hasSorologyAnalysis: z.ZodBoolean;
    hasEctoparasiteAnalysis: z.ZodBoolean;
    hasStoolAnalysis: z.ZodBoolean;
    hasCastration: z.ZodBoolean;
    liveAnimalId: z.ZodNumber;
    liveAnimalCode: z.ZodString;
    veterinarianId: z.ZodNumber;
    veterinarianName: z.ZodString;
    date: z.ZodString;
    dateFormatted: z.ZodOptional<z.ZodString>;
    animalPicture: z.ZodOptional<z.ZodString>;
    note: z.ZodOptional<z.ZodString>;
    bodyMeasurements: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        bodyMeasurementTypeId: z.ZodNumber;
        bodyMeasurementTypeDescription: z.ZodString;
        bodyMeasurementTypeUnit: z.ZodString;
        value: z.ZodNumber;
    }, z.z.core.$strip>>;
}, z.z.core.$strip>;
export declare const getFormOptionsVeterinarianVisitOutputSchema: z.ZodObject<{
    liveAnimals: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        code: z.ZodString;
    }, z.z.core.$strip>>;
    veterinarians: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
    bodyMeasurementTypes: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        description: z.ZodString;
        unit: z.ZodString;
    }, z.z.core.$strip>>;
}, z.z.core.$strip>;
export type CreateVeterinarianVisitInput = z.infer<typeof createVeterinarianVisitInputSchema>;
export type UpdateVeterinarianVisitInput = z.infer<typeof updateVeterinarianVisitInputSchema>;
export type GetAllVeterinarianVisitOutput = z.infer<typeof getAllVeterinarianVisitOutputSchema>;
export type GetFormOptionsVeterinarianVisitOutput = z.infer<typeof getFormOptionsVeterinarianVisitOutputSchema>;
//# sourceMappingURL=veterinarianVisit.d.ts.map