import z from 'zod';

// model sorologyAnalysis {
//   id                  Int                        @id @default(autoincrement())
//   veterinarianVisitId Int                        @unique @map("id_visita_veterinaria")
//   veterinarianVisit   veterinarianVisit          @relation(fields: [veterinarianVisitId], references: [id])
//   sorologyTestId      Int                        @map("id_teste_sorologico")
//   sorologyTest        sorologyTest               @relation(fields: [sorologyTestId], references: [id])
//   sorologyAgentId     Int                        @map("id_agente_sorologico")
//   sorologyAgent       sorologyAgent              @relation(fields: [sorologyAgentId], references: [id])
//   cuttingPointSymbol  String                     @map("simbolo_ponto_corte")
//   cuttingPointValue   String                     @map("valor_ponto_corte")
//   resultTypeId        Int                        @map("id_tipo_resultado")
//   resultType          enumSorologyResultType     @relation(fields: [resultTypeId], references: [id])
//   result              Float                      @map("resultado")
//   interpretationId    Int                        @map("id_interpretacao")
//   interpretation      enumSorologyInterpretation @relation(fields: [interpretationId], references: [id])
//
//   @@map("analise_sorologica")
// }

export const sorologyResultSchema = z.object({
    id: z.number().int(),
    veterinarianVisitId: z.number().int(),
    assigneeId: z.number().int(),
    sorologyTestId: z.number().int(),
    sorologyAgentId: z.number().int(),
    cuttingPointSymbol: z.string(),
    cuttingPointValue: z.string(),
    resultTypeId: z.number().int(),
    result: z.number(),
    interpretationId: z.number().int(),
});

export const createSorologyResultInputSchema = sorologyResultSchema.omit({
    id: true,
});

export const updateSorologyResultInputSchema = sorologyResultSchema.omit({
    id: true,
});

export const getAllSorologyResultOutputSchema = sorologyResultSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    assigneeName: z.string().nonempty(),
    testName: z.string().nonempty(),
    agentName: z.string().nonempty(),
    resultTypeName: z.string().nonempty(),
    interpretationName: z.string().nonempty(),
});

export const getFormOptionsSorologyResultOutputSchema = z.object({
    veterinarianVisits: z.array(z.object({
        id: z.number().int(),
        date: z.string().nonempty(),
        liveAnimal: z.object({
            id: z.number().int(),
            code: z.string().nonempty(),
        })
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    sorologyTests: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    sorologyAgents: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    resultTypes: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    interpretations: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
});

export type SorologyResult = z.infer<typeof sorologyResultSchema>;

// Inputs
export type CreateSorologyResultInput = z.infer<typeof createSorologyResultInputSchema>;
export type UpdateSorologyResultInput = z.infer<typeof updateSorologyResultInputSchema>;

// Outputs
export type GetAllSorologyResultOutput = z.infer<typeof getAllSorologyResultOutputSchema>;
export type GetFormOptionsSorologyResultOutput = z.infer<typeof getFormOptionsSorologyResultOutputSchema>;
