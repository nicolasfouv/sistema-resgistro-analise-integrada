import z from 'zod';
// model ectoparasiteAnalysisVeterinarian {
//   id                      Int                @id @default(autoincrement())
//   veterinarianVisitId     Int                @map("id_visita_veterinaria")
//   veterinarianVisit       veterinarianVisit  @relation(fields: [veterinarianVisitId], references: [id])
//   ectoparasiteGenusId     Int                @map("id_genero_ectoparasito")
//   ectoparasiteGenus       ectoparasiteGenus  @relation(fields: [ectoparasiteGenusId], references: [id])
//   ectoparasiteSpecieId    Int                @map("id_especie_ectoparasito")
//   ectoparasiteSpecie      ectoparasiteSpecie @relation("specie", fields: [ectoparasiteSpecieId], references: [id])
//   ectoparasiteSubSpecieId Int                @map("id_subespecie_ectoparasito")
//   ectoparasiteSubSpecie   ectoparasiteSpecie @relation("subspecie", fields: [ectoparasiteSubSpecieId], references: [id])
//   maleQuantity            Int                @map("quantidade_machos")
//   femaleQuantity          Int                @map("quantidade_femeas")
//   nymphQuantity           Int                @map("quantidade_ninfas")
//   larvaeQuantity          Int                @map("quantidade_larvas")
//   eggQuantity             Int                @map("quantidade_ovos")
//   note                    String?            @map("observacao")
//
//   @@map("analise_ectoparasito_veterinario")
// }
export const ectoparasiteAnalysisSchema = z.object({
    id: z.number().int(),
    veterinarianVisitId: z.number().int(),
    assigneeId: z.number().int(),
    ectoparasiteGenusId: z.number().int(),
    ectoparasiteSpecieId: z.number().int(),
    ectoparasiteSubSpecieId: z.number().int(),
    maleQuantity: z.number().int(),
    femaleQuantity: z.number().int(),
    nymphQuantity: z.number().int(),
    larvaeQuantity: z.number().int(),
    eggQuantity: z.number().int(),
    note: z.string().optional(),
});
export const createEctoparasiteAnalysisInputSchema = ectoparasiteAnalysisSchema.omit({
    id: true,
});
export const updateEctoparasiteAnalysisInputSchema = ectoparasiteAnalysisSchema.omit({
    id: true,
});
export const getAllEctoparasiteAnalysisOutputSchema = ectoparasiteAnalysisSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    veterinarianVisitDate: z.string().nonempty(),
    veterinarianVisitDateFormatted: z.string().optional(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    assigneeName: z.string().nonempty(),
    genusName: z.string().nonempty(),
    specieName: z.string().nonempty(),
    subSpecieName: z.string().nonempty()
});
export const getFormOptionsEctoparasiteAnalysisOutputSchema = z.object({
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
        name: z.string().nonempty(),
    })),
    genuses: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    species: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    }))
});
