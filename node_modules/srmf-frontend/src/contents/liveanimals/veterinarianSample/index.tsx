import { type ContentProps } from "../../../components/content";
import { type GetAllVeterinarianSampleOutput } from "srf-shared-types";
import { getVeterinarianSamples } from "../../../services/veterinarianSampleService";
import { getVeterinarianSampleFormOptions } from "../../../services/veterinarianSampleService";
import { SampleToolBar } from "./sampleToolBar";
import { SampleExpansion } from "./sampleExpansion";

const sampleOptions = await getVeterinarianSampleFormOptions();
const sampleTypeOptions = sampleOptions.sampleTypes.map(st => ({ value: st.id, label: st.description }));
const statusOptions = sampleOptions.status.map(s => ({ value: s.id, label: s.name }));
const storageOptions = sampleOptions.storages.map(s => ({ value: s.id, label: s.name }));

export const VeterinarianSampleContentDefinition = {
    id: 'amostras-av',
    label: 'Amostra',
    columns: [
        { key: 'veterinarianVisitDateFormatted', label: 'Data da Visita', width: 'w-2/12' },
        { key: 'liveAnimalName', label: 'Animal', width: 'w-2/12' },
        { key: 'veterinarianName', label: 'Veterinário', width: 'w-2/12' },
        { key: 'sampleTypeDescription', label: 'Tipo da Amostra', width: 'w-2/12' },
        { key: 'statusName', label: 'Status', width: 'w-3/12' },
        // deixar w-1/12 sobrando para ações
    ],
    filterFields: [
        { key: 'createdByMe', label: 'Criados por mim', type: 'boolean', trueLabel: 'Sim', falseLabel: 'Não' },
        { key: 'veterinarianVisitDate', label: 'Data da Visita', type: 'date' },
        { key: 'liveAnimalName', label: 'Animal', type: 'text' },
        { key: 'veterinarianName', label: 'Veterinário', type: 'text' },
        { key: 'sampleTypeId', label: 'Tipo da Amostra', type: 'enum', options: sampleTypeOptions },
        { key: 'statusId', label: 'Status', type: 'enum', options: statusOptions },
        { key: 'storageId', label: 'Armazenamento', type: 'enum', options: storageOptions },
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
        veterinarianVisitDateFormatted: s.veterinarianVisitDate ? new Date(s.veterinarianVisitDate).toLocaleDateString('pt-BR') : '',
        sendSamples: s.sendSamples?.map(ss => ({
            ...ss,
            sendDateFormatted: ss.sendDate ? new Date(ss.sendDate).toLocaleDateString('pt-BR') : '',
        })),
    }));
};

export const VeterinarianSampleContent: ContentProps<GetAllVeterinarianSampleOutput> = {
    ...VeterinarianSampleContentDefinition,
    data: [],
} as unknown as ContentProps<GetAllVeterinarianSampleOutput>;