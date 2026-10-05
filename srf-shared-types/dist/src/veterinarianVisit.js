import z from 'zod';
// Inputs
export const createVeterinarianVisitInputSchema = z.object({
    liveAnimalId: z.number().int().positive(),
    assigneeId: z.number().int().positive(),
    date: z.string().nonempty(),
    animalPicture: z.string().optional(),
    note: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        bodyMeasurementTypeId: z.number().int().positive(),
        value: z.number().positive(),
    })).optional(),
});
export const updateVeterinarianVisitInputSchema = createVeterinarianVisitInputSchema;
// Outputs
export const getAllVeterinarianVisitOutputSchema = z.object({
    id: z.number().int(),
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    hasSample: z.boolean(),
    hasPhysicalExam: z.boolean(),
    hasVaccine: z.boolean(),
    hasExamResult: z.boolean(),
    hasSorologyAnalysis: z.boolean(),
    hasEctoparasiteAnalysis: z.boolean(),
    hasStoolAnalysis: z.boolean(),
    hasCastration: z.boolean(),
    hasDeworming: z.boolean(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    assigneeId: z.number().int(),
    assigneeName: z.string().nonempty(),
    date: z.string().nonempty(),
    dateFormatted: z.string().optional(),
    animalPicture: z.string().optional(),
    note: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        id: z.number().int(),
        bodyMeasurementTypeId: z.number().int(),
        bodyMeasurementTypeDescription: z.string().nonempty(),
        bodyMeasurementTypeUnit: z.string().nonempty(),
        value: z.number(),
    })),
});
export const getFormOptionsVeterinarianVisitOutputSchema = z.object({
    liveAnimals: z.array(z.object({
        id: z.number().int(),
        code: z.string().nonempty(),
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    bodyMeasurementTypes: z.array(z.object({
        id: z.number().int(),
        description: z.string().nonempty(),
        unit: z.string().nonempty(),
    })),
});
