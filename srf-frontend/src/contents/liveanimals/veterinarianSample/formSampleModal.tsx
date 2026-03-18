import { type VeterinarianSampleData } from "../../../services/veterinarianSampleService";
import { ModalPortal } from "../../../components/modalPortal";

interface VeterinarianSampleFormModalProps {
    sample?: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}

export function VeterinarianSampleFormModal({ sample, close, refresh }: VeterinarianSampleFormModalProps) {
    // ...
    return (
        <ModalPortal>
            <>
            </>
        </ModalPortal>
    )
}