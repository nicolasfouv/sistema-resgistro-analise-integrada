import { type ContentProps } from "../../../components/content";
import { type GetAllVeterinarianSampleOutput } from "srf-shared-types";
import { getVeterinarianSamples } from "../../../services/veterinarianSampleService";
import { SampleToolBar } from "./sampleToolBar";
import { SampleExpansion } from "./sampleExpansion";

export const VeterinarianSampleContentDefinition = {
    id: 'amostras-av',
    label: 'Amostra',
    columns: [
        { key: 'veterinarianVisitId', label: 'Visita Veterinária', width: 'w-1/4' },
        { key: 'sampleTypeDescription', label: 'Tipo da Amostra', width: 'w-1/4' },
        { key: 'statusName', label: 'Status', width: 'w-1/4' },
    ],
    filterFields: [
        { key: 'sampleTypeDescription', label: 'Tipo da Amostra', type: 'text' },
        { key: 'statusName', label: 'Status', type: 'text' },
        { key: 'createdByMe', label: 'Criados por mim', type: 'boolean', trueLabel: 'Sim', falseLabel: 'Não' },
    ],
    rowIdField: 'id',
    renderActions: (item: GetAllVeterinarianSampleOutput, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(String(item.id))}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            Expandir
        </button>
    ),
    renderExpansion: (item: GetAllVeterinarianSampleOutput, close: () => void, refresh: () => void) => (
        <SampleExpansion item={item} close={close} refresh={refresh} />
    ),
    toolBar: (refresh: () => void) => (
        <SampleToolBar refresh={refresh} />
    ),
};

export async function fetchVeterinarianSampleData() {
    const samples = await getVeterinarianSamples();
    return samples.map(s => ({
        ...s,
        veterinarianVisitDate: s.veterinarianVisitDate ? new Date(s.veterinarianVisitDate).toLocaleDateString('pt-BR') : '',
        sendSamples: s.sendSamples?.map(ss => ({
            ...ss,
            sendDate: ss.sendDate ? new Date(ss.sendDate).toLocaleDateString('pt-BR') : '',
        })),
    }));
};

export const VeterinarianSampleContent: ContentProps<GetAllVeterinarianSampleOutput> = {
    ...VeterinarianSampleContentDefinition,
    data: [],
} as unknown as ContentProps<GetAllVeterinarianSampleOutput>;