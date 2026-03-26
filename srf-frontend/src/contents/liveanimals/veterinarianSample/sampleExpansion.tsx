import { useState } from "react";
import { type GetAllVeterinarianSampleOutput } from "srf-shared-types";
import { VeterinarianSampleFormModal } from "./formSampleModal";
import { DeleteSampleModal } from "./deleteSampleModal";

export function SampleExpansion({ item, close, refresh }: { item: GetAllVeterinarianSampleOutput; close: () => void; refresh: () => void }) {
    const [showFormModal, setShowFormModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);

    return (
        <>
            {showFormModal && (
                <VeterinarianSampleFormModal
                    sample={item}
                    close={() => setShowFormModal(false)}
                    refresh={refresh}
                />
            )}
            {showDeleteModal && (
                <DeleteSampleModal
                    sample={item}
                    close={() => setShowDeleteModal(false)}
                    refresh={refresh}
                />
            )}
            {/* ==== Cabeçalho de Expansão ==== */}
            <div className="sticky top-0 z-10 bg-form-bg pb-2">
                <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                    <h3 className="font-bold text-text-main uppercase">Detalhes da Amostra</h3>
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
                        <label htmlFor="date" className="ml-1 font-bold">Data da Visita</label>
                        <input type="text" disabled value={item.veterinarianVisitDate} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Animal</label>
                        <input type="text" disabled value={item.liveAnimalName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Veterinário</label>
                        <input type="text" disabled value={item.veterinarianName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Tipo da Amostra</label>
                        <input type="text" disabled value={item.sampleTypeDescription} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/12">
                        <label className="ml-1 font-bold">Status</label>
                        <input type="text" disabled value={item.statusName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>
                <hr className="border-gray-200" />

                {/* ==== Corpo da Expansão ==== */}
                <div className="gap-2 w-full text-sm grid grid-cols-3 mb-1">
                    <div className="flex flex-col w-full">
                        <label className="ml-1 font-bold">Armazenamento</label>
                        <input type="text" disabled value={item.storageName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-full">
                        <label className="ml-1 font-bold">Quantidade</label>
                        <input type="text" disabled value={item.quantity} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-full">
                        <label className="ml-1 font-bold">Link da Imagem</label>
                        <input type="text" disabled value={item.imageLink || 'Nenhum link informado'} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-full col-span-3">
                        <label htmlFor="email" className="ml-1 font-bold">Observações</label>
                        <input type="text" disabled value={item.note || 'Nenhuma observação informada'} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>

            </div>
        </>
    );
}