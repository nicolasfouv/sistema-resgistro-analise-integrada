import z from 'zod';
export const dewormingSchema = z.object({
    id: z.number().int(),
    liveAnimalId: z.number().int(),
    assigneeId: z.number().int(),
    veterinarianVisitId: z.number().int().optional(),
    startDate: z.string().nonempty(),
    endDate: z.string().optional(),
    medicationId: z.number().int(),
    note: z.string().optional()
});
export const createDewormingInputSchema = dewormingSchema.omit({ id: true });
export const updateDewormingInputSchema = dewormingSchema.omit({ id: true });
export const getAllDewormingOutputSchema = dewormingSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    liveAnimalCode: z.string(),
    assigneeName: z.string(),
    medicationName: z.string(),
    veterinarianVisitDate: z.string().optional()
});
export const getFormOptionsDewormingOutputSchema = z.object({
    liveAnimals: z.array(z.object({
        id: z.number().int(),
        code: z.string().nonempty()
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    veterinarianVisits: z.array(z.object({
        id: z.number().int(),
        date: z.string().nonempty(),
        liveAnimal: z.object({
            id: z.number().int(),
            code: z.string().nonempty()
        })
    })),
    medications: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});
