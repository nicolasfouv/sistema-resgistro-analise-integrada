import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { type GetAllDewormingOutput } from "srf-shared-types";
import { getDewormings } from "../../../services/liveanimals/dewormingService";
import { SideDrawer } from "../../../components/sideDrawer";

interface DewormingSideDrawerFilters {
    veterinarianVisitId?: number;
    liveAnimalId?: number;
}

interface DewormingSideDrawerProps {
    filters: DewormingSideDrawerFilters;
    onClose: () => void;
}

function formatDate(date?: string) {
    return date ? new Date(date).toLocaleDateString('pt-BR', { timeZone: 'UTC' }) : 'Não informada';
}

export function DewormingSideDrawer({ filters, onClose }: DewormingSideDrawerProps) {
    const [dewormings, setDewormings] = useState<GetAllDewormingOutput[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [expandedId, setExpandedId] = useState<number | null>(null);
    const navigate = useNavigate();

    useEffect(() => {
        let isCurrent = true;
        setLoading(true);
        setError(null);
        getDewormings()
            .then(all => {
                if (!isCurrent) return;
                const filtered = all.filter(record => {
                    if (filters.veterinarianVisitId && record.veterinarianVisitId !== filters.veterinarianVisitId) return false;
                    if (filters.liveAnimalId && record.liveAnimalId !== filters.liveAnimalId) return false;
                    return true;
                });
                setDewormings(filtered);
            })
            .catch(loadError => {
                console.error(loadError);
                if (isCurrent) setError('Não foi possível carregar as vermifugações.');
            })
            .finally(() => {
                if (isCurrent) setLoading(false);
            });
        return () => {
            isCurrent = false;
        };
    }, [filters.veterinarianVisitId, filters.liveAnimalId]);

    const pageFilters: { field: string; value: { type: 'text' | 'date'; term?: string; from?: string; to?: string } }[] = [];
    const first = dewormings[0];
    if (filters.liveAnimalId && first) {
        pageFilters.push({ field: 'liveAnimalCode', value: { type: 'text', term: first.liveAnimalCode } });
    }
    if (filters.veterinarianVisitId && first) {
        const visitDate = first.veterinarianVisitDate?.slice(0, 10);
        if (visitDate) {
            pageFilters.push({ field: 'startDate', value: { type: 'date', from: visitDate, to: visitDate } });
        }
        pageFilters.push({ field: 'liveAnimalCode', value: { type: 'text', term: first.liveAnimalCode } });
    }
    const pageUrl = `/animaisvivos/animais/vermifugacao?filters=${encodeURIComponent(JSON.stringify(pageFilters))}`;

    return (
        <SideDrawer
            title="Vermifugações"
            onClose={onClose}
            headerExtra={
                <button
                    onClick={() => navigate(pageUrl)}
                    className="text-standard-blue text-xs font-bold uppercase cursor-pointer hover:underline mr-2"
                    title="Abrir página completa de vermifugações"
                >
                    Abrir Página
                </button>
            }
        >
            {loading && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Carregando vermifugações...
                </div>
            )}

            {!loading && error && (
                <div className="flex items-center justify-center py-12 text-red-500 text-sm">
                    {error}
                </div>
            )}

            {!loading && !error && dewormings.length === 0 && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Nenhuma vermifugação encontrada.
                </div>
            )}

            {!loading && !error && dewormings.length > 0 && (
                <div className="flex flex-col gap-3">
                    {dewormings.map(record => {
                        const isExpanded = expandedId === record.id;
                        return (
                            <div key={record.id} className="border border-border rounded bg-white">
                                <button
                                    onClick={() => setExpandedId(isExpanded ? null : record.id)}
                                    className="w-full flex items-center justify-between px-4 py-3 cursor-pointer hover:bg-hover-bg transition-colors"
                                >
                                    <div className="flex flex-col items-start gap-0.5">
                                        <span className="text-sm font-bold text-text-main">{record.liveAnimalCode}</span>
                                        <span className="text-xs text-text-light-gray">
                                            Início: {formatDate(record.startDate)} · Fim: {formatDate(record.endDate)}
                                        </span>
                                    </div>
                                    <span className="text-standard-blue text-xs font-bold uppercase">
                                        {isExpanded ? 'Recolher' : 'Expandir'}
                                    </span>
                                </button>

                                {isExpanded && (
                                    <div className="px-4 pb-4 border-t border-border bg-form-bg">
                                        <h4 className="font-bold text-text-main text-xs uppercase my-2 border-b border-gray-600 pb-1">
                                            Detalhes da Vermifugação
                                        </h4>
                                        <div className="gap-2 w-full text-sm grid grid-cols-2 mt-3">
                                            <Field label="Código do Animal" value={record.liveAnimalCode} />
                                            <Field label="Responsável" value={record.assigneeName} />
                                            <Field label="Medicamento Utilizado" value={record.medicationName} />
                                            <Field label="Data de Início" value={formatDate(record.startDate)} />
                                            <Field label="Data de Fim" value={formatDate(record.endDate)} />
                                            <Field label="Observações" value={record.note || 'Nenhuma observação informada'} fullWidth />
                                        </div>
                                    </div>
                                )}
                            </div>
                        );
                    })}
                </div>
            )}
        </SideDrawer>
    );
}

function Field({ label, value, fullWidth }: { label: string; value: string; fullWidth?: boolean }) {
    return (
        <div className={`flex flex-col ${fullWidth ? 'col-span-2' : ''}`}>
            <label className="ml-1 font-bold text-xs text-text-main">{label}</label>
            <input
                type="text"
                disabled
                value={value}
                className="border border-border rounded px-2 py-1 text-text-input text-sm"
            />
        </div>
    );
}
