import z from 'zod';

// model castration {
//   id                  Int                @id @default(autoincrement())
//   liveAnimalId        Int                @unique @map("id_animal_vivo")
//   liveAnimal          liveAnimal         @relation(fields: [liveAnimalId], references: [id])
//   veterinarianVisitId Int?               @unique @map("id_visita_veterinaria")
//   veterinarianVisit   veterinarianVisit? @relation(fields: [veterinarianVisitId], references: [id])
//   date                DateTime           @map("data")
//   note                String?            @map("observacao")

//   @@map("castracao")
// }

export const castrationSchema = z.object({
    id: z.number().int(),
    liveAnimalId: z.number().int(),
    veterinarianVisitId: z.number().int().optional(),
    assigneeId: z.number().int().optional(),
    date: z.string().nonempty(),
    note: z.string().optional()
});

export const createCastrationInputSchema = castrationSchema.omit({
    id: true
});

export const updateCastrationInputSchema = castrationSchema.omit({
    id: true
});

export const getAllCastrationOutputSchema = castrationSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    liveAnimalCode: z.string(),
    veterinarianVisitId: z.number().int().optional(),
    veterinarianVisitDate: z.string().optional(),
    veterinarianVisitDateFormatted: z.string().optional(),
    assigneeName: z.string().optional(),
    dateFormatted: z.string().optional(),
    hasVeterinarianVisit: z.boolean()
});

export const getFormOptionsCastrationOutputSchema = z.object({
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
    }))
});

export type Castration = z.infer<typeof castrationSchema>;

// Inputs
export type CreateCastrationInput = z.infer<typeof createCastrationInputSchema>;
export type UpdateCastrationInput = z.infer<typeof updateCastrationInputSchema>;

// Outputs
export type GetAllCastrationOutput = z.infer<typeof getAllCastrationOutputSchema>;
export type GetFormOptionsCastrationOutput = z.infer<typeof getFormOptionsCastrationOutputSchema>;
