import { useEffect, useMemo, useState } from "react";
import { ModalPortal } from "../../../components/modalPortal";
import {
    type GetAllDewormingOutput,
    type GetFormOptionsDewormingOutput
} from "srf-shared-types";
import {
    createDeworming,
    getDewormingFormOptions,
    updateDeworming
} from "../../../services/liveanimals/dewormingService";

interface DewormingFormModalProps {
    deworming?: GetAllDewormingOutput;
    close: () => void;
    refresh: () => void;
}

function toDateInputValue(date?: string) {
    return date ? new Date(date).toISOString().slice(0, 10) : '';
}

export function DewormingFormModal({ deworming, close, refresh }: DewormingFormModalProps) {
    const isEditing = !!deworming;
    const [loading, setLoading] = useState(false);
    const [optionsLoading, setOptionsLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<GetFormOptionsDewormingOutput | null>(null);
    const [liveAnimalId, setLiveAnimalId] = useState<number | ''>(deworming?.liveAnimalId ?? '');
    const [assigneeId, setAssigneeId] = useState<number | ''>(deworming?.assigneeId ?? '');
    const [veterinarianVisitId, setVeterinarianVisitId] = useState<number | ''>(deworming?.veterinarianVisitId ?? '');
    const [medicationId, setMedicationId] = useState<number | ''>(deworming?.medicationId ?? '');
    const [startDate, setStartDate] = useState(toDateInputValue(deworming?.startDate));
    const [endDate, setEndDate] = useState(toDateInputValue(deworming?.endDate));
    const [note, setNote] = useState(deworming?.note ?? '');

    const visitsForAnimal = useMemo(() => {
        if (!options || !liveAnimalId) return [];
        return options.veterinarianVisits.filter(visit => visit.liveAnimal.id === liveAnimalId);
    }, [options, liveAnimalId]);

    const selectedVisit = useMemo(
        () => visitsForAnimal.find(visit => visit.id === veterinarianVisitId),
        [visitsForAnimal, veterinarianVisitId]
    );

    useEffect(() => {
        async function loadOptions() {
            try {
                setOptions(await getDewormingFormOptions());
            } catch (loadError) {
                console.error(loadError);
                setError('Não foi possível carregar as opções do formulário.');
            } finally {
                setOptionsLoading(false);
            }
        }
        void loadOptions();
    }, []);

    function handleAnimalChange(value: number | '') {
        setLiveAnimalId(value);
        setVeterinarianVisitId('');
    }

    function handleVeterinarianVisitChange(value: number | '') {
        setVeterinarianVisitId(value);
        const visit = options?.veterinarianVisits.find(option => option.id === value);
        if (visit) {
            setStartDate(toDateInputValue(visit.date));
        }
    }

    async function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
        event.preventDefault();
        setError(null);
        if (endDate && endDate < startDate) {
            setError('A data de fim deve ser igual ou posterior à data de início.');
            return;
        }
        if (veterinarianVisitId && !selectedVisit) {
            setError('Selecione uma visita veterinária do animal informado ou deixe o campo em branco.');
            return;
        }
        if (selectedVisit && startDate !== toDateInputValue(selectedVisit.date)) {
            setError('A data de início deve ser a mesma da visita veterinária associada.');
            return;
        }

        setLoading(true);
        try {
            const data = {
                liveAnimalId: Number(liveAnimalId),
                assigneeId: Number(assigneeId),
                veterinarianVisitId: Number(veterinarianVisitId) || undefined,
                medicationId: Number(medicationId),
                startDate,
                endDate: endDate || undefined,
                note: note || undefined
            };
            if (deworming) {
                await updateDeworming(deworming.id, data);
            } else {
                await createDeworming(data);
            }
            refresh();
            close();
        } catch (submitError: any) {
            setError(submitError.response?.data?.error || 'Erro ao salvar vermifugação.');
        } finally {
            setLoading(false);
        }
    }

    if (optionsLoading || !options) {
        return (
            <ModalPortal>
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="bg-white rounded-2xl shadow-xl p-10">
                        {optionsLoading ? 'Carregando opções...' : (
                            <>
                                <p className="text-red-500">{error}</p>
                                <button onClick={close} className="mt-4 text-standard-blue font-bold">Fechar</button>
                            </>
                        )}
                    </div>
                </div>
            </ModalPortal>
        );
    }

    return (
        <ModalPortal>
            <div
                onMouseDown={close}
                className="modal-overlay flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4"
            >
                <div
                    onMouseDown={event => event.stopPropagation()}
                    className="modal relative flex flex-col overflow-y-auto bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-220 max-h-[90vh]"
                >
                    <button
                        onClick={close}
                        className="absolute text-text-main hover:text-standard-red font-bold text-xl cursor-pointer leading-none top-3 right-3"
                        title="Fechar"
                    >
                        ✕
                    </button>
                    <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                        {isEditing ? 'Editando Vermifugação' : 'Nova Vermifugação'}
                    </h2>

                    <form onSubmit={handleSubmit} className="w-full flex flex-col overflow-y-auto gap-4 mt-2">
                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Código do Animal</label>
                                <select
                                    value={liveAnimalId}
                                    onChange={event => handleAnimalChange(event.target.value ? Number(event.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.liveAnimals.map(animal => (
                                        <option key={animal.id} value={animal.id}>{animal.code}</option>
                                    ))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Responsável</label>
                                <select
                                    value={assigneeId}
                                    onChange={event => setAssigneeId(event.target.value ? Number(event.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.assignees.map(assignee => (
                                        <option key={assignee.id} value={assignee.id}>{assignee.name}</option>
                                    ))}
                                </select>
                            </div>
                        </div>

                        <fieldset className={`relative border border-border rounded p-4 ${!liveAnimalId ? 'bg-gray-100' : 'bg-white'}`}>
                            <legend className="text-sm font-bold text-standard-blue px-2">
                                Visita Veterinária Associada (Opcional)
                            </legend>
                            {veterinarianVisitId !== '' && (
                                <div className="absolute top-[-24px] right-2 bg-white px-2 rounded">
                                    <button
                                        type="button"
                                        onClick={() => setVeterinarianVisitId('')}
                                        className="text-standard-blue font-bold text-xs cursor-pointer"
                                        title="Limpar seleção da visita"
                                    >
                                        ⭯ Limpar
                                    </button>
                                </div>
                            )}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Data da Visita</label>
                                <select
                                    value={veterinarianVisitId}
                                    onChange={event => handleVeterinarianVisitChange(event.target.value ? Number(event.target.value) : '')}
                                    className={`border border-border rounded p-2 ${!liveAnimalId ? 'bg-gray-100' : 'bg-white'}`}
                                    disabled={!liveAnimalId}
                                >
                                    <option value="">Sem visita associada</option>
                                    {visitsForAnimal.map(visit => (
                                        <option key={visit.id} value={visit.id}>
                                            {new Date(visit.date).toLocaleDateString('pt-BR', { timeZone: 'UTC' })}
                                        </option>
                                    ))}
                                </select>
                            </div>
                        </fieldset>

                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Medicamento Utilizado</label>
                            <select
                                value={medicationId}
                                onChange={event => setMedicationId(event.target.value ? Number(event.target.value) : '')}
                                className="border border-border rounded p-2 bg-white"
                                required
                            >
                                <option value="">Selecione...</option>
                                {options.medications.map(medication => (
                                    <option key={medication.id} value={medication.id}>{medication.name}</option>
                                ))}
                            </select>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Data de Início</label>
                                <input
                                    type="date"
                                    value={startDate}
                                    onChange={event => setStartDate(event.target.value)}
                                    className={`border border-border rounded p-2 ${selectedVisit ? 'bg-gray-100' : 'bg-white'}`}
                                    disabled={!!selectedVisit}
                                    required
                                />
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Data de Fim (Opcional)</label>
                                <input
                                    type="date"
                                    value={endDate}
                                    min={startDate || undefined}
                                    onChange={event => setEndDate(event.target.value)}
                                    className="border border-border rounded p-2 bg-white"
                                />
                            </div>
                        </div>

                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Observações (Opcional)</label>
                            <textarea
                                value={note}
                                onChange={event => setNote(event.target.value)}
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
                                onClick={close}
                                className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer"
                            >
                                Cancelar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </ModalPortal>
    );
}
