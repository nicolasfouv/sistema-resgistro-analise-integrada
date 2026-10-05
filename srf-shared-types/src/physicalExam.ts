import z from 'zod';

// model physicalExam {
//   id                  Int                              @id @default(autoincrement())
//   veterinarianVisitId Int                              @unique @map("id_visita_veterinaria")
//   veterinarianVisit   veterinarianVisit                @relation(fields: [veterinarianVisitId], references: [id])
//   generalConditionId  Int                              @map("id_estado_geral")
//   generalCondition    enumPhysicalExamGeneralCondition @relation(fields: [generalConditionId], references: [id])
//   fr                  String                           @map("FR")
//   fc                  Int                              @map("FC")
//   tempRectal          Float                            @map("temp_retal")
//   mucousId            Int                              @map("id_mucosa")
//   mucous              enumMucous                       @relation(fields: [mucousId], references: [id])
//   tpc                 Int                              @map("TPC")
//   hydrationId         Int                              @map("id_hidratacao")
//   hydration           enumHydration                    @relation(fields: [hydrationId], references: [id])
//   weight              Float                            @map("peso")
//   score               Int                              @map("score")
//   bloodCollectionNote String?                          @map("observacao_coleta_sangue")
//   physicalExamNote    String?                          @map("observacao_exame_fisico")
//   generalNote         String?                          @map("observacao_geral")

//   @@map("exame_fisico")
// }

export const physicalExamSchema = z.object({
    id: z.number().int(),
    veterinarianVisitId: z.number().int(),
    assigneeId: z.number().int(),
    generalConditionId: z.number().int(),
    fr: z.string().nonempty(),
    fc: z.number().int(),
    tempRectal: z.number(),
    mucousId: z.number().int(),
    tpc: z.number().int(),
    hydrationId: z.number().int(),
    weight: z.number(),
    score: z.number().int(),
    bloodCollectionNote: z.string().optional(),
    physicalExamNote: z.string().optional(),
    generalNote: z.string().optional()
});

export const createPhysicalExamInputSchema = physicalExamSchema.omit({
    id: true
});

export const updatePhysicalExamInputSchema = physicalExamSchema.omit({
    id: true
});

export const getAllPhysicalExamOutputSchema = physicalExamSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    generalConditionName: z.string().nonempty(),
    mucousName: z.string().nonempty(),
    hydrationName: z.string().nonempty(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    assigneeName: z.string().nonempty()
});

export const getFormOptionsPhysicalExamOutputSchema = z.object({
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
    generalConditions: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    mucous: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    hydrations: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});

export type PhysicalExam = z.infer<typeof physicalExamSchema>;

// Inputs
export type CreatePhysicalExamInput = z.infer<typeof createPhysicalExamInputSchema>;
export type UpdatePhysicalExamInput = z.infer<typeof updatePhysicalExamInputSchema>;

//Outputs
export type GetAllPhysicalExamOutput = z.infer<typeof getAllPhysicalExamOutputSchema>;
export type GetFormOptionsPhysicalExamOutput = z.infer<typeof getFormOptionsPhysicalExamOutputSchema>;