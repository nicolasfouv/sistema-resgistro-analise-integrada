import { createPortal } from "react-dom";

interface ModalPortalProps {
    children: React.ReactNode;
}

export function ModalPortal({ children }: ModalPortalProps) {
    const modalRoot = document.getElementById('modal-root');

    if (!modalRoot) return null;

    return createPortal(children, modalRoot);
}