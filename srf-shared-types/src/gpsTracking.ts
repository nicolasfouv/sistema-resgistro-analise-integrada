import z from 'zod';

// model gpsTracking {
//   id                          Int              @id @default(autoincrement())
//   liveAnimalId                Int              @unique @map("id_animal_vivo")
//   liveAnimal                  liveAnimal       @relation(fields: [liveAnimalId], references: [id])
//   trackingDeviceId            Int              @map("id_dispositivo_rastreio")
//   trackingDevice              trackingDevice   @relation(fields: [trackingDeviceId], references: [id])
//   startDate                   DateTime         @map("data_inicio")
//   endDate                     DateTime?        @map("data_fim")
//   note                        String?          @map("observacao")
//   monitoredDays               Int              @map("dias_monitorados")
//   locationPoints              Int              @map("pontos_localizacao")
//   livingArea                  Float            @map("area_vida")
//   monitoringMethodId          Int              @map("id_metodo_monitoramento")
//   monitoringMethod            monitoringMethod @relation(fields: [monitoringMethodId], references: [id])
//   rawSpreadsheetLink          String?          @map("link_planilha_bruta")
//   rawSpreadsheetUpdateDate    DateTime?        @map("data_atualizacao_planilha_bruta")
//   editedSpreadsheetLink       String?          @map("link_planilha_editada")
//   editedSpreadsheetUpdateDate DateTime?        @map("data_atualizacao_planilha_editada")
//
//   @@map("rastreio_gps")
// }

export const gpsTrackingSchema = z.object({
    id: z.number().int(),
    assigneeId: z.number().int(),
    liveAnimalId: z.number().int(),
    trackingDeviceId: z.number().int(),
    startDate: z.string().nonempty(),
    endDate: z.string().nullable().optional(),
    note: z.string().nullable().optional(),
    monitoredDays: z.number().int(),
    locationPoints: z.number().int(),
    livingArea: z.number(),
    monitoringMethodId: z.number().int(),
    rawSpreadsheetLink: z.string().nullable().optional(),
    rawSpreadsheetUpdateDate: z.string().nullable().optional(),
    editedSpreadsheetLink: z.string().nullable().optional(),
    editedSpreadsheetUpdateDate: z.string().nullable().optional()
});

export const createGpsTrackingInputSchema = gpsTrackingSchema.omit({
    id: true,
});

export const updateGpsTrackingInputSchema = gpsTrackingSchema.omit({
    id: true,
});

export const getAllGpsTrackingOutputSchema = gpsTrackingSchema.extend({
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    liveAnimalCode: z.string().nonempty(),
    trackingDeviceBrandSerialNumber: z.string().nonempty(),
    lastUpdateDate: z.string().nullable().optional(),
    lastUpdateDateFormatted: z.string().optional(),
    startDateFormatted: z.string().optional(),
    endDateFormatted: z.string().nullable().optional(),
    monitoringMethodDescription: z.string().nonempty(),
    rawSpreadsheetUpdateDateFormatted: z.string().nullable().optional(),
    editedSpreadsheetUpdateDateFormatted: z.string().nullable().optional(),
    withdrawn: z.boolean(),
    assigneeName: z.string().nonempty()
});

export const getFormOptionsGpsTrackingOutputSchema = z.object({
    liveAnimals: z.array(z.object({
        id: z.number().int(),
        code: z.string().nonempty(),
    })),
    trackingDevices: z.array(z.object({
        id: z.number().int(),
        brand: z.string().nonempty(),
        serialNumber: z.string().nonempty(),
    })),
    monitoringMethods: z.array(z.object({
        id: z.number().int(),
        description: z.string().nonempty(),
    })),
    assignees: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty()
    }))
});

export type GpsTracking = z.infer<typeof gpsTrackingSchema>;

// Inputs
export type CreateGpsTrackingInput = z.infer<typeof createGpsTrackingInputSchema>;
export type UpdateGpsTrackingInput = z.infer<typeof updateGpsTrackingInputSchema>;

// Outputs
export type GetAllGpsTrackingOutput = z.infer<typeof getAllGpsTrackingOutputSchema>;
export type GetFormOptionsGpsTrackingOutput = z.infer<typeof getFormOptionsGpsTrackingOutputSchema>;
