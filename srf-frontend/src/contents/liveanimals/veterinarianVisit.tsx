import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { type ContentProps } from "../../components/content";
import {
    getVeterinarianVisits,
    getVeterinarianVisitOptions,
    createVeterinarianVisit,
    updateVeterinarianVisit,
    deleteVeterinarianVisit,
    type VeterinarianVisitData,
    type VeterinarianVisitFormOptions,
    type BodyMeasurementData,
} from "../../services/veterinarianVisitService";

// ===================== FORM MODAL =====================

interface VeterinarianVisitFormModalProps {
    visit?: VeterinarianVisitData;
    close: () => void;
    refresh: () => void;
}

function VeterinarianVisitFormModal({ visit, close, refresh }: VeterinarianVisitFormModalProps) {
    const isEditing = !!visit;

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<VeterinarianVisitFormOptions | null>(null);

    // Form fields
    const [visitId, setVisitId] = useState(visit?.id || '');
    const [liveAnimalId, setLiveAnimalId] = useState(visit?.liveAnimalId || '');
    const [veterinarianId, setVeterinarianId] = useState(visit?.veterinarianId || '');
    const [date, setDate] = useState(visit?.date ? new Date(visit.date).toISOString().slice(0, 10) : '');
    const [cardLink, setCardLink] = useState(visit?.cardLink || '');
    const [bodyMeasurements, setBodyMeasurements] = useState<BodyMeasurementData[]>(
        visit?.bodyMeasurements || []
    );

    useEffect(() => {
        async function loadOptions() {
            try {
                const opts = await getVeterinarianVisitOptions();
                setOptions(opts);
            } catch (error) {
                console.error(error);
            }
        }
        loadOptions();
    }, []);

    function addMeasurement() {
        setBodyMeasurements([...bodyMeasurements, { bodyMeasurementTypeId: '', value: 0 }]);
    }

    function removeMeasurement(index: number) {
        setBodyMeasurements(bodyMeasurements.filter((element, i) => i !== index));
    }

    function updateMeasurement(index: number, field: string, value: any) {
        const updated = [...bodyMeasurements];
        (updated[index] as any)[field] = field === 'value' ? parseFloat(value) : value;
        setBodyMeasurements(updated);
    }

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        setLoading(true);
        setError(null);

        try {
            if (isEditing) {
                const data = {
                    liveAnimalId: liveAnimalId,
                    veterinarianId: veterinarianId,
                    date: date,
                    cardLink: cardLink,
                    bodyMeasurements: bodyMeasurements.map(bm => ({
                        bodyMeasurementTypeId: bm.bodyMeasurementTypeId,
                        value: bm.value,
                    })),
                };
                await updateVeterinarianVisit(visit!.id, data);
            } else {
                const data = {
                    id: visitId,
                    liveAnimalId: liveAnimalId,
                    veterinarianId: veterinarianId,
                    date: date,
                    cardLink: cardLink,
                    bodyMeasurements: bodyMeasurements.map(bm => ({
                        bodyMeasurementTypeId: bm.bodyMeasurementTypeId,
                        value: bm.value,
                    })),
                };
                await createVeterinarianVisit(data);
            }

            refresh();
            close();
        } catch (error: any) {
            console.error(error);
            setError(error.response?.data?.error || 'Erro ao salvar');
        } finally {
            setLoading(false);
        }
    }

    if (!options) {
        return (
            <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                <div className="bg-white rounded-2xl shadow-xl p-10">Carregando opções...</div>
            </div>
        );
    }

    return (
        <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4">
            <div className="relative flex flex-col bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-200 max-h-[90vh]">
                <button
                    onClick={() => close()}
                    className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                >
                    ✕
                </button>

                <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                    {isEditing ? 'Editando Visita Veterinária' : 'Nova Visita Veterinária'}
                </h2>

                <form onSubmit={handleSubmit} className="w-full flex flex-col gap-4 mt-2 flex-1 min-h-0">
                    <div className="grid grid-cols-2 gap-4">
                        {/* Visit */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Código</label>
                            <input
                                type="text"
                                value={visitId}
                                onChange={(e) => setVisitId(e.target.value)}
                                className={`border border-border rounded p-2 ${isEditing ? 'bg-form-bg' : 'bg-white'}`}
                                disabled={isEditing}
                                required
                                placeholder="Código da visita..."
                            />
                        </div>
                        {/* Animal */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Animal</label>
                            <select
                                value={liveAnimalId}
                                onChange={(e) => setLiveAnimalId(e.target.value)}
                                className="border border-border rounded p-2 bg-white"
                                required
                            >
                                <option value="">Selecione...</option>
                                {options.liveAnimals.map(a => (
                                    <option key={a.id} value={a.id}>{a.name}</option>
                                ))}
                            </select>
                        </div>

                        {/* Veterinarian */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Veterinário</label>
                            <select
                                value={veterinarianId}
                                onChange={(e) => setVeterinarianId(e.target.value)}
                                className="border border-border rounded p-2 bg-white"
                                required
                            >
                                <option value="">Selecione...</option>
                                {options.veterinarians.map(v => (
                                    <option key={v.id} value={v.id}>{v.name}</option>
                                ))}
                            </select>
                        </div>

                        {/* Date */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Data da Realização</label>
                            <input
                                type="date"
                                value={date}
                                onChange={(e) => setDate(e.target.value)}
                                className="border border-border rounded p-2"
                                required
                            />
                        </div>

                        {/* Card Link */}
                        <div className="flex flex-col col-span-2">
                            <label className="text-sm font-bold mb-1 text-left">Link da Carteirinha</label>
                            <input
                                type="text"
                                value={cardLink}
                                onChange={(e) => setCardLink(e.target.value)}
                                className="border border-border rounded p-2"
                                placeholder="https://..."
                            />
                        </div>
                    </div>

                    {/* Body Measurements */}
                    <div className="flex flex-col gap-2 mt-2 flex-1 min-h-0 overflow-y-auto">
                        <div className="flex justify-between items-center">
                            <label className="text-sm font-bold text-left">Medidas Corporais</label>
                            <button
                                type="button"
                                onClick={addMeasurement}
                                className="text-sm bg-standard-blue text-white px-3 py-1 rounded cursor-pointer"
                            >
                                + Adicionar Medida
                            </button>
                        </div>

                        {bodyMeasurements.length === 0 && (
                            <p className="text-sm text-text-light-gray italic text-center">Nenhuma medida adicionada</p>
                        )}

                        {bodyMeasurements.map((bm, index) => {
                            const selectedType = options.bodyMeasurementTypes.find(t => t.id === bm.bodyMeasurementTypeId);
                            return (
                                <div key={index} className="flex gap-2 items-end bg-form-bg p-3 rounded">
                                    <div className="flex flex-col flex-1">
                                        <label className="text-xs font-bold mb-1 text-left">Tipo</label>
                                        <select
                                            value={bm.bodyMeasurementTypeId}
                                            onChange={(e) => updateMeasurement(index, 'bodyMeasurementTypeId', e.target.value)}
                                            className="border border-border rounded p-2 bg-white"
                                            required
                                        >
                                            <option value="">Selecione...</option>
                                            {options.bodyMeasurementTypes.map(t => (
                                                <option key={t.id} value={t.id}>{t.description} ({t.unit})</option>
                                            ))}
                                        </select>
                                    </div>

                                    <div className="flex flex-col w-32">
                                        <label className="text-xs font-bold mb-1 text-left">
                                            Valor {selectedType ? `(${selectedType.unit})` : ''}
                                        </label>
                                        <input
                                            type="number"
                                            step="0.01"
                                            value={bm.value}
                                            onChange={(e) => updateMeasurement(index, 'value', e.target.value)}
                                            className={`border border-border rounded p-2 ${selectedType ? 'bg-white' : 'bg-gray-100'}`}
                                            disabled={!selectedType}
                                            required
                                        />
                                    </div>

                                    <button
                                        type="button"
                                        onClick={() => removeMeasurement(index)}
                                        className="text-button-red font-bold text-xl cursor-pointer px-2 pb-2"
                                        title="Remover medida"
                                    >
                                        ✕
                                    </button>
                                </div>
                            );
                        })}
                    </div>

                    {error && <p className="text-red-500 text-sm">{error}</p>}

                    <div className="flex justify-center items-center gap-5 mt-2">
                        <button
                            type="submit"
                            className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                            disabled={loading}
                        >
                            {loading ? 'Salvando...' : 'Salvar'}
                        </button>
                        <button
                            type="button"
                            onClick={() => close()}
                            className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                        >
                            Cancelar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

// ===================== DELETE MODAL =====================

interface DeleteVisitModalProps {
    visit: VeterinarianVisitData;
    close: () => void;
    refresh: () => void;
}

function DeleteVisitModal({ visit, close, refresh }: DeleteVisitModalProps) {
    const [loading, setLoading] = useState(false);

    async function handleDelete(e: React.FormEvent) {
        e.preventDefault();
        setLoading(true);
        try {
            await deleteVeterinarianVisit(visit.id);
            refresh();
            close();
        } catch (error) {
            console.error(error);
        } finally {
            setLoading(false);
        }
    }

    return (
        <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 p-4">
            <div className="relative flex flex-col bg-white w-full max-w-lg justify-center items-center rounded-2xl shadow-xl p-6 md:p-10">
                <button
                    onClick={() => close()}
                    className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                >
                    ✕
                </button>

                <h2 className="text-2xl text-standard-blue font-bold -mt-6 mb-6">
                    Confirmação de Exclusão
                </h2>

                <form onSubmit={handleDelete} className="w-full h-full flex flex-col items-center justify-center">
                    <p className="text-xl text-center">
                        Deseja realmente excluir a visita <span className="font-bold">{visit.id}</span>?
                    </p>

                    <div className="flex justify-center items-center gap-5 mt-4">
                        <button
                            type="submit"
                            className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                            disabled={loading}
                        >
                            {loading ? 'Confirmando...' : 'Confirmar'}
                        </button>
                        <button
                            type="button"
                            onClick={() => close()}
                            className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                        >
                            Cancelar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

// ===================== TOOLBAR =====================

function VisitToolBar({ refresh }: { refresh: () => void }) {
    const [showCreateModal, setShowCreateModal] = useState(false);

    return (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6 flex flex-col">
            <h3 className="font-bold text-text-main uppercase text-xs">Visitas Veterinárias</h3>
            <button
                onClick={() => setShowCreateModal(true)}
                className="bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm w-1/4"
            >
                Novo Registro
            </button>
            {showCreateModal && (
                <VeterinarianVisitFormModal
                    close={() => setShowCreateModal(false)}
                    refresh={refresh}
                />
            )}
        </div>
    );
}

// ===================== EXPANSION =====================

function VisitExpansion({ item, close, refresh }: { item: VeterinarianVisitData; close: () => void; refresh: () => void }) {
    const [showFormModal, setShowFormModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const navigate = useNavigate();

    return (
        <>
            {showFormModal && (
                <VeterinarianVisitFormModal
                    visit={item}
                    close={() => setShowFormModal(false)}
                    refresh={refresh}
                />
            )}
            {showDeleteModal && (
                <DeleteVisitModal
                    visit={item}
                    close={() => setShowDeleteModal(false)}
                    refresh={refresh}
                />
            )}
            {/* ==== Expansion Header ==== */}
            <div className="sticky top-0 z-10 bg-form-bg pb-2">
                <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                    <h3 className="font-bold text-text-main uppercase">Detalhes da Visita</h3>
                    <div className="flex gap-2 text-xs font-bold uppercase">
                        {item.canEdit && (
                            <button onClick={() => setShowFormModal(true)} className="text-button-green uppercase cursor-pointer">
                                Editar
                            </button>
                        )}
                        {item.canEdit && (
                            <button onClick={() => setShowDeleteModal(true)} className="text-button-red uppercase cursor-pointer">
                                Excluir
                            </button>
                        )}
                        <button onClick={close} className="text-standard-blue uppercase cursor-pointer">Recolher</button>
                    </div>
                </div>
                <div className="flex gap-2 w-full text-sm">
                    <div className="flex flex-col w-1/6">
                        <label htmlFor="name" className="ml-1 font-bold">Código da Visita</label>
                        <input type="text" disabled value={item.id} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-3/6">
                        <label htmlFor="email" className="ml-1 font-bold">Animal</label>
                        <input type="text" disabled value={item.liveAnimalName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-1/6">
                        <label htmlFor="date" className="ml-1 font-bold">Data da Realização</label>
                        <input type="text" disabled value={item.dateFormatted} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>
                <hr className="border-gray-200" />

            </div>
            {/* ==== Expansion Body ==== */}
            <div className="gap-2 w-full text-sm grid grid-cols-3 mb-1">
                <div className="flex flex-col w-full">
                    <label htmlFor="email" className="ml-1 font-bold">Veterinário</label>
                    <input type="text" disabled value={item.veterinarianName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                </div>
                <div className="flex flex-col w-full col-span-2">
                    <label htmlFor="email" className="ml-1 font-bold">Link da Carteirinha</label>
                    <input type="text" disabled value={item.cardLink || 'Nenhum link informado'} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                </div>
            </div>

            {item.bodyMeasurements.length > 0 && (
                <>
                    <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                        <h3 className="font-bold text-text-main uppercase">Medidas Corporais</h3>
                    </div>
                    <div className="gap-2 w-full text-sm grid grid-cols-3 mb-1">
                        {item.bodyMeasurements.map(bm => (
                            <div className="flex flex-col w-full">
                                <label htmlFor="email" className="ml-1 font-bold">{bm.bodyMeasurementTypeDescription} ({bm.bodyMeasurementTypeUnit})</label>
                                <input type="text" disabled value={bm.value} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                            </div>
                        ))}
                    </div>
                </>
            )}
            {item.hasSample && (
                <>
                    <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                        <h3 className="font-bold text-text-main uppercase">Amostras Coletadas na Visita</h3>
                    </div>
                    <div className="gap-2 w-full text-sm grid grid-cols-3 mb-1">
                        <button
                            onClick={() => navigate(`/animaisvivos/veterinario/amostraveterinaria?column=veterinarianVisitId&filter=${encodeURIComponent(item.id)}`)}
                            className="bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm"
                        >
                            Visualizar
                        </button>
                    </div>
                </>
            )}
        </>
    );
}

// ===================== CONTENT DEFINITION =====================

export const VeterinarianVisitContentDefinition = {
    id: 'visitaveterinaria',
    label: 'Visita Veterinária',
    columns: [
        { key: 'id', label: 'Código', width: 'w-1/6' },
        { key: 'liveAnimalName', label: 'Animal', width: 'w-3/6' },
        { key: 'dateFormatted', label: 'Data da Realização', width: 'w-1/6' },
    ],
    rowIdField: 'id',
    renderActions: (item: VeterinarianVisitData, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(item.id)}
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
