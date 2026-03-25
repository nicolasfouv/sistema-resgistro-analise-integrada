import { type GetAllVeterinarianSampleOutput } from "srf-shared-types";
import { ModalPortal } from "../../../components/modalPortal";

interface DeleteSampleModalProps {
    sample: GetAllVeterinarianSampleOutput;
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