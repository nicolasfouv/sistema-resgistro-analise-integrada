import { useState, useEffect, useMemo } from "react";
import { ModalPortal } from "../../../components/modalPortal";
import {
    type GetAllCastrationOutput,
    type GetFormOptionsCastrationOutput
} from "srf-shared-types";
import {
    getCastrationFormOptions,
    createCastration,
    updateCastration
} from "../../../services/liveanimals/castrationService";

interface CastrationFormModalProps {
    castration?: GetAllCastrationOutput;
    close: () => void;
    refresh: () => void;
}

export function CastrationFormModal({ castration, close, refresh }: CastrationFormModalProps) {
    const isEditing = !!castration;

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<GetFormOptionsCastrationOutput | null>(null);

    // Campo principal: Animal (obrigatório)
    const [selectedAnimalId, setSelectedAnimalId] = useState<number | ''>(castration?.liveAnimalId || '');

    // Campos da visita associada (opcional)
    const [selectedDate, setSelectedDate] = useState<string>('');
    const [selectedAssigneeId, setSelectedAssigneeId] = useState<number | ''>(castration?.assigneeId || '');

    // Campos do formulário
    const [castrationDate, setCastrationDate] = useState(castration?.date ? new Date(castration.date).toISOString().slice(0, 10) : '');
    const [note, setNote] = useState(castration?.note || '');

    useEffect(() => {
        async function loadOptions() {
            try {
                const opts = await getCastrationFormOptions();
                setOptions(opts);

                // Pré-preencher seletores no modo edição
                if (castration) {
                    setSelectedAnimalId(castration.liveAnimalId);

                    if (castration.veterinarianVisitId) {
                        const matchingVisit = opts.veterinarianVisits.find(v => v.id === castration.veterinarianVisitId);
                        if (matchingVisit) {
                            setSelectedDate(matchingVisit.date);
                            setCastrationDate(new Date(matchingVisit.date).toISOString().slice(0, 10));
                        }
                    }
                }
            } catch (error) {
                console.error(error);
            }
        }
        loadOptions();
    }, []);

    // Visitas filtradas pelo animal selecionado
    const visitsForAnimal = useMemo(() => {
        if (!options || !selectedAnimalId) return [];
        return options.veterinarianVisits.filter(v => v.liveAnimal.id === selectedAnimalId);
    }, [options, selectedAnimalId]);

    // Datas disponíveis para o animal selecionado
    const filteredDates = useMemo(() => {
        const dateSet = new Map<string, string>();
        visitsForAnimal.forEach(v => {
            const dateKey = v.date;
            if (!dateSet.has(dateKey)) {
                dateSet.set(dateKey, new Date(dateKey).toLocaleDateString('pt-BR'));
            }
        });
        return Array.from(dateSet.entries()).map(([iso, formatted]) => ({ iso: iso, formatted: formatted }));
    }, [visitsForAnimal]);

    const hasVisitSelected = !!selectedDate;

    // Obter o id da visita veterinária
    const veterinarianVisitId = useMemo(() => {
        if (!options || !selectedDate || !selectedAnimalId) return null;
        const visit = options.veterinarianVisits.find(
            v => v.date === selectedDate && v.liveAnimal.id === selectedAnimalId
        );
        return visit?.id ?? null;
    }, [options, selectedDate, selectedAnimalId]);

    // Data da visita selecionada formatada para YYYY-MM-DD
    const visitDateFormatted = useMemo(() => {
        if (!selectedDate) return '';
        return new Date(selectedDate).toISOString().slice(0, 10);
    }, [selectedDate]);

    function handleAnimalChange(value: number | '') {
        setSelectedAnimalId(value);
        setSelectedDate('');
    }

    function handleDateChange(value: string) {
        setSelectedDate(value);
        setCastrationDate(new Date(value).toISOString().slice(0, 10));
    }

    function handleClearVisit() {
        setSelectedDate('');
    }

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        setError(null);
        setLoading(true);

        if (hasVisitSelected && !veterinarianVisitId) {
            setError('Selecione a data da visita ou deixe o campo de visita associada em branco.');
            setLoading(false);
            return;
        }

        // Quando há visita associada, a data da castração é a data da visita
        const finalDate = veterinarianVisitId ? visitDateFormatted : castrationDate;

        if (!finalDate) {
            setError('Informe a data da castração.');
            setLoading(false);
            return;
        }

        try {
            const data = {
                liveAnimalId: Number(selectedAnimalId),
                date: finalDate,
                veterinarianVisitId: Number(veterinarianVisitId) || undefined,
                assigneeId: Number(selectedAssigneeId) || undefined,
                note: note || undefined
            };
            if (isEditing && castration) {
                await updateCastration(castration!.id, data);
            } else {
                await createCastration(data);
            }
            refresh();
            close();
        } catch (error: any) {
            setError(error.response?.data?.error || "Erro ao salvar castração.");
        } finally {
            setLoading(false);
        }
    }

    if (!options) {
        return (
            <ModalPortal>
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="bg-white rounded-2xl shadow-xl p-10">Carregando opções...</div>
                </div>
            </ModalPortal>
        );
    }

    return (
        <ModalPortal>
            <div
                onMouseDown={close}
                className="modal-overlay flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4">
                <div onMouseDown={(e) => e.stopPropagation()} className="modal relative flex flex-col overflow-y-auto bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-220 max-h-[90vh]">
                    <button
                        onClick={() => close()}
                        className="absolute text-text-main hover:text-standard-red font-bold text-xl cursor-pointer leading-none top-3 right-3"
                        title="Fechar"
                    >
                        ✕
                    </button>

                    <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                        {isEditing ? 'Editando Castração' : 'Nova Castração'}
                    </h2>

                    <form onSubmit={handleSubmit} className="w-full flex flex-col overflow-y-auto gap-4 mt-2 flex-1 min-h-0">
                        {/* Animal */}
                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Código do Animal</label>
                                <select
                                    value={selectedAnimalId}
                                    onChange={(e) => handleAnimalChange(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.liveAnimals.map(a => (
                                        <option key={a.id} value={a.id}>{a.code}</option>
                                    ))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Responsável</label>
                                <select
                                    value={selectedAssigneeId}
                                    onChange={(e) => setSelectedAssigneeId(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white"
                                >
                                    <option value="">Selecione...</option>
                                    {options.assignees.map(assignee => (
                                        <option key={assignee.id} value={assignee.id}>{assignee.name}</option>
                                    ))}
                                </select>
                            </div>
                        </div>

                        {/* Seleção da Visita Associada (opcional) */}
                        <fieldset className={`relative col-span-2 border border-border rounded p-4 ${!selectedAnimalId ? 'bg-gray-100' : 'bg-white'}`}>
                            <legend className="text-sm font-bold text-standard-blue px-2 flex items-center gap-2">
                                Visita Associada (Opcional)
                            </legend>
                            {hasVisitSelected && (
                                <div className="absolute top-[-24px] right-2 bg-white px-2 rounded">
                                    <button
                                        type="button"
                                        onClick={() => handleClearVisit()}
                                        className="text-standard-blue font-bold text-xs cursor-pointer"
                                        title="Limpar seleção de visita"
                                    >
                                        ⭯ Limpar
                                    </button>
                                </div>
                            )}
                            <div className="grid grid-cols-1 gap-4">
                                {/* Data da Visita */}
                                <div className="flex flex-col">
                                    <label className="text-sm font-bold mb-1 text-left">Data da Visita</label>
                                    <select
                                        value={selectedDate}
                                        onChange={(e) => handleDateChange(e.target.value)}
                                        className={`border border-border rounded p-2 ${!selectedAnimalId ? 'bg-gray-100' : 'bg-white'}`}
                                        disabled={!selectedAnimalId}
                                    >
                                        <option value="">Sem visita associada...</option>
                                        {filteredDates.map(d => (
                                            <option key={d.iso} value={d.iso}>{d.formatted}</option>
                                        ))}
                                    </select>
                                </div>

                            </div>
                        </fieldset>

                        {/* Data da Castração */}
                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col col-span-2">
                                <label className="text-sm font-bold mb-1 text-left">Data da Castração</label>
                                <input
                                    type="date"
                                    value={castrationDate}
                                    onChange={(e) => setCastrationDate(e.target.value)}
                                    className={`border border-border rounded p-2 ${hasVisitSelected ? 'bg-gray-100' : 'bg-white'
                                        }`}
                                    required={!hasVisitSelected}
                                    disabled={hasVisitSelected}
                                />
                            </div>
                        </div>
                        {/* Observações */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Observações (Opcional)</label>
                            <textarea
                                value={note}
                                onChange={(e) => setNote(e.target.value)}
                                className="border border-border rounded p-2 bg-white resize-none"
                                rows={3}
                                placeholder="Digite as observações..."
                            />
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
            </div >
        </ModalPortal >
    )
}
