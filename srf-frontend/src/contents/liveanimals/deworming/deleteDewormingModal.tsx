import { useState } from "react";
import { ModalPortal } from "../../../components/modalPortal";
import { type GetAllDewormingOutput } from "srf-shared-types";
import { deleteDeworming } from "../../../services/liveanimals/dewormingService";

interface DeleteDewormingModalProps {
    deworming: GetAllDewormingOutput;
    close: () => void;
    refresh: () => void;
}

export function DeleteDewormingModal({ deworming, close, refresh }: DeleteDewormingModalProps) {
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');

    async function handleDelete() {
        setLoading(true);
        setError('');
        try {
            await deleteDeworming(deworming.id);
            refresh();
            close();
        } catch (deleteError: any) {
            setError(deleteError.response?.data?.error || 'Erro ao excluir vermifugação.');
            setLoading(false);
        }
    }

    return (
        <ModalPortal>
            <div onMouseDown={close} className="modal-overlay flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 overflow-y-auto p-4">
                <div onMouseDown={event => event.stopPropagation()} className="modal relative flex flex-col bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-120">
                    <button onClick={close} className="absolute text-text-main hover:text-standard-red font-bold text-xl cursor-pointer leading-none top-3 right-3" title="Fechar">✕</button>
                    <h2 className="absolute top-2 text-2xl text-standard-red font-bold">Atenção!</h2>
                    <p className="text-center font-bold text-lg">
                        Tem certeza que deseja EXCLUIR a vermifugação do animal{' '}
                        <span className="text-standard-blue">{deworming.liveAnimalCode}</span> com o medicamento{' '}
                        <span className="text-standard-blue">{deworming.medicationName}</span>?
                    </p>
                    {error && <p className="text-red-500 text-sm text-center">{error}</p>}
                    <div className="flex justify-center items-center gap-5">
                        <button onClick={handleDelete} className="bg-standard-red text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer" disabled={loading}>
                            {loading ? 'Excluindo...' : 'Excluir'}
                        </button>
                        <button onClick={close} className="bg-standard-blue text-white text-xl font-bold py-2 px-5 rounded-xl cursor-pointer">
                            Cancelar
                        </button>
                    </div>
                </div>
            </div>
        </ModalPortal>
    );
}
