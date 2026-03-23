import { type ContentProps } from "../../../components/content";
import { type VeterinarianSampleData } from "../../../services/veterinarianSampleService";
import { SampleToolBar } from "./sampleToolBar";
import { SampleExpansion } from "./sampleExpansion";
import { getVeterinarianSamples } from "../../../services/veterinarianSampleService";

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
    renderActions: (item: VeterinarianSampleData, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(String(item.id))}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            Expandir
        </button>
    ),
    renderExpansion: (item: VeterinarianSampleData, close: () => void, refresh: () => void) => (
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
        sendDateFormatted: s.sendDate ? new Date(s.sendDate).toLocaleDateString('pt-BR') : '-',
    }));
};

export const VeterinarianSampleContent: ContentProps<VeterinarianSampleData> = {
    ...VeterinarianSampleContentDefinition,
    data: [],
} as unknown as ContentProps<VeterinarianSampleData>;