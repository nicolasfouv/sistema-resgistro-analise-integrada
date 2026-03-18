import { type VeterinarianSampleData } from "../../../services/veterinarianSampleService";

interface DeleteSampleModalProps {
    sample: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}
export function DeleteSampleModal({ sample, close, refresh }: DeleteSampleModalProps) {
    // ...
    return (
        <>
        </>
    )
}