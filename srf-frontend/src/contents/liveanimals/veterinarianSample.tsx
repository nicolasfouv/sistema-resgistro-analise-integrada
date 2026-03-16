import { useState } from "react";
import { getVeterinarianSamples, type VeterinarianSampleData } from "../../services/veterinarianSampleService";
import type { ContentProps } from "../../components/content";


// ===================== FORM MODAL =====================
interface VeterinarianSampleFormModalProps {
    sample?: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}

function VeterinarianSampleFormModal({ sample, close, refresh }: VeterinarianSampleFormModalProps) {
    // ...
    return (
        <>
        </>
    )
}

// ===================== DELETE MODAL =====================

interface DeleteSampleModalProps {
    sample: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}
function DeleteSampleModal({ sample, close, refresh }: VeterinarianSampleFormModalProps) {
    // ...
    return (
        <>
        </>
    )
}

// ===================== TOOLBAR =====================

function SampleToolBar({ refresh }: { refresh: () => void }) {
    const [showCreateModal, setShowCreateModal] = useState(false);

    return (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6 flex flex-col">
            <h3 className="font-bold text-text-main uppercase text-xs">Amostras</h3>
            <button
                onClick={() => setShowCreateModal(true)}
                className="bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm w-1/4"
            >
                Novo Registro
            </button>
            {showCreateModal && (
                <VeterinarianSampleFormModal
                    close={() => setShowCreateModal(false)}
                    refresh={refresh}
                />
            )}
        </div>
    );
}

// ===================== EXPANSION =====================
function SampleExpansion({ item, close, refresh }: { item: VeterinarianSampleData; close: () => void; refresh: () => void }) {
    // ...
    return (
        <>
        </>
    );
}

// ===================== CONTENT DEFINITION =====================
export const VeterinarianSampleContentDefinition = {
    id: 'amostras-av',
    label: 'Amostra',
    columns: [
        { key: 'veterinarianVisitId', label: 'Visita Veterinária', width: 'w-1/4' },
        { key: 'sampleTypeDescription', label: 'Tipo da Amostra', width: 'w-1/4' },
        { key: 'statusName', label: 'Status', width: 'w-1/4' },
    ],
    rowIdField: 'id',
    renderActions: (item: VeterinarianSampleData, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(item.id)}
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