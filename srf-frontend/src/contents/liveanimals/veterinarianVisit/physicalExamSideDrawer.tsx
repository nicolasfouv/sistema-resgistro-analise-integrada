import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { type GetAllPhysicalExamOutput } from "srf-shared-types";
import { getPhysicalExams } from "../../../services/physicalExamService";
import { SideDrawer } from "../../../components/sideDrawer";
import grayQuestionMark from '../../../assets/grayQuestionMark.svg';

interface PhysicalExamSideDrawerProps {
    veterinarianVisitId: number;
    veterinarianVisitDate: string;
    liveAnimalName: string;
    veterinarianName: string;
    onClose: () => void;
}

export function PhysicalExamSideDrawer({ veterinarianVisitId, veterinarianVisitDate, liveAnimalName, veterinarianName, onClose }: PhysicalExamSideDrawerProps) {
    const [exams, setExams] = useState<GetAllPhysicalExamOutput[]>([]);
    const [loading, setLoading] = useState(true);
    const navigate = useNavigate();

    useEffect(() => {
        setLoading(true);
        getPhysicalExams()
            .then(all => {
                const filtered = all
                    .map(e => ({
                        ...e,
                        veterinarianVisitDateFormatted: e.veterinarianVisitDate
                            ? new Date(e.veterinarianVisitDate).toLocaleDateString('pt-BR')
                            : '',
                    }))
                    .filter(e => e.veterinarianVisitId === veterinarianVisitId);
                setExams(filtered);
            })
            .finally(() => setLoading(false));
    }, [veterinarianVisitId]);

    const filters = [
        { field: 'veterinarianVisitDate', value: { type: 'date' as const, from: veterinarianVisitDate, to: veterinarianVisitDate } },
        { field: 'liveAnimalName', value: { type: 'text' as const, term: liveAnimalName } },
        { field: 'veterinarianName', value: { type: 'text' as const, term: veterinarianName } },
    ];
    const pageUrl = `/animaisvivos/veterinario/examefisico?filters=${encodeURIComponent(JSON.stringify(filters))}`;

    return (
        <SideDrawer
            title="Exame Físico da Visita"
            onClose={onClose}
            headerExtra={
                <button
                    onClick={() => navigate(pageUrl)}
                    className="text-standard-blue text-xs font-bold uppercase cursor-pointer hover:underline mr-2"
                    title="Abrir página completa de exames físicos"
                >
                    Abrir Página
                </button>
            }
        >
            {loading && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Carregando exame físico...
                </div>
            )}

            {!loading && exams.length === 0 && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Nenhum exame físico encontrado para esta visita.
                </div>
            )}

            {!loading && exams.length > 0 && (
                <div className="flex flex-col gap-3">
                    {exams.map(exam => (
                        <div
                            key={exam.id}
                            className="border border-border rounded bg-form-bg"
                        >
                            <div className="px-4 pb-4 bg-form-bg">
                                <h4 className="font-bold text-text-main text-xs uppercase my-2 border-b border-gray-600 pb-1">
                                    Detalhes do Exame Físico
                                </h4>
                                <div className="gap-2 w-full text-sm grid grid-cols-2 mt-3">
                                    <Field label="Data da Visita" value={exam.veterinarianVisitDateFormatted || ''} />
                                    <Field label="Animal" value={exam.liveAnimalName} />
                                    <Field label="Veterinário" value={exam.veterinarianName} />
                                    <Field label="Condição Geral" value={exam.generalConditionName} />
                                    <Field
                                        label="Frequência Respiratória (mpm)"
                                        value={exam.fr}
                                        tooltip="Frequência respiratória do animal em movimentos por minuto"
                                    />
                                    <Field
                                        label="Frequência Cardíaca (bpm)"
                                        value={String(exam.fc)}
                                        tooltip="Frequência cardíaca do animal em batimentos por minuto"
                                    />
                                    <Field
                                        label="Temperatura Retal (°C)"
                                        value={String(exam.tempRectal)}
                                        tooltip="Temperatura retal do animal em graus Celsius"
                                    />
                                    <Field
                                        label="Mucosa"
                                        value={exam.mucousName}
                                        tooltip="Coloração das mucosas do animal"
                                    />
                                    <Field
                                        label="TPC"
                                        value={String(exam.tpc)}
                                        tooltip="Tempo de preenchimento capilar do animal em segundos"
                                    />
                                    <Field
                                        label="Hidratação"
                                        value={exam.hydrationName}
                                        tooltip="Estado de hidratação do animal"
                                    />
                                    <Field
                                        label="Peso (kg)"
                                        value={String(exam.weight)}
                                        tooltip="Peso do animal em quilogramas"
                                    />
                                    <Field
                                        label="Score"
                                        value={String(exam.score)}
                                        tooltip="Escala de 1 a 9 para avaliação da condição corporal do animal"
                                    />
                                    <Field label="Coleta de Sangue" value={exam.bloodCollectionNote || 'Nenhuma observação informada'} fullWidth />
                                    <Field label="Exame Físico" value={exam.physicalExamNote || 'Nenhuma observação informada'} fullWidth />
                                    <Field label="Observações Gerais" value={exam.generalNote || 'Nenhuma observação informada'} fullWidth />
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </SideDrawer>
    );
}

function Field({ label, value, fullWidth, tooltip }: { label: string; value: string; fullWidth?: boolean; tooltip?: string }) {
    return (
        <div className={`flex flex-col ${fullWidth ? 'col-span-2' : ''}`}>
            <label className="ml-1 font-bold text-xs text-text-main">
                {label}
                {tooltip && (
                    <img src={grayQuestionMark}
                        title={tooltip}
                        alt={`Sobre o campo ${label}`}
                        className="inline-block size-4 ml-1"
                    />
                )}
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
