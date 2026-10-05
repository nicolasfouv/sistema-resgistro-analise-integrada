import z from 'zod';

// model examResult {
//   id                       Int               @id @default(autoincrement())
//   veterinarianVisitId      Int               @map("id_visita_veterinaria")
//   veterinarianVisit        veterinarianVisit @relation(fields: [veterinarianVisitId], references: [id])
//   erythrocytes             Float             @map("eritrocitos")
//   hemoglobin               Float             @map("hemoglobina")
//   hematocrit               Float             @map("hematocrito")
//   vcm                      Float             @map("vcm")
//   hcm                      Float             @map("hcm")
//   chcm                     Float             @map("chcm")
//   platelets                Float             @map("plaquetas")
//   whiteBloodCells          Float             @map("leucocitos")
//   bandCells                Float             @map("bastonetes")
//   segmentedCells           Float             @map("segmentados")
//   segmentedCellsPercentage Float             @map("segmentados_percentual")
//   lymphocytes              Float             @map("linfocitos")
//   lymphocytesPercentage    Float             @map("linfocitos_percentual")
//   monocytes                Float             @map("monocitos")
//   monocytesPercentage      Float             @map("monocitos_percentual")
//   eosinophils              Float             @map("eosinofilos")
//   eosinophilsPercentage    Float             @map("eosinofilos_percentual")
//   basophils                Float             @map("basofilos")
//   basophilsPercentage      Float             @map("basofilos_percentual")
//   alt                      Float             @map("alt")
//   creatinine               Float             @map("creatinina")
//   alkalinePhosphatase      Float             @map("fosfatase_alcalina")
//   totalProtein             Float             @map("proteina_total")
//   urea                     Float             @map("ureia")
//
//   @@map("resultado_exame")
// }

export const examResultSchema = z.object({
    id: z.number().int(),
    veterinarianVisitId: z.number().int(),
    assigneeId: z.number().int(),
    interpretationId: z.number().int(),
    erythrocytes: z.number(),
    hemoglobin: z.number(),
    hematocrit: z.number(),
    vcm: z.number(),
    hcm: z.number(),
    chcm: z.number(),
    platelets: z.number(),
    whiteBloodCells: z.number(),
    bandCells: z.number(),
    segmentedCellsPercentage: z.number(),
    lymphocytesPercentage: z.number(),
    monocytesPercentage: z.number(),
    eosinophilsPercentage: z.number(),
    basophilsPercentage: z.number(),
    alt: z.number(),
    creatinine: z.number(),
    alkalinePhosphatase: z.number(),
    totalProtein: z.number(),
    urea: z.number(),
    note: z.string().optional()
});

export const createExamResultInputSchema = examResultSchema.omit({
    id: true
});

export const updateExamResultInputSchema = examResultSchema.omit({
    id: true
});

export const getAllExamResultOutputSchema = examResultSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    interpretationId: z.number().int(),
    interpretationName: z.string().nonempty(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    assigneeName: z.string().nonempty()
});

export const getFormOptionsExamResultOutputSchema = z.object({
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
    interpretations: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});

export type ExamResult = z.infer<typeof examResultSchema>;

// Inputs
export type CreateExamResultInput = z.infer<typeof createExamResultInputSchema>;
export type UpdateExamResultInput = z.infer<typeof updateExamResultInputSchema>;

// Outputs
export type GetAllExamResultOutput = z.infer<typeof getAllExamResultOutputSchema>;
export type GetFormOptionsExamResultOutput = z.infer<typeof getFormOptionsExamResultOutputSchema>;
