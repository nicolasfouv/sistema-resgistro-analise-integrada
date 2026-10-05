import z from 'zod';

// model vaccineApplication {
//   id                  Int                @id @default(autoincrement())
//   liveAnimalId        Int                @map("id_animal_vivo")
//   liveAnimal          liveAnimal         @relation(fields: [liveAnimalId], references: [id])
//   vaccineId           Int                @map("id_vacina")
//   vaccine             vaccine            @relation(fields: [vaccineId], references: [id])
//   veterinarianVisitId Int?               @map("id_visita_veterinaria")
//   veterinarianVisit   veterinarianVisit? @relation(fields: [veterinarianVisitId], references: [id])
//   date                DateTime           @map("data")
//   vaccineTypeId       Int                @map("id_tipo_vacina")
//   vaccineType         enumVaccineType    @relation(fields: [vaccineTypeId], references: [id])

//   @@map("aplicacao_vacina")
// }

export const vaccineSchema = z.object({
    id: z.number().int(),
    liveAnimalId: z.number().int(),
    vaccineId: z.number().int(),
    applicationDate: z.string().nonempty(),
    veterinarianVisitId: z.number().int().optional(),
    assigneeId: z.number().int(),
    vaccineTypeId: z.number().int()
});

export const createVaccineInputSchema = vaccineSchema.omit({
    id: true
});

export const updateVaccineInputSchema = vaccineSchema.omit({
    id: true
});

export const getAllVaccineOutputSchema = vaccineSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    liveAnimalCode: z.string(),
    vaccineName: z.string(),
    vaccineTypeName: z.string(),
    veterinarianVisitId: z.number().int().optional(),
    assigneeName: z.string().optional(),
    veterinarianVisitDate: z.string().optional(),
    veterinarianVisitDateFormatted: z.string().optional(),
    applicationDateFormatted: z.string().optional()
});

export const getFormOptionsVaccineOutputSchema = z.object({
    liveAnimals: z.array(z.object({
        id: z.number().int(),
        code: z.string().nonempty()
    })),
    veterinarianVisits: z.array(z.object({
        id: z.number().int(),
        date: z.string().nonempty(),
        liveAnimal: z.object({
            id: z.number().int(),
            code: z.string().nonempty()
        })
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    vaccines: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    vaccineTypes: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});

export type Vaccine = z.infer<typeof vaccineSchema>;

// Inputs
export type CreateVaccineInput = z.infer<typeof createVaccineInputSchema>;
export type UpdateVaccineInput = z.infer<typeof updateVaccineInputSchema>;

// Outputs
export type GetAllVaccineOutput = z.infer<typeof getAllVaccineOutputSchema>;
export type GetFormOptionsVaccineOutput = z.infer<typeof getFormOptionsVaccineOutputSchema>;
