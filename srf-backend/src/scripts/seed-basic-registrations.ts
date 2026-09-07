import 'dotenv/config';
import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

interface RegistrationSeed {
    prismaModel: string;
    field: string;
    values: string[];
    secondaryField?: string;
    secondaryValues?: string[];
}

const registrationSeeds: RegistrationSeed[] = [
    {
        prismaModel: 'specie', field: 'name',
        values: [
            'Canis lupus familiaris',
            'Felis catus',
            'Cerdocyon thous',
            'Procyon cancrivorus',
            'Chrysocyon brachyurus',
            'Conepatus semistriatus',
            'Nasua nasua',
            'Puma yagouaroundi',
            'Leopardus pardalis',
            'Puma concolor',
            'Lycalopex vetulus',
            'Eira barbara'
        ]
    },
    {
        prismaModel: 'ectoparasiteGenus', field: 'name',
        values: [
            'Tunga',
            'Ctenocephalides',
            'Rhipicephalus',
            'Ambyomma',
            'Trichodectes',
            'Linognathus',
            'Sarcoptes',
            'Demodex',
            'Otodectes'
        ]
    },
    {
        prismaModel: 'ectoparasiteSpecie', field: 'name',
        values: [
            'Ctenocephalides felis felis',
            'Ctenocephalides canis',
            'Tunga penetrans',
            'Rhipicephalus sanguineus',
            'Rhipicephalus linnaei',
            'Ambyomma sculptum',
            'Rhipicephalus microplus',
            'Trichodectes canis',
            'Linognathus setosus',
            'Sarcoptes scabiei var. canis',
            'Sarcoptes scabiei var. hominis',
            'Demodex canis',
            'Otodectes cynotis'
        ]
    },
    {
        prismaModel: 'storage', field: 'name',
        values: [
            'LEMa',
            'LEIMa',
            'IOC-FIOCRUZ',
            'ScienceVet',
            'ImunoDot',
            'LEGO',
            'VBBL',
            'CHIOC',
            'Prof. Darci'
        ]
    },
    {
        prismaModel: 'enumVeterinarianSampleAllocationStatus', field: 'name',
        values: [
            'Aguardando processamento',
            'Processada',
            'Armazenada',
            'Descartada'
        ]
    },
    {
        prismaModel: 'veterinarianSampleType', field: 'description',
        values: [
            'Sangue (c/ e s/ EDTA)',
            'Soro',
            'Pêlo',
            'Mêdulo',
            'Sangue (c/ EDTA)',
            'Sangue (s/ EDTA)',
            'Fecal Loops',
            'Swab',
            'Fezes'
        ]
    },
    {
        prismaModel: 'veterinarian', field: 'name',
        values: [
            'Victoria Rosy Machado',
            'Gabriela Alves'
        ]
    },
    {
        prismaModel: 'vaccine', field: 'name',
        values: [
            'V8',
            'Raiva'
        ]
    },
    {
        prismaModel: 'enumVaccineType', field: 'name',
        values: [
            'Reforço',
            'Protocolo de filhote - V8'
        ]
    },
    {
        prismaModel: 'enumExamInterpretation', field: 'name',
        values: [
            'Sem alterações',
            'Alterações discretas',
            'Alterações moderadas',
            'Alterações acentuadas',
            'Inconclusivo - amostra inadequada',
            'Não realizado'
        ]
    },
    {
        prismaModel: 'processingTechnology', field: 'name',
        values: [
            'Sedimentação espontânea (Hoffman-Pons-Janer / Lutz)',
            'Sedimentação em formol-éter ou formol-acetato de etila (Ritchie modificado)',
            'Flutuação em NaCl saturado (Willis-Mollay)',
            'Flutuação centrífuga em sulfato de zinco (Faust)',
            'Flutuação em sacarose (Sheather)',
            'Coloração para Cryptosporidium (Ziehl-Neelsen modificado / Kinyoun)'
        ]
    },
    {
        prismaModel: 'eggCystSpecie', field: 'name',
        values: [
            'Ancylostoma caninum',
            'Ancylostoma braziliense',
            'Uncinaria stenocephala',
            'Dipylidium caninum',
            'Trichuris vulpis',
            'Cystoisospora caninum',
            'Giardia spp.'
        ]
    },
    {
        prismaModel: 'enumPhysicalExamGeneralCondition', field: 'name',
        values: [
            'Bom',
            'Regular',
            'Ruim'
        ]
    },
    {
        prismaModel: 'enumMucous', field: 'name',
        values: [
            'Hipocorada',
            'Normocorada',
            'Hiperêmica'
        ]
    },
    {
        prismaModel: 'enumHydration', field: 'name',
        values: [
            'Hidratado',
            'Desidratação leve',
            'Desidratação moderada',
            'Desidratação grave',
            'Desidratação crítica'
        ]
    },
    {
        prismaModel: 'enumSorologyResultType', field: 'name',
        values: [
            'Título',
            'Densidade Óptica (D.O.)'
        ]
    },
    {
        prismaModel: 'enumSorologyInterpretation', field: 'name',
        values: [
            'Positivo',
            'Negativo',
            'Inconclusivo'
        ]
    },
    {
        prismaModel: 'sorologyTest', field: 'name',
        values: [
            'ELISA (ensaio imunoenzimático)',
            'IFA/RIFI (reação de imunofluorescência indireta)'
        ]
    },
    {
        prismaModel: 'sorologyAgent', field: 'name',
        values: [
            'Ehrlichia canis',
            'Babesia canis',
            'Leishmania chagasi',
            'Toxoplasma gondii',
            'Neospora caninum',
            'Bartonella henselae'
        ]
    },
    {
        prismaModel: 'trackingDevice', field: 'brand',
        values: [
            'I-got',
            'Columbus',
            'Novo 1'
        ],
        secondaryField: 'serialNumber',
        secondaryValues: [
            '',
            '',
            ''
        ]
    },
    {
        prismaModel: 'monitoringMethod', field: 'description',
        values: [
            'Minimum Convex Polygon (MCP)',
            'Kernel Density Estimation (KDE)',
            'Autocorrelated Kernel Density Estimation (AKDE)',
            'Brownian Bridge Movement Model (BBMM)',
            'Dynamic Brownian Bridge Movement Model (dBBMM)'
        ]
    },
    {
        prismaModel: 'bodyMeasurementTypeVeterinarian', field: 'description',
        values: [
            'Comprimento total',
            'Comprimento cabeça-corpo',
            'Comprimento dorsal',
            'Comprimento da cauda vertebral',
            'Comprimento da cabeça',
            'Largura da cabeça',
            'Distância entre os olhos',
            'Circunferência do pescoço',
            'Circunferência torácica',
            'Altura na cernelha (ombro frontal)'
        ],
        secondaryField: 'unit',
        secondaryValues: [
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm'
        ]
    },
    {
        prismaModel: 'deadAnimalGroup', field: 'name',
        values: [
            'Doméstico',
            'Silvestre'
        ]
    },
    {
        prismaModel: 'enumDeadAnimalOrigin', field: 'name',
        values: [
            'Atropelamento',
            'Canil'
        ]
    },
    {
        prismaModel: 'enumDeadAnimalStatus', field: 'name',
        values: [
            'LEIMa',
            'PEFBJ',
            'Necropsia feita',
            'Em análise'
        ]
    },
    {
        prismaModel: 'collectionResponsible', field: 'name',
        values: [
            'DER',
            'PEFBJ',
            'Prefeitura',
            'Natalie'
        ]
    },
    {
        prismaModel: 'enumBodyCondition', field: 'name',
        values: [
            'Íntegro',
            'Danificado',
            'Decomposto'
        ]
    },
    {
        prismaModel: 'enumClinicalCondition', field: 'name',
        values: [
            'Bom',
            'Regular',
            'Ruim',
            'Não se aplica'
        ]
    },
    {
        prismaModel: 'enumReproductiveCondition', field: 'name',
        values: [
            'Nulípara',
            'Pré-púbere',
            'Pós-púbere',
            'Multípara/provavelmente lactante',
            'Indeterminada',
            'Primípara',
            'Castrada',
            'Multípara',
            'Lactante'
        ]
    },
    {
        prismaModel: 'enumAge', field: 'name',
        values: [
            'Jovem',
            'Adulto',
            'Idoso'
        ]
    },
    {
        prismaModel: 'helminthSpecie', field: 'name',
        values: [
            'Toxocara cati',
            'Toxocara canis',
            'Ancylostoma caninum',
            'Ancylostoma braziliense',
            'Uncinaria stenocephala',
            'Dipylidium caninum',
            'Trichuris vulpis',
            'Cystoisospora caninum',
            'Giardia spp.',
            'Capillaria spp',
            'Spirocerca lupi',
            'Physaloptera spp',
            'Strongyloides stercoralis',
            'Taenia spp - Spirometra mansoni',
            'Dioctophyma renale',
            'Platynosomum spp',
            'Echinostoma spp',
            'Eimeria spp'
        ]
    },
    {
        prismaModel: 'helminthLocation', field: 'name',
        values: [
            'Traqueia',
            'Pulmão',
            'Cavidade Toraxica',
            'Estomago',
            'Intestino',
            'Intestino delgado'
        ]
    },
    {
        prismaModel: 'enumNecropsySampleAllocationStatus', field: 'name',
        values: [
            'Aguardando processamento',
            'Processada'
        ]
    },
    {
        prismaModel: 'necropsySampleType', field: 'description',
        values: [
            'Pelo',
            'Sangue',
            'Ectoparasitos',
            'Baço congelado',
            'Baço em etanol',
            'Coração em formol',
            'Fígado em formol',
            'Fígado em etanol',
            'Fígado em RNA Later',
            'Pulmão em RNA Later',
            'Instestino em RNA Later',
            'Cérebro em RNA Later',
            'Helmintos',
            'Conteúdo Esstomacal',
            'Conteúdo Intestinal',
            'Pele',
            'Crânio',
            'Esqueleto',
            'Pulmão Congelado'
        ]
    },
    {
        prismaModel: 'bodyMeasurementTypeNecropsy', field: 'description',
        values: [
            'Comprimeto do Corpo',
            'Comprimento da cauda',
            'Altura Escapular',
            'Circunferência do pescoço',
            'Circunferencia toraxica',
            'Comprimento da cabeça'
        ],
        secondaryField: 'unit',
        secondaryValues: [
            'cm',
            'cm',
            'cm',
            'cm',
            'cm',
            'cm'
        ]
    },
    {
        prismaModel: 'cpcrSampleType', field: 'description',
        values: [
            'Sangue',
            'Pulmão',
            'Baço',
            'Coração',
            'Intestino',
            'Fígado',
            'Cérebro'
        ]
    },
    {
        prismaModel: 'qpcrSampleType', field: 'description',
        values: [
            'Sangue',
            'Pulmão',
            'Baço',
            'Coração',
            'Intestino',
            'Fígado',
            'Cérebro'
        ]
    },
    {
        prismaModel: 'extractionType', field: 'name',
        values: [
            'TRIzol®',
            'fenol-clorofórmio',
            'DNeasy®'
        ]
    },
    // { prismaModel: 'targetGene', field: 'name', values: [] },
    {
        prismaModel: 'suspiciousAgent', field: 'name',
        values: [
            'Anaplasmataceae',
            'hemoplasmas',
            'piroplasmídeos',
            'Hepatozoon'
        ]
    },
    {
        prismaModel: 'enumCpcrMethod', field: 'name',
        values: [
            'cPCR (PCR convencional)',
            'nPCR (nested PCR)',
            'cPCR e nPCR'
        ]
    },
    {
        prismaModel: 'enumCpcrStatus', field: 'name',
        values: [
            'Positivo',
            'Negativo',
            'Inconclusivo'
        ]
    },
    {
        prismaModel: 'enumQpcrStatus', field: 'name',
        values: [
            'Positivo',
            'Negativo',
            'Inconclusivo'
        ]
    },
];

async function seedRegistration(tx: PrismaClient, registration: RegistrationSeed) {
    const model = (tx as any)[registration.prismaModel];

    await model.deleteMany();

    for (const [index, value] of registration.values.entries()) {
        const where = {
            [registration.field]: value,
            ...(registration.secondaryField ? { [registration.secondaryField]: registration.secondaryValues?.[index] ?? '' } : {}),
        };
        const existing = await model.findFirst({ where: where });
        if (!existing) {
            await model.create({ data: where });
        }
    }

}

// Execução principal
export async function seedBasicRegistrations() {
    await prisma.$transaction(async (tx) => {
        for (const registration of registrationSeeds) {
            await seedRegistration(tx as unknown as PrismaClient, registration);
        }
    });
}