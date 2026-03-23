import z from "zod";

export const veterinarianVisitCreateInput = z.object({
    liveAnimalId: z.number().positive({ error: 'ID do animal inválido' }),
    veterinarianId: z.number().positive({ error: 'ID do veterinário inválido' }),
    date: z.string().nonempty({ error: 'Data inválida' }),
    cardLink: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        bodyMeasurementTypeId: z.number().positive({ error: 'ID do tipo de medida corporal inválido' }),
        value: z.number().positive({ error: 'Valor inválido' }),
    })).optional(),
});

export const veterinarianVisitUpdateInput = z.object({
    liveAnimalId: z.number().positive({ error: 'ID do animal inválido' }),
    veterinarianId: z.number().positive({ error: 'ID do veterinário inválido' }),
    date: z.string().nonempty({ error: 'Data inválida' }),
    cardLink: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        bodyMeasurementTypeId: z.number().positive({ error: 'ID do tipo de medida corporal inválido' }),
        value: z.number().positive({ error: 'Valor inválido' }),
    })).optional(),
})