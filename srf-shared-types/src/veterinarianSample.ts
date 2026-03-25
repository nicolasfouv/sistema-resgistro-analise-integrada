import z from 'zod';

export const sendVeterinarianSampleSchema = z.object({
    id: z.number().int({ error: 'ID do envio de amostra veterinária inválido' }),
    storageId: z.number().int({ error: 'ID do local de armazenamento inválido' }),
    statusId: z.number().int({ error: 'ID do status inválido' }),
    sendDate: z.string().nonempty({ error: 'Data de envio inválida' }),
    quantity: z.number().int({ error: 'Valor deve ser inteiro' }).positive({ error: 'Valor deve ser positivo' }),
    note: z.string().optional()
});

export const veterinarianSampleSchema = z.object({
    id: z.number().int({ error: 'ID da amostra veterinária inválida' }),
    veterinarianVisitId: z.number().int({ error: 'ID da visita veterinária inválida' }),
    sampleTypeId: z.number().int({ error: 'ID do tipo da amostra inválido' }),
    storageId: z.number().int({ error: 'ID do local de armazenamento inválido' }),
    statusId: z.number().int({ error: 'ID do status inválido' }),
    quantity: z.number().int({ error: 'Valor deve ser inteiro' }).positive({ error: 'Valor deve ser positivo' }),
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
    veterinarianVisitDate: z.date().transform((date) => date.toISOString()),
    sampleTypeDescription: z.string().nonempty(),
    liveAnimalId: z.number().int(),
    liveAnimalName: z.string().nonempty(),
    storageName: z.string().nonempty(),
    statusName: z.string().nonempty(),
    sendSamples: z.array(z.object({
        id: z.number().int(),
        storageId: z.number().int(),
        storageName: z.string().nonempty(),
        statusId: z.number().int(),
        statusName: z.string().nonempty(),
        sendDate: z.date().transform((date) => date.toISOString()),
        quantity: z.number().int().positive(),
        note: z.string().optional()
    })).optional()
});

export const getFormOptionsVeterinarianSampleOutputSchema = z.object({
    veterinarianVisits: z.array(z.object({
        id: z.number().int(),
        date: z.date().transform((date) => date.toISOString()),
        liveAnimal: z.object({
            id: z.number().int(),
            name: z.string().nonempty()
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
    }))
});

export type VeterinarianSample = z.infer<typeof veterinarianSampleSchema>;
// Inputs
export type CreateVeterinarianSampleInput = z.infer<typeof createVeterinarianSampleInputSchema>;
export type UpdateVeterinarianSampleInput = z.infer<typeof updateVeterinarianSampleInputSchema>;
export type SendVeterinarianSample = z.infer<typeof sendVeterinarianSampleSchema>;

//Outputs
export type GetAllVeterinarianSampleOutput = z.infer<typeof getAllVeterinarianSampleOutputSchema>;
export type GetFormOptionsVeterinarianSampleOutput = z.infer<typeof getFormOptionsVeterinarianSampleOutputSchema>;



