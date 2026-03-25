import { useState, useEffect, useMemo } from "react";
import {
    type GetAllVeterinarianSampleOutput,
    type GetFormOptionsVeterinarianSampleOutput,
} from "srf-shared-types";
import { ModalPortal } from "../../../components/modalPortal";
import {
    getVeterinarianSampleFormOptions,
    createVeterinarianSample,
    updateVeterinarianSample
} from "../../../services/veterinarianSampleService";

interface VeterinarianSampleFormModalProps {
    sample?: GetAllVeterinarianSampleOutput;
    close: () => void;
    refresh: () => void;
}

export function VeterinarianSampleFormModal({ sample, close, refresh }: VeterinarianSampleFormModalProps) {
    const isEditing = !!sample;

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<GetFormOptionsVeterinarianSampleOutput | null>(null);

    // Campos de seleção da visita (dependentes entre si)
    const [selectedDate, setSelectedDate] = useState<string>('');
    const [selectedAnimalId, setSelectedAnimalId] = useState<number | ''>('');

    // Campos do formulário
    const [sampleTypeId, setSampleTypeId] = useState<number | ''>(sample?.sampleTypeId || '');
    const [statusId, setStatusId] = useState<number | ''>(sample?.statusId || '');
    const [storageId, setStorageId] = useState<number | ''>(sample?.storageId || '');
    const [quantity, setQuantity] = useState<number | ''>(sample?.quantity || '');
    const [note, setNote] = useState(sample?.note || '');

    useEffect(() => {
        async function loadOptions() {
            try {
                const opts = await getVeterinarianSampleFormOptions();
                setOptions(opts);

                // Pré-preencher seletores no modo edição
                if (sample) {
                    const matchingVisit = opts.veterinarianVisits.find(v => v.id === sample.veterinarianVisitId);
                    if (matchingVisit) {
                        setSelectedDate(matchingVisit.date);
                        setSelectedAnimalId(matchingVisit.liveAnimal.id);
                    }
                }
            } catch (error) {
                console.error(error);
            }
        }
        loadOptions();
    }, []);

    // Datas disponíveis - filtradas pelo animal se selecionado
    const filteredDates = useMemo(() => {
        if (!options) return [];
        const visits = selectedAnimalId
            ? options.veterinarianVisits.filter(v => v.liveAnimal.id === selectedAnimalId)
            : options.veterinarianVisits;

        const dateSet = new Map<string, string>();
        visits.forEach(v => {
            const dateKey = v.date;
            if (!dateSet.has(dateKey)) {
                dateSet.set(dateKey, new Date(dateKey).toLocaleDateString('pt-BR'));
            }
        });
        return Array.from(dateSet.entries()).map(([iso, formatted]) => ({ iso: iso, formatted: formatted }));
    }, [options, selectedAnimalId]);

    // Animais disponíveis - filtrados pela data se selecionada
    const filteredAnimals = useMemo(() => {
        if (!options) return [];
        const visits = selectedDate
            ? options.veterinarianVisits.filter(v => v.date === selectedDate)
            : options.veterinarianVisits;

        // Animais únicos
        const animalMap = new Map<number, string>();
        visits.forEach(v => {
            if (!animalMap.has(v.liveAnimal.id)) {
                animalMap.set(v.liveAnimal.id, v.liveAnimal.name);
            }
        });
        return Array.from(animalMap.entries()).map(([id, name]) => ({ id: id, name: name }));
    }, [options, selectedDate]);

    // Obter o id da visita veterinária
    const veterinarianVisitId = useMemo(() => {
        if (!options || !selectedDate || !selectedAnimalId) return null;
        const visit = options.veterinarianVisits.find(
            v => v.date === selectedDate && v.liveAnimal.id === selectedAnimalId
        );
        return visit?.id ?? null;
    }, [options, selectedDate, selectedAnimalId]);

    function handleDateChange(value: string) {
        setSelectedDate(value);
        // Se o animal atual não está disponível na nova data => limpar
        if (value && selectedAnimalId) {
            const stillValid = options?.veterinarianVisits.some(
                v => v.date === value && v.liveAnimal.id === selectedAnimalId
            );
            if (!stillValid) setSelectedAnimalId('');
        }
    }

    function handleAnimalChange(value: number | '') {
        setSelectedAnimalId(value);
        // Se a data atual não está disponível para o novo animal => limpar
        if (value && selectedDate) {
            const stillValid = options?.veterinarianVisits.some(
                v => v.liveAnimal.id === value && v.date === selectedDate
            );
            if (!stillValid) setSelectedDate('');
        }
    }

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        if (!veterinarianVisitId) {
            setError('Selecione uma data e um animal para determinar a visita.');
            return;
        }
        setLoading(true);
        setError(null);

        try {
            const data = {
                veterinarianVisitId,
                sampleTypeId: Number(sampleTypeId),
                storageId: Number(storageId),
                statusId: Number(statusId),
                quantity: Number(quantity),
                note: note || undefined,
            };

            if (isEditing) {
                await updateVeterinarianSample(sample!.id, data);
            } else {
                await createVeterinarianSample(data);
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
            <ModalPortal>
                <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100">
                    <div className="bg-white rounded-2xl shadow-xl p-10">Carregando opções...</div>
                </div>
            </ModalPortal>
        );
    }

    return (
        <ModalPortal>
            <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4">
                <div className="relative flex flex-col bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-200 max-h-[90vh]">
                    <button
                        onClick={() => close()}
                        className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                    >
                        ✕
                    </button>

                    <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                        {isEditing ? 'Editando Amostra Veterinária' : 'Nova Amostra Veterinária'}
                    </h2>

                    <form onSubmit={handleSubmit} className="w-full flex flex-col gap-4 mt-2 flex-1 min-h-0">
                        {/* Seleção da Visita Associada */}
                        <fieldset className="border border-border rounded p-4">
                            <legend className="text-sm font-bold text-standard-blue px-2">Visita Associada</legend>
                            <div className="grid grid-cols-2 gap-4">
                                {/* Data da Visita */}
                                <div className="flex flex-col">
                                    <label className="text-sm font-bold mb-1 text-left">Data da Visita</label>
                                    <select
                                        value={selectedDate}
                                        onChange={(e) => handleDateChange(e.target.value)}
                                        className="border border-border rounded p-2 bg-white"
                                        required
                                    >
                                        <option value="">Selecione...</option>
                                        {filteredDates.map(d => (
                                            <option key={d.iso} value={d.iso}>{d.formatted}</option>
                                        ))}
                                    </select>
                                </div>

                                {/* Animal */}
                                <div className="flex flex-col">
                                    <label className="text-sm font-bold mb-1 text-left">Animal</label>
                                    <select
                                        value={selectedAnimalId}
                                        onChange={(e) => handleAnimalChange(e.target.value ? Number(e.target.value) : '')}
                                        className="border border-border rounded p-2 bg-white"
                                        required
                                    >
                                        <option value="">Selecione...</option>
                                        {filteredAnimals.map(a => (
                                            <option key={a.id} value={a.id}>{a.name}</option>
                                        ))}
                                    </select>
                                </div>
                            </div>
                        </fieldset>

                        {/* Campos da Amostra */}
                        <div className="grid grid-cols-2 gap-4">
                            {/* Tipo da Amostra */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Tipo da Amostra</label>
                                <select
                                    value={sampleTypeId}
                                    onChange={(e) => setSampleTypeId(Number(e.target.value))}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.sampleTypes.map(t => (
                                        <option key={t.id} value={t.id}>{t.description}</option>
                                    ))}
                                </select>
                            </div>

                            {/* Status */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Status</label>
                                <select
                                    value={statusId}
                                    onChange={(e) => setStatusId(Number(e.target.value))}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.status.map(s => (
                                        <option key={s.id} value={s.id}>{s.name}</option>
                                    ))}
                                </select>
                            </div>

                            {/* Armazenamento */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Armazenamento</label>
                                <select
                                    value={storageId}
                                    onChange={(e) => setStorageId(Number(e.target.value))}
                                    className="border border-border rounded p-2 bg-white"
                                    required
                                >
                                    <option value="">Selecione...</option>
                                    {options.storages.map(s => (
                                        <option key={s.id} value={s.id}>{s.name}</option>
                                    ))}
                                </select>
                            </div>

                            {/* Quantidade */}
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade</label>
                                <input
                                    type="number"
                                    min={1}
                                    value={quantity}
                                    onChange={(e) => setQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2"
                                    placeholder="0"
                                    required
                                />
                            </div>
                        </div>

                        {/* Observações */}
                        <div className="flex flex-col">
                            <label className="text-sm font-bold mb-1 text-left">Observações (Opcional)</label>
                            <textarea
                                value={note}
                                onChange={(e) => setNote(e.target.value)}
                                className="border border-border rounded p-2 resize-none"
                                rows={3}
                                placeholder="Digite observações sobre a amostra..."
                            />
                        </div>

                        {/* Amostras enviadas */}
                        {/* ... */}

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