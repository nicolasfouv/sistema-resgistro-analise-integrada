import { useState } from "react";
import { VeterinarianSampleFormModal } from "./formSampleModal";

export function SampleToolBar({ refresh }: { refresh: () => void }) {
    const [showCreateModal, setShowCreateModal] = useState(false);

    return (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6 flex flex-col">
            <h3 className="font-bold text-text-main uppercase text-xs">Amostras</h3>
            <button
                onClick={() => setShowCreateModal(true)}
                className="bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded text-sm w-1/4"
            >
                Novo Registro
            </button>
            {showCreateModal && (
                <VeterinarianSampleFormModal
                    close={() => setShowCreateModal(false)}
                    refresh={refresh}
                />
            )}
        </div>
    );
}