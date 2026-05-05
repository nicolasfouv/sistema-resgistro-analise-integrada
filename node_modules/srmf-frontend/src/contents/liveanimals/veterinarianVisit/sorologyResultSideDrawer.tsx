import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { type GetAllSorologyResultOutput } from "srf-shared-types";
import { getSorologyResults } from "../../../services/sorologyResultService";
import { SideDrawer } from "../../../components/sideDrawer";

interface SorologyResultSideDrawerProps {
    veterinarianVisitId: number;
    veterinarianVisitDate: string;
    liveAnimalName: string;
    veterinarianName: string;
    onClose: () => void;
}

export function SorologyResultSideDrawer({ veterinarianVisitId, veterinarianVisitDate, liveAnimalName, veterinarianName, onClose }: SorologyResultSideDrawerProps) {
    const [results, setResults] = useState<GetAllSorologyResultOutput[]>([]);
    const [loading, setLoading] = useState(true);
    const navigate = useNavigate();

    useEffect(() => {
        setLoading(true);
        getSorologyResults()
            .then(all => {
                const filtered = all
                    .map(e => ({
                        ...e,
                        veterinarianVisitDateFormatted: e.veterinarianVisitDate
                            ? new Date(e.veterinarianVisitDate).toLocaleDateString('pt-BR')
                            : '',
                    }))
                    .filter(e => e.veterinarianVisitId === veterinarianVisitId);
                setResults(filtered);
            })
            .finally(() => setLoading(false));
    }, [veterinarianVisitId]);

    const filters = [
        { field: 'veterinarianVisitDate', value: { type: 'date' as const, from: veterinarianVisitDate, to: veterinarianVisitDate } },
        { field: 'liveAnimalName', value: { type: 'text' as const, term: liveAnimalName } },
        { field: 'veterinarianName', value: { type: 'text' as const, term: veterinarianName } },
    ];
    const pageUrl = `/animaisvivos/exameseanalises/resultadosorologico?filters=${encodeURIComponent(JSON.stringify(filters))}`;

    return (
        <SideDrawer
            title="Sorologia da Visita"
            onClose={onClose}
            headerExtra={
                <button
                    onClick={() => navigate(pageUrl)}
                    className="text-standard-blue text-xs font-bold uppercase cursor-pointer hover:underline mr-2"
                    title="Abrir página completa de sorologia"
                >
                    Abrir Página
                </button>
            }
        >
            {loading && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Carregando sorologia...
                </div>
            )}

            {!loading && results.length === 0 && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Nenhuma sorologia encontrada para esta visita.
                </div>
            )}

            {!loading && results.length > 0 && (
                <div className="flex flex-col gap-3">
                    {results.map(result => (
                        <div
                            key={result.id}
                            className="border border-border rounded bg-form-bg"
                        >
                            <div className="px-4 pb-4 bg-form-bg">
                                <h4 className="font-bold text-text-main text-xs uppercase my-2 border-b border-gray-600 pb-1">
                                    Detalhes da Sorologia
                                </h4>
                                <div className="gap-2 w-full text-sm grid grid-cols-2 mt-3">
                                    <Field label="Data da Visita" value={result.veterinarianVisitDateFormatted || ''} />
                                    <Field label="Animal" value={result.liveAnimalName} />
                                    <Field label="Veterinário" value={result.veterinarianName} />
                                    <Field label="Teste" value={result.testName} />
                                    <Field label="Interpretação" value={result.interpretationName} />
                                    <Field label="Agente" value={result.agentName} />
                                    <Field label="Ponto de Corte" value={`${result.cuttingPointSymbol} ${result.cuttingPointValue}`} />
                                    <Field label="Tipo do Resultado" value={result.resultTypeName} />
                                    <Field label="Resultado" value={String(result.result)} />
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </SideDrawer>
    );
}

function Field({ label, value, fullWidth }: { label: string; value: string; fullWidth?: boolean }) {
    return (
        <div className={`flex flex-col ${fullWidth ? 'col-span-2' : ''}`}>
            <label className="ml-1 font-bold text-xs text-text-main flex items-center">
                {label}
            </label>
            <input
                type="text"
                disabled
                value={value}
                className="border border-border rounded px-2 py-1 text-text-input text-sm"
            />
        </div>
    );
}
