import { useState } from "react";
import { type GetAllDewormingOutput } from "srf-shared-types";
import { DewormingFormModal } from "./formDewormingModal";
import { DeleteDewormingModal } from "./deleteDewormingModal";
import { LiveAnimalSideDrawer } from "../liveAnimal/liveAnimalSideDrawer";
import { VeterinarianVisitSideDrawer } from "../veterinarianVisit/veterinarianVisitSideDrawer";

function formatDate(date?: string) {
    return date ? new Date(date).toLocaleDateString('pt-BR', { timeZone: 'UTC' }) : 'Não informada';
}

export function DewormingExpansion({
    item,
    close,
    refresh
}: {
    item: GetAllDewormingOutput;
    close: () => void;
    refresh: () => void;
}) {
    const [showFormModal, setShowFormModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [showLiveAnimalDrawer, setShowLiveAnimalDrawer] = useState(false);
    const [showVeterinarianVisitDrawer, setShowVeterinarianVisitDrawer] = useState(false);

    return (
        <>
            {showFormModal && (
                <DewormingFormModal deworming={item} close={() => setShowFormModal(false)} refresh={refresh} />
            )}
            {showDeleteModal && (
                <DeleteDewormingModal deworming={item} close={() => setShowDeleteModal(false)} refresh={refresh} />
            )}
            {showLiveAnimalDrawer && (
                <LiveAnimalSideDrawer filters={{ liveAnimalId: item.liveAnimalId }} onClose={() => setShowLiveAnimalDrawer(false)} />
            )}
            {showVeterinarianVisitDrawer && item.veterinarianVisitId && (
                <VeterinarianVisitSideDrawer
                    filters={{ veterinarianVisitId: item.veterinarianVisitId }}
                    onClose={() => setShowVeterinarianVisitDrawer(false)}
                />
            )}

            <div className="sticky top-0 z-10 bg-form-bg pb-2">
                <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                    <h3 className="font-bold text-text-main uppercase">Detalhes da Vermifugação</h3>
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
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Código do Animal</label>
                        <input disabled value={item.liveAnimalCode} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-3/12">
                        <label className="ml-1 font-bold">Responsável</label>
                        <input disabled value={item.assigneeName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Medicamento Utilizado</label>
                        <input disabled value={item.medicationName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Data de Início</label>
                        <input disabled value={formatDate(item.startDate)} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Data de Fim</label>
                        <input disabled value={formatDate(item.endDate)} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>

                <div className="grid grid-cols-1 gap-2 w-full text-sm">
                    <div className="flex flex-col">
                        <label className="ml-1 font-bold">Observações</label>
                        <textarea
                            rows={3}
                            disabled
                            value={item.note || 'Nenhuma observação informada'}
                            className="mb-2 border border-border rounded px-2 py-1 text-text-input resize-none"
                        />
                    </div>
                </div>
            </div>
            <hr className="border-gray-200" />
            <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                <h3 className="font-bold text-text-main uppercase">Registros Associados</h3>
            </div>
            <button
                onClick={() => setShowLiveAnimalDrawer(true)}
                className="bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm"
            >
                Animal
            </button>
            {item.veterinarianVisitId && (
                <button
                    onClick={() => setShowVeterinarianVisitDrawer(true)}
                    className="ml-2 bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm"
                >
                    Visita Veterinária
                </button>
            )}
        </>
    );
}
