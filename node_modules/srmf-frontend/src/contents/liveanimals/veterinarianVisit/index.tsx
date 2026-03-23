import { type ContentProps } from "../../../components/content";
import {
    getVeterinarianVisits,
    type VeterinarianVisitData,
} from "../../../services/veterinarianVisitService";
import { VisitExpansion } from "./visitExpansion";
import { VisitToolBar } from "./visitToolBar";

export const VeterinarianVisitContentDefinition = {
    id: 'visitaveterinaria',
    label: 'Visita Veterinária',
    columns: [
        { key: 'id', label: 'Código', width: 'w-1/6' },
        { key: 'liveAnimalName', label: 'Animal', width: 'w-3/6' },
        { key: 'dateFormatted', label: 'Data da Realização', width: 'w-1/6' },
    ],
    filterFields: [
        { key: 'liveAnimalName', label: 'Animal', type: 'text' },
        { key: 'veterinarianName', label: 'Veterinário', type: 'text' },
        { key: 'date', label: 'Data da Realização', type: 'date' },
        { key: 'hasSample', label: 'Possui Amostra', type: 'boolean', trueLabel: 'Sim', falseLabel: 'Não' },
    ],
    rowIdField: 'id',
    renderActions: (item: VeterinarianVisitData, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(String(item.id))}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            Expandir
        </button>
    ),
    renderExpansion: (item: VeterinarianVisitData, close: () => void, refresh: () => void) => (
        <VisitExpansion item={item} close={close} refresh={refresh} />
    ),
    toolBar: (refresh: () => void) => (
        <VisitToolBar refresh={refresh} />
    ),
};

export async function fetchVeterinarianVisitData() {
    const visits = await getVeterinarianVisits();
    return visits.map(v => ({
        ...v,
        dateFormatted: new Date(v.date).toLocaleDateString('pt-BR'),
    }));
}

export const VeterinarianVisitContent: ContentProps<VeterinarianVisitData> = {
    ...VeterinarianVisitContentDefinition,
    data: [],
} as unknown as ContentProps<VeterinarianVisitData>;
