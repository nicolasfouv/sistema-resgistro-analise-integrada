import z from 'zod';
// model liveAnimal {
//   id            Int              @id @default(autoincrement())
//   specieId      Int              @map("id_especie")
//   specie        specie           @relation(fields: [specieId], references: [id])
//   name          String           @map("nome")
//   genderId      Int              @map("id_genero")
//   gender        enumAnimalGender @relation(fields: [genderId], references: [id])
//   birthDate     DateTime         @map("data_nascimento")
//   active        Boolean          @map("ativo")
//   animalPicture String?          @map("foto_animal")
//   cardLink      String?          @map("link_carteirinha")
//   gpsTracking        gpsTracking?
//   castration         castration?
//   veterinarianVisit  veterinarianVisit[]
//   vaccineApplication vaccineApplication[]
//   animalInterview    animalInterview?
//   @@map("animal_vivo")
// }
// Outputs
export const getAllLiveAnimalOutputSchema = z.object({
    id: z.number().int(),
    createdByMe: z.boolean(),
    canEdit: z.boolean(),
    code: z.string().nonempty(),
    name: z.string().optional(),
    specieId: z.number().int(),
    specieName: z.string().nonempty(),
    genderId: z.number().int(),
    genderName: z.string().nonempty(),
    birthDate: z.string().nonempty(),
    birthDateFormatted: z.string().optional(),
    active: z.boolean(),
    activeFormatted: z.string().optional(),
    animalPicture: z.string().optional(),
    cardLink: z.string().optional(),
    tutorId: z.number().int().optional(),
    tutorName: z.string().optional(),
    hasGpsTracking: z.boolean(),
    hasCastration: z.boolean(),
    hasVeterinarianVisit: z.boolean(),
    hasVaccineApplication: z.boolean(),
    hasAnimalInterview: z.boolean()
});
export const getFormOptionsAnimalOutputSchema = z.object({
    species: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    genders: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    })),
    tutors: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});
// Inputs
export const createLiveAnimalInputSchema = z.object({
    code: z.string().nonempty(),
    name: z.string().optional(),
    specieId: z.number().int(),
    genderId: z.number().int(),
    birthDate: z.string().nonempty(),
    active: z.boolean(),
    animalPicture: z.string().optional(),
    cardLink: z.string().optional(),
    tutorId: z.number().int().optional()
});
export const updateLiveAnimalInputSchema = createLiveAnimalInputSchema;
