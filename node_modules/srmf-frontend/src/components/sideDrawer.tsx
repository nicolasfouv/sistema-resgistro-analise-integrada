import { ModalPortal } from "./modalPortal";

interface SideDrawerProps {
    title: string;
    onClose: () => void;
    children: React.ReactNode;
    headerExtra?: React.ReactNode;
}

export function SideDrawer({ title, onClose, children, headerExtra }: SideDrawerProps) {
    return (
        <ModalPortal>
            {/* Overlay */}
            <div
                className="drawer-overlay fixed inset-0 z-100 bg-black/40"
                onClick={onClose}
            />
            {/* Painel */}
            <div className="drawer-panel fixed top-0 right-0 z-101 h-full w-[600px] max-w-[90vw] bg-white shadow-xl flex flex-col">
                {/* Cabeçalho */}
                <div className="flex items-center justify-between px-6 py-4 border-b border-border bg-form-bg">
                    <h2 className="font-bold text-text-main text-lg uppercase">{title}</h2>
                    <div className="flex items-center gap-3">
                        {headerExtra}
                        <button
                            onClick={onClose}
                            className="text-text-main hover:text-standard-red font-bold text-xl cursor-pointer leading-none"
                            title="Fechar"
                        >
                            ✕
                        </button>
                    </div>
                </div>
                {/* Corpo */}
                <div className="flex-1 overflow-y-auto p-6">
                    {children}
                </div>
            </div>
        </ModalPortal>
    );
}
