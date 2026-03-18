import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { type VeterinarianVisitData } from "../../../services/veterinarianVisitService";
import { VeterinarianVisitFormModal } from "./formVisitModal";
import { DeleteVisitModal } from "./deleteVisitModal";

export function VisitExpansion({ item, close, refresh }: { item: VeterinarianVisitData; close: () => void; refresh: () => void }) {
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
                            <div key={bm.bodyMeasurementTypeId + bm.value} className="flex flex-col w-full">
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
                            onClick={() => navigate(`/animaisvivos/veterinario/amostras-av?column=veterinarianVisitId&filter=${encodeURIComponent(item.id)}`)}
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