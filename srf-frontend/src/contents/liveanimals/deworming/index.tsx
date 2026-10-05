import { type ContentProps } from "../../../components/content";
import { type GetAllDewormingOutput } from "srf-shared-types";
import { getDewormings } from "../../../services/liveanimals/dewormingService";
import { DewormingToolBar } from "./dewormingToolBar";
import { DewormingExpansion } from "./dewormingExpansion";

export const DewormingContentDefinition = {
    id: 'vermifugacao',
    label: 'Vermifugações',
    columns: [
        { key: 'liveAnimalCode', label: 'Código do Animal', width: 'w-2/12' },
        { key: 'assigneeName', label: 'Responsável', width: 'w-2/12' },
        { key: 'medicationName', label: 'Medicamento Utilizado', width: 'w-3/12' },
        { key: 'startDateFormatted', label: 'Data de Início', width: 'w-2/12' },
        { key: 'endDateFormatted', label: 'Data de Fim', width: 'w-2/12' }
    ],
    filterFields: [
        { key: 'createdByMe', label: 'Criados por mim', type: 'boolean', trueLabel: 'Sim', falseLabel: 'Não' },
        { key: 'liveAnimalCode', label: 'Código do Animal', type: 'text' },
        { key: 'medicationName', label: 'Medicamento Utilizado', type: 'text' },
        { key: 'assigneeName', label: 'Responsável', type: 'text' },
        { key: 'startDate', label: 'Data de Início', type: 'date' },
        { key: 'endDate', label: 'Data de Fim', type: 'date' }
    ],
    rowIdField: 'id',
    renderActions: (item: GetAllDewormingOutput, _isExpanded: boolean, toggle: (id: string) => void) => (
        <button
            onClick={() => toggle(String(item.id))}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            Expandir
        </button>
    ),
    renderExpansion: (item: GetAllDewormingOutput, close: () => void, refresh: () => void) => (
        <DewormingExpansion item={item} close={close} refresh={refresh} />
    ),
    toolBar: (refresh: () => void) => <DewormingToolBar refresh={refresh} />
};

export async function fetchDewormingData() {
    const records = await getDewormings();
    return records.map(record => ({
        ...record,
        startDateFormatted: new Date(record.startDate).toLocaleDateString('pt-BR', { timeZone: 'UTC' }),
        endDateFormatted: record.endDate
            ? new Date(record.endDate).toLocaleDateString('pt-BR', { timeZone: 'UTC' })
            : '—'
    }));
}

export const DewormingContent: ContentProps<GetAllDewormingOutput> = Object.assign(
    Object.create(DewormingContentDefinition),
    { data: [] }
) as unknown as ContentProps<GetAllDewormingOutput>;
