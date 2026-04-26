import { useState } from "react";
import { type GetAllExamResultOutput } from "srf-shared-types";
import { ExamResultFormModal } from "./formExamResultModal";
import { DeleteExamResultModal } from "./deleteExamResultModal";

export function ExamResultExpansion({ item, close, refresh }: { item: GetAllExamResultOutput; close: () => void; refresh: () => void }) {
    const [showFormModal, setShowFormModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    return (
        <>
            {showFormModal && (
                <ExamResultFormModal examResult={item} close={() => setShowFormModal(false)} refresh={refresh} />
            )}
            {showDeleteModal && (
                <DeleteExamResultModal examResult={item} close={() => setShowDeleteModal(false)} refresh={refresh} />
            )}
            {/* CABEÇALHO */}
            <div className="sticky top-0 z-10 bg-form-bg pb-2">
                <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                    <h3 className="font-bold text-text-main uppercase">Detalhes do Resultado de Exame</h3>
                    <div className="flex gap-2 text-xs font-bold uppercase">
                        {item.canEdit && (<button onClick={() => setShowFormModal(true)} className="text-button-green uppercase cursor-pointer">Editar</button>)}
                        {item.canEdit && (<button onClick={() => setShowDeleteModal(true)} className="text-button-red uppercase cursor-pointer">Excluir</button>)}
                        <button onClick={close} className="text-standard-blue uppercase cursor-pointer">Recolher</button>
                    </div>
                </div>
                <div className="flex gap-2 w-full text-sm">
                    <div className="flex flex-col w-4/12">
                        <label className="ml-1 font-bold">Data da Visita</label>
                        <input type="text" disabled value={item.veterinarianVisitDateFormatted || ''} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-4/12">
                        <label className="ml-1 font-bold">Animal</label>
                        <input type="text" disabled value={item.liveAnimalName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-4/12">
                        <label className="ml-1 font-bold">Veterinário</label>
                        <input type="text" disabled value={item.veterinarianName} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>
            </div>
            <hr className="border-gray-200" />

            {/* CORPO DA EXPANSÃO */}
            {/* Hemograma */}
            <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                <h3 className="font-bold text-text-main uppercase">Hemograma</h3>
            </div>
            <div className="gap-2 w-full text-sm grid grid-cols-4">
                {[
                    ['Eritrócitos', item.erythrocytes], ['Hemoglobina', item.hemoglobin],
                    ['Hematócrito', item.hematocrit], ['VCM', item.vcm],
                    ['HCM', item.hcm], ['CHCM', item.chcm], ['Plaquetas', item.platelets]
                ].map(([label, value]) => (
                    <div key={String(label)} className="flex flex-col w-full">
                        <label className="ml-1 font-bold">{label}</label>
                        <input type="text" disabled value={String(value)} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                ))}
            </div>
            <div className="gap-2 w-full text-sm grid grid-cols-4">
                {[
                    ['Leucócitos', item.whiteBloodCells], ['Bastonetes', item.bandCells],
                    ['Segmentados', item.segmentedCells], ['Segmentados (%)', item.segmentedCellsPercentage],
                    ['Linfócitos', item.lymphocytes], ['Linfócitos (%)', item.lymphocytesPercentage],
                    ['Monócitos', item.monocytes], ['Monócitos (%)', item.monocytesPercentage],
                    ['Eosinófilos', item.eosinophils], ['Eosinófilos (%)', item.eosinophilsPercentage],
                    ['Basófilos', item.basophils], ['Basófilos (%)', item.basophilsPercentage]
                ].map(([label, value]) => (
                    <div key={String(label)} className="flex flex-col w-full">
                        <label className="ml-1 font-bold">{label}</label>
                        <input type="text" disabled value={String(value)} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                ))}
            </div>

            {/* Bioquímico */}
            <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                <h3 className="font-bold text-text-main uppercase">Bioquímico</h3>
            </div>
            <div className="gap-2 w-full text-sm grid grid-cols-4">
                {[
                    ['ALT', item.alt], ['Creatinina', item.creatinine],
                    ['Fosfatase Alcalina', item.alkalinePhosphatase],
                    ['Proteína Total', item.totalProtein], ['Ureia', item.urea]
                ].map(([label, value]) => (
                    <div key={String(label)} className="flex flex-col w-full">
                        <label className="ml-1 font-bold">{label}</label>
                        <input type="text" disabled value={String(value)} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                ))}
            </div>
        </>
    )
}
