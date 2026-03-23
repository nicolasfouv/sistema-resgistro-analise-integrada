import { type VeterinarianSampleData } from "../../../services/veterinarianSampleService";
import { ModalPortal } from "../../../components/modalPortal";

interface DeleteSampleModalProps {
    sample: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}
export function DeleteSampleModal({ sample, close, refresh }: DeleteSampleModalProps) {
    // ...
    return (
        <ModalPortal>
            <>
            </>
        </ModalPortal>
    )
}