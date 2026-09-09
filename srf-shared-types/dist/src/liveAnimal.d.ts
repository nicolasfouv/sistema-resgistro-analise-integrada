import z from 'zod';
export declare const getAllLiveAnimalOutputSchema: z.ZodObject<{
    id: z.ZodNumber;
    createdByMe: z.ZodBoolean;
    canEdit: z.ZodBoolean;
    code: z.ZodString;
    name: z.ZodOptional<z.ZodString>;
    specieId: z.ZodNumber;
    specieName: z.ZodString;
    genderId: z.ZodNumber;
    genderName: z.ZodString;
    birthDate: z.ZodOptional<z.ZodString>;
    birthDateFormatted: z.ZodOptional<z.ZodString>;
    age: z.ZodOptional<z.ZodBoolean>;
    ageFormatted: z.ZodOptional<z.ZodString>;
    active: z.ZodBoolean;
    activeFormatted: z.ZodOptional<z.ZodString>;
    animalPicture: z.ZodOptional<z.ZodString>;
    cardLink: z.ZodOptional<z.ZodString>;
    tutorId: z.ZodOptional<z.ZodNumber>;
    tutorName: z.ZodOptional<z.ZodString>;
    hasGpsTracking: z.ZodBoolean;
    hasCastration: z.ZodBoolean;
    hasVeterinarianVisit: z.ZodBoolean;
    hasVaccineApplication: z.ZodBoolean;
    hasAnimalInterview: z.ZodBoolean;
}, z.z.core.$strip>;
export declare const getFormOptionsAnimalOutputSchema: z.ZodObject<{
    species: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
    genders: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
    tutors: z.ZodArray<z.ZodObject<{
        id: z.ZodNumber;
        name: z.ZodString;
    }, z.z.core.$strip>>;
}, z.z.core.$strip>;
export declare const createLiveAnimalInputSchema: z.ZodObject<{
    code: z.ZodString;
    name: z.ZodOptional<z.ZodString>;
    specieId: z.ZodNumber;
    genderId: z.ZodNumber;
    birthDate: z.ZodOptional<z.ZodString>;
    age: z.ZodOptional<z.ZodBoolean>;
    active: z.ZodBoolean;
    animalPicture: z.ZodOptional<z.ZodString>;
    cardLink: z.ZodOptional<z.ZodString>;
    tutorId: z.ZodOptional<z.ZodNumber>;
}, z.z.core.$strip>;
export declare const updateLiveAnimalInputSchema: z.ZodObject<{
    code: z.ZodString;
    name: z.ZodOptional<z.ZodString>;
    specieId: z.ZodNumber;
    genderId: z.ZodNumber;
    birthDate: z.ZodOptional<z.ZodString>;
    age: z.ZodOptional<z.ZodBoolean>;
    active: z.ZodBoolean;
    animalPicture: z.ZodOptional<z.ZodString>;
    cardLink: z.ZodOptional<z.ZodString>;
    tutorId: z.ZodOptional<z.ZodNumber>;
}, z.z.core.$strip>;
export type GetAllLiveAnimalOutput = z.infer<typeof getAllLiveAnimalOutputSchema>;
export type GetFormOptionsAnimalOutput = z.infer<typeof getFormOptionsAnimalOutputSchema>;
export type CreateLiveAnimalInput = z.infer<typeof createLiveAnimalInputSchema>;
export type UpdateLiveAnimalInput = z.infer<typeof updateLiveAnimalInputSchema>;
//# sourceMappingURL=liveAnimal.d.ts.map