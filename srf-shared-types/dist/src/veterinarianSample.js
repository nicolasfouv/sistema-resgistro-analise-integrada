import z from 'zod';
export const sendVeterinarianSampleSchema = z.object({
    id: z.number().int(),
    destinationId: z.number().int(),
    statusId: z.number().int(),
    sendDate: z.string().nonempty(),
    quantity: z.number().int().positive(),
    note: z.string().optional()
});
export const veterinarianSampleSchema = z.object({
    id: z.number().int(),
    veterinarianVisitId: z.number().int(),
    sampleTypeId: z.number().int(),
    storageId: z.number().int(),
    statusId: z.number().int(),
    quantity: z.number().int().positive(),
    imageLink: z.string().optional(),
    note: z.string().optional(),
    sendSamples: z.array(sendVeterinarianSampleSchema).optional()
});
export const createVeterinarianSampleInputSchema = veterinarianSampleSchema.omit({
    id: true
});
export const updateVeterinarianSampleInputSchema = veterinarianSampleSchema.omit({
    id: true
});
export const getAllVeterinarianSampleOutputSchema = veterinarianSampleSchema.omit({
    sendSamples: true
}).extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    veterinarianVisitAssigneeName: z.string().nonempty(),
    sampleTypeDescription: z.string().nonempty(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    storageName: z.string().nonempty(),
    statusName: z.string().nonempty(),
    sendSamples: z.array(z.object({
        id: z.number().int(),
        destinationId: z.number().int(),
        destinationName: z.string().nonempty(),
        statusId: z.number().int(),
        statusName: z.string().nonempty(),
        sendDate: z.string().nonempty(),
        sendDateFormatted: z.string().optional(),
        quantity: z.number().int().positive(),
        note: z.string().optional()
    })).optional(),
    hasStoolAnalysis: z.boolean()
});
export const getFormOptionsVeterinarianSampleOutputSchema = z.object({
    veterinarianVisits: z.array(z.object({
        id: z.number().int(),
        date: z.string().nonempty(),
        liveAnimal: z.object({
            id: z.number().int(),
            code: z.string().nonempty()
        })
    })),
    sampleTypes: z.array(z.object({
        id: z.number().int(),
        description: z.string().nonempty()
    })),
    status: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    storages: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    destinations: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});
