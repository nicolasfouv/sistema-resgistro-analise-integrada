import React, { useState, useEffect, useMemo } from "react";
import { ModalPortal } from "../../../components/modalPortal";
import {
    type GetAllEctoparasiteAnalysisOutput,
    type GetFormOptionsEctoparasiteAnalysisOutput,
} from "srf-shared-types";
import {
    getEctoparasiteAnalysisFormOptions,
    createEctoparasiteAnalysis,
    updateEctoparasiteAnalysis
} from "../../../services/liveanimals/ectoparasiteAnalysisService";

interface EctoparasiteAnalysisFormModalProps {
    ectoparasiteAnalysis?: GetAllEctoparasiteAnalysisOutput;
    close: () => void;
    refresh: () => void;
}

export function EctoparasiteAnalysisFormModal({ ectoparasiteAnalysis, close, refresh }: EctoparasiteAnalysisFormModalProps) {
    const isEditing = !!ectoparasiteAnalysis;

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [options, setOptions] = useState<GetFormOptionsEctoparasiteAnalysisOutput | null>(null);

    // Campos de seleção da visita
    const [selectedDate, setSelectedDate] = useState<string>('');
    const [selectedAnimalId, setSelectedAnimalId] = useState<number | ''>('');
    const [selectedAssigneeId, setSelectedAssigneeId] = useState<number | ''>(ectoparasiteAnalysis?.assigneeId ?? '');

    // Campos do ectoparasito
    const [ectoparasiteGenusId, setEctoparasiteGenusId] = useState<number | ''>(ectoparasiteAnalysis?.ectoparasiteGenusId ?? '');
    const [ectoparasiteSpecieId, setEctoparasiteSpecieId] = useState<number | ''>(ectoparasiteAnalysis?.ectoparasiteSpecieId ?? '');
    const [ectoparasiteSubSpecieId, setEctoparasiteSubSpecieId] = useState<number | ''>(ectoparasiteAnalysis?.ectoparasiteSubSpecieId ?? '');
    const [maleQuantity, setMaleQuantity] = useState<number | ''>(ectoparasiteAnalysis?.maleQuantity ?? '');
    const [femaleQuantity, setFemaleQuantity] = useState<number | ''>(ectoparasiteAnalysis?.femaleQuantity ?? '');
    const [nymphQuantity, setNymphQuantity] = useState<number | ''>(ectoparasiteAnalysis?.nymphQuantity ?? '');
    const [larvaeQuantity, setLarvaeQuantity] = useState<number | ''>(ectoparasiteAnalysis?.larvaeQuantity ?? '');
    const [eggQuantity, setEggQuantity] = useState<number | ''>(ectoparasiteAnalysis?.eggQuantity ?? '');
    const [note, setNote] = useState<string>(ectoparasiteAnalysis?.note ?? '');

    useEffect(() => {
        async function loadOptions() {
            try {
                const opts = await getEctoparasiteAnalysisFormOptions();
                setOptions(opts);
                if (ectoparasiteAnalysis) {
                    const matchingVisit = opts.veterinarianVisits.find(v => v.id === ectoparasiteAnalysis.veterinarianVisitId);
                    if (matchingVisit) {
                        setSelectedDate(matchingVisit.date);
                        setSelectedAnimalId(matchingVisit.liveAnimal.id);
                    }
                    setSelectedAssigneeId(ectoparasiteAnalysis.assigneeId);
                }
            } catch (error) {
                console.error(error);
            }
        }
        loadOptions();
    }, []);

    const filteredDates = useMemo(() => {
        if (!options) return [];
        let visits = options.veterinarianVisits;
        if (selectedAnimalId) visits = visits.filter(v => v.liveAnimal.id === selectedAnimalId);
        const dateSet = new Map<string, string>();
        visits.forEach(v => {
            if (!dateSet.has(v.date)) dateSet.set(v.date, new Date(v.date).toLocaleDateString('pt-BR'));
        });
        return Array.from(dateSet.entries()).map(([iso, formatted]) => ({ iso, formatted }));
    }, [options, selectedAnimalId]);

    const filteredAnimals = useMemo(() => {
        if (!options) return [];
        let visits = options.veterinarianVisits;
        if (selectedDate) visits = visits.filter(v => v.date === selectedDate);
        const map = new Map<number, string>();
        visits.forEach(v => { if (!map.has(v.liveAnimal.id)) map.set(v.liveAnimal.id, v.liveAnimal.code); });
        return Array.from(map.entries()).map(([id, code]) => ({ id, code }));
    }, [options, selectedDate]);

    const veterinarianVisitId = useMemo(() => {
        if (!options || !selectedDate || !selectedAnimalId) return null;
        const visit = options.veterinarianVisits.find(
            v => v.date === selectedDate && v.liveAnimal.id === selectedAnimalId
        );
        return visit?.id ?? null;
    }, [options, selectedDate, selectedAnimalId]);

    function handleDateChange(value: string) {
        setSelectedDate(value);
        if (value) {
            const mv = options?.veterinarianVisits.filter(v => v.date === value) || [];
            if (selectedAnimalId && !mv.some(v => v.liveAnimal.id === selectedAnimalId)) setSelectedAnimalId('');
        }
    }

    function handleAnimalChange(value: number | '') {
        setSelectedAnimalId(value);
        if (value) {
            const mv = options?.veterinarianVisits.filter(v => v.liveAnimal.id === value) || [];
            if (selectedDate && !mv.some(v => v.date === selectedDate)) setSelectedDate('');
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
                veterinarianVisitId: Number(veterinarianVisitId),
                assigneeId: Number(selectedAssigneeId),
                ectoparasiteGenusId: Number(ectoparasiteGenusId),
                ectoparasiteSpecieId: Number(ectoparasiteSpecieId),
                ectoparasiteSubSpecieId: Number(ectoparasiteSubSpecieId),
                maleQuantity: Number(maleQuantity),
                femaleQuantity: Number(femaleQuantity),
                nymphQuantity: Number(nymphQuantity),
                larvaeQuantity: Number(larvaeQuantity),
                eggQuantity: Number(eggQuantity),
                note: note || null
            };
            if (isEditing && ectoparasiteAnalysis) {
                await updateEctoparasiteAnalysis(ectoparasiteAnalysis.id, data);
            } else {
                await createEctoparasiteAnalysis(data);
            }
            refresh();
            close();
        } catch (error: any) {
            setError(error.response?.data?.error || 'Erro ao salvar.');
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
            <div onMouseDown={close} className="modal-overlay flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4">
                <div onMouseDown={(e) => e.stopPropagation()} className="modal relative flex flex-col overflow-y-auto bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-260 max-h-[90vh]">
                    <button onClick={() => close()} className="absolute text-text-main hover:text-standard-red font-bold text-xl cursor-pointer leading-none top-3 right-3" title="Fechar">✕</button>
                    <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                        {isEditing ? 'Editando Ectoparasitos' : 'Nova Análise de Ectoparasitos'}
                    </h2>

                    <form onSubmit={handleSubmit} className="w-full flex flex-col overflow-y-auto gap-4 mt-2 flex-1 min-h-0">
                        {/* Visita Associada */}
                        <fieldset className="border border-border rounded p-4">
                            <legend className="text-sm font-bold text-standard-blue px-2">Visita Associada</legend>
                            <div className="grid grid-cols-2 gap-4">
                                <div className="flex flex-col">
                                    <label className="text-sm font-bold mb-1 text-left">Código do Animal</label>
                                    <select value={selectedAnimalId} onChange={(e) => handleAnimalChange(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white" required>
                                        <option value="">Selecione...</option>
                                        {filteredAnimals.map(a => (<option key={a.id} value={a.id}>{a.code}</option>))}
                                    </select>
                                </div>
                                <div className="flex flex-col">
                                    <label className="text-sm font-bold mb-1 text-left">Data da Visita</label>
                                    <select value={selectedDate} onChange={(e) => handleDateChange(e.target.value)} className="border border-border rounded p-2 bg-white" required>
                                        <option value="">Selecione...</option>
                                        {filteredDates.map(d => (<option key={d.iso} value={d.iso}>{d.formatted}</option>))}
                                    </select>
                                </div>
                            </div>
                        </fieldset>

                        {/* Campos do Ectoparasito */}
                        <div className="grid grid-cols-3 gap-4">
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Responsável</label>
                                <select value={selectedAssigneeId} onChange={(e) => setSelectedAssigneeId(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white" required>
                                    <option value="">Selecione...</option>
                                    {options.assignees.map(assignee => (<option key={assignee.id} value={assignee.id}>{assignee.name}</option>))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Gênero</label>
                                <select value={ectoparasiteGenusId} onChange={(e) => setEctoparasiteGenusId(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white h-10" required>
                                    <option value="">Selecione...</option>
                                    {options.genuses.map(g => (<option key={g.id} value={g.id}>{g.name}</option>))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Espécie</label>
                                <select value={ectoparasiteSpecieId} onChange={(e) => setEctoparasiteSpecieId(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white h-10" required>
                                    <option value="">Selecione...</option>
                                    {options.species.map(s => (<option key={s.id} value={s.id}>{s.name}</option>))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Subespécie</label>
                                <select value={ectoparasiteSubSpecieId} onChange={(e) => setEctoparasiteSubSpecieId(e.target.value ? Number(e.target.value) : '')} className="border border-border rounded p-2 bg-white h-10" required>
                                    <option value="">Selecione...</option>
                                    {options.species.map(s => (<option key={s.id} value={s.id}>{s.name}</option>))}
                                </select>
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade de Machos</label>
                                <input type="number" step="1" min="0" value={maleQuantity} onChange={(e) => setMaleQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white h-10" placeholder="Ex: 0" required />
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade de Fêmeas</label>
                                <input type="number" step="1" min="0" value={femaleQuantity} onChange={(e) => setFemaleQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white h-10" placeholder="Ex: 0" required />
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade de Ninfas</label>
                                <input type="number" step="1" min="0" value={nymphQuantity} onChange={(e) => setNymphQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white h-10" placeholder="Ex: 0" required />
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade de Larvas</label>
                                <input type="number" step="1" min="0" value={larvaeQuantity} onChange={(e) => setLarvaeQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white h-10" placeholder="Ex: 0" required />
                            </div>
                            <div className="flex flex-col">
                                <label className="text-sm font-bold mb-1 text-left">Quantidade de Ovos</label>
                                <input type="number" step="1" min="0" value={eggQuantity} onChange={(e) => setEggQuantity(e.target.value ? Number(e.target.value) : '')}
                                    className="border border-border rounded p-2 bg-white h-10" placeholder="Ex: 0" required />
                            </div>
                            <div className="flex flex-col col-span-3">
                                <label className="text-sm font-bold mb-1 text-left">Observações (Opcional)</label>
                                <textarea
                                    value={note}
                                    onChange={(e) => setNote(e.target.value)}
                                    className="border border-border rounded p-2 bg-white resize-none"
                                    rows={3}
                                    placeholder="Digite as observações..."
                                />
                            </div>
                        </div>

                        {error && <p className="text-red-500 text-sm">{error}</p>}

                        <div className="flex justify-center items-center gap-5 mt-2">
                            <button type="submit" className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer" disabled={loading}>
                                {loading ? 'Salvando...' : 'Salvar'}
                            </button>
                            <button type="button" onClick={() => close()} className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer">
                                Cancelar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </ModalPortal>
    )
}
