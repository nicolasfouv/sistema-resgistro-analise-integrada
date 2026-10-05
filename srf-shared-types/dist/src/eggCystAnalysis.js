import z from 'zod';
// model eggCystAnalysis {
//   id              Int           @id @default(autoincrement())
//   stoolAnalysisId Int           @map("id_analise_fezes")
//   stoolAnalysis   stoolAnalysis @relation(fields: [stoolAnalysisId], references: [id])
//   eggCystSpecieId Int           @map("id_especie_ovo_cisto")
//   eggCystSpecie   eggCystSpecie @relation(fields: [eggCystSpecieId], references: [id])
//   quantity        Int           @map("quantidade")
//   note            String?       @map("observacao")
//
//   @@unique([stoolAnalysisId, eggCystSpecieId])
//   @@map("analise_ovo_cisto")
// }
export const eggCystAnalysisSchema = z.object({
    id: z.number().int(),
    stoolAnalysisId: z.number().int(),
    eggCystSpecieId: z.number().int(),
    quantity: z.number().int(),
    note: z.string().optional(),
    assigneeId: z.number().int()
});
export const createEggCystAnalysisInputSchema = eggCystAnalysisSchema.omit({
    id: true,
});
export const updateEggCystAnalysisInputSchema = eggCystAnalysisSchema.omit({
    id: true,
});
export const getAllEggCystAnalysisOutputSchema = eggCystAnalysisSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    veterinarianVisitId: z.number().int(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    eggCystSpecieName: z.string().nonempty(),
    assigneeName: z.string().nonempty()
});
export const getFormOptionsEggCystAnalysisOutputSchema = z.object({
    stoolAnalyses: z.array(z.object({
        id: z.number().int(),
        veterinarianVisit: z.object({
            id: z.number().int(),
            date: z.string().nonempty(),
            liveAnimal: z.object({
                id: z.number().int(),
                code: z.string().nonempty()
            })
        })
    })),
    eggCystSpecies: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});
