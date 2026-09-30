import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { type GetAllTutorOutput } from "srf-shared-types";
import { getTutors } from "../../../services/liveanimals/tutorService";
import { SideDrawer } from "../../../components/sideDrawer";

interface TutorSideDrawerFilters {
    tutorId?: number;
}

interface TutorSideDrawerProps {
    filters: TutorSideDrawerFilters;
    onClose: () => void;
}

export function TutorSideDrawer({ filters, onClose }: TutorSideDrawerProps) {
    const [tutors, setTutors] = useState<GetAllTutorOutput[]>([]);
    const [loading, setLoading] = useState(true);
    const [expandedId, setExpandedId] = useState<number | null>(null);
    const navigate = useNavigate();

    useEffect(() => {
        setLoading(true);
        getTutors()
            .then(all => {
                const filtered = all
                    .map(tutor => ({
                        ...tutor,
                        birthDateFormatted: tutor.birthDate
                            ? new Date(tutor.birthDate).toLocaleDateString('pt-BR')
                            : '',
                    }))
                    .filter(t => {
                        if (filters.tutorId && t.id !== filters.tutorId) return false;
                        return true;
                    });
                setTutors(filtered);
            })
            .finally(() => setLoading(false));
    }, [filters.tutorId]);

    const pageFilters: any[] = [];
    if (filters.tutorId) {
        const first = tutors[0];
        if (first) {
            pageFilters.push({ field: 'name', value: { type: 'text' as const, term: first.name } });
        }
    }
    const pageUrl = `/animaisvivos/entrevistas/tutor?filters=${encodeURIComponent(JSON.stringify(pageFilters))}`;

    return (
        <SideDrawer
            title="Tutor"
            onClose={onClose}
            headerExtra={
                <button
                    onClick={() => navigate(pageUrl)}
                    className="text-standard-blue text-xs font-bold uppercase cursor-pointer hover:underline mr-2"
                    title="Abrir página completa de tutores"
                >
                    Abrir Página
                </button>
            }
        >
            {loading && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Carregando tutor...
                </div>
            )}

            {!loading && tutors.length === 0 && (
                <div className="flex items-center justify-center py-12 text-text-light-gray text-sm">
                    Nenhum tutor encontrado.
                </div>
            )}

            {!loading && tutors.length > 0 && (
                <div className="flex flex-col gap-3">
                    {tutors.map(tutor => {
                        const isExpanded = expandedId === tutor.id;
                        return (
                            <div
                                key={tutor.id}
                                className="border border-border rounded bg-white"
                            >
                                {/* Cabeçalho do Registro */}
                                <button
                                    onClick={() => setExpandedId(isExpanded ? null : tutor.id)}
                                    className="w-full flex items-center justify-between px-4 py-3 cursor-pointer hover:bg-hover-bg transition-colors"
                                >
                                    <div className="flex flex-col items-start gap-0.5">
                                        <span className="text-sm font-bold text-text-main">{tutor.name}</span>
                                        <span className="text-xs text-text-light-gray">
                                            {tutor.birthDateFormatted || ''} · {tutor.genderName}
                                        </span>
                                    </div>
                                    <span className="text-standard-blue text-xs font-bold uppercase">
                                        {isExpanded ? 'Recolher' : 'Expandir'}
                                    </span>
                                </button>

                                {/* Detalhes Expandidos */}
                                {isExpanded && (
                                    <div className="px-4 pb-4 border-t border-border bg-form-bg">
                                        <h4 className="font-bold text-text-main text-xs uppercase my-2 border-b border-gray-600 pb-1">
                                            Detalhes do Tutor
                                        </h4>
                                        <div className="gap-2 w-full text-sm grid grid-cols-2 mt-3">
                                            <Field label="Nome" value={tutor.name} />
                                            <Field label="Data de Nascimento" value={tutor.birthDateFormatted || ''} />
                                            <Field label="Gênero" value={tutor.genderName} />
                                            <Field label="Endereço" value={tutor.address || 'Não informado'} fullWidth />
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
