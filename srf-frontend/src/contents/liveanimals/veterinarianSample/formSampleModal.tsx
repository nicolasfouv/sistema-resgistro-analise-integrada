import { type VeterinarianSampleData } from "../../../services/veterinarianSampleService";

interface VeterinarianSampleFormModalProps {
    sample?: VeterinarianSampleData;
    close: () => void;
    refresh: () => void;
}

export function VeterinarianSampleFormModal({ sample, close, refresh }: VeterinarianSampleFormModalProps) {
    // ...
    return (
        <>
        </>
    )
}