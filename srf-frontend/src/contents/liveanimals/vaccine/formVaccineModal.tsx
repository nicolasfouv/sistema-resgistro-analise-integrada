import { useState, useEffect, useMemo } from "react";
import { ModalPortal } from "../../../components/modalPortal";
import {
    type GetAllVaccineOutput,
    type GetFormOptionsVaccineOutput
} from "srf-shared-types";
import {
    getVaccineFormOptions,
    createVaccine,
    updateVaccine
} from "../../../services/liveanimals/vaccineService";

interface VaccineFormModalProps {
    vaccine?: GetAllVaccineOutput;
    close: () => void;
    refresh: () => void;
}

export function VaccineFormModal({ vaccine, close, refresh }: VaccineFormModalProps) {
    const isEditing = !!vaccine;

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<GetFormOptionsVaccineOutput | null>(null);

    // Campo principal: Animal (obrigatório)
    const [selectedAnimalId, setSelectedAnimalId] = useState<number | ''>(vaccine?.liveAnimalId || '');

    // Campos de seleção da visita associada (opcional)
    const [selectedDate, setSelectedDate] = useState<string>('');
    const [selectedAssigneeId, setSelectedAssigneeId] = useState<number | ''>(vaccine?.assigneeId ?? '');

    // Campos do formulário
    const [vaccineId, setVaccineId] = useState<number | ''>(vaccine?.vaccineId || '');
    const [vaccineTypeId, setVaccineTypeId] = useState<number | ''>(vaccine?.vaccineTypeId || '');
    const [applicationDate, setApplicationDate] = useState(vaccine?.applicationDate ? new Date(vaccine.applicationDate).toISOString().slice(0, 10) : '');

    useEffect(() => {
        async function loadOptions() {
            try {
                const opts = await getVaccineFormOptions();
                setOptions(opts);

                // Pré-preencher seletores no modo edição
                if (vaccine) {
                    // Animal sempre é preenchido independente da visita
                    setSelectedAnimalId(vaccine.liveAnimalId);

                    // Visita associada só é preenchida se existir
                    if (vaccine.veterinarianVisitId) {
                        const matchingVisit = opts.veterinarianVisits.find(v => v.id === vaccine.veterinarianVisitId);
                        if (matchingVisit) {
                            setSelectedDate(matchingVisit.date);
                        }
                    }
                    setSelectedAssigneeId(vaccine.assigneeId);
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

    // Verifica se algum campo de visita foi selecionado
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
        // Ao trocar de animal, limpar seleção de visita associada pois as visitas são de outro animal
        setSelectedDate('');
    }

    function handleDateChange(value: string) {
        setSelectedDate(value);
        setApplicationDate(new Date(value).toISOString().slice(0, 10));
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

        // Quando há visita associada, a data de aplicação é a data da visita
        const finalApplicationDate = veterinarianVisitId ? visitDateFormatted : applicationDate;

        if (!finalApplicationDate) {
            setError('Informe a data de aplicação.');
            setLoading(false);
            return;
        }

        try {
            const data = {
                vaccineId: Number(vaccineId),
                liveAnimalId: Number(selectedAnimalId),
                vaccineTypeId: Number(vaccineTypeId),
                applicationDate: finalApplicationDate,
                veterinarianVisitId: Number(veterinarianVisitId) || undefined,
                assigneeId: Number(selectedAssigneeId)
            }
            if (isEditing && vaccine) {
                await updateVaccine(vaccine!.id, data);
            } else {
                await createVaccine(data);
            }
            refresh();
            close();
        } catch (error: any) {
            setError(error.response?.data?.error || "Erro ao salvar vacina.");
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
                        {isEditing ? 'Editando Vacina' : 'Nova Vacina'}
                    </h2>

                    <form onSubmit={handleSubmit} className="w-full flex flex-col overflow-y-auto gap-4 mt-2 flex-1 min-h-0">
                        {/* Animal (obrigatório) */}
                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Animal</label>
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
                                <select value={selectedAssigneeId} onChange={(e) => setSelectedAssigneeId(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white" required>
                                    <option value="">Selecione...</option>
                                    {options.assignees.map(assignee => (<option key={assignee.id} value={assignee.id}>{assignee.name}</option>))}
                                </select>
                            </div>
                        </div>

                        {/* Seleção da Visita Associada (opcional) */}
                        <fieldset className={`border border-border rounded p-4 ${!selectedAnimalId ? 'bg-gray-100' : 'bg-white'}`}>
                            <legend className="text-sm font-bold text-standard-blue px-2">Visita Associada (Opcional)</legend>
                            <div className="grid grid-cols-2 gap-4">
                                {/* Data da Visita */}
                                <div className="flex flex-col col-span-2">
                                    <label className="text-sm font-bold mb-1 text-left">Data da Visita</label>
                                    <select
                                        value={selectedDate}
                                        onChange={(e) => handleDateChange(e.target.value)}
                                        className={`border border-border rounded p-2 ${!selectedAnimalId ? 'bg-gray-100' : 'bg-white'}`}
                                        disabled={!selectedAnimalId}
                                    >
                                        <option value="">Selecione...</option>
                                        {filteredDates.map(d => (
                                            <option key={d.iso} value={d.iso}>{d.formatted}</option>
                                        ))}
                                    </select>
                                </div>

                            </div>
                        </fieldset>

                        {/* Campos da Vacina */}
                        <div className="grid grid-cols-2 gap-4">
                            <div className="flex flex-col col-span-2">
                                <label className="text-sm font-bold mb-1 text-left">Data da Aplicação</label>
                                <input
                                    type="date"
                                    value={applicationDate}
                                    onChange={(e) => setApplicationDate(e.target.value)}
                                    className={`border border-border rounded p-2 ${hasVisitSelected ? 'bg-gray-100' : 'bg-white'
                                        }`}
                                    required={!hasVisitSelected}
                                    disabled={hasVisitSelected}
                                />
                            </div>
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            {/* Vacina */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Vacina</label>
                                <select
                                    value={vaccineId}
                                    onChange={(e) => setVaccineId(Number(e.target.value))}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.vaccines.map(v => (
                                        <option key={v.id} value={v.id}>{v.name}</option>
                                    ))}
                                </select>
                            </div>

                            {/* Tipo de aplicação da Vacina */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Tipo de aplicação da Vacina</label>
                                <select
                                    value={vaccineTypeId}
                                    onChange={(e) => setVaccineTypeId(Number(e.target.value))}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.vaccineTypes.map(t => (
                                        <option key={t.id} value={t.id}>{t.name}</option>
                                    ))}
                                </select>
                            </div>
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
        </ModalPortal>
    )
}