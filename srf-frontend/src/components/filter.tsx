import { useState } from "react"
import { ModalPortal } from "./modalPortal";
import blueFilterIcon from "../assets/blueFilter.svg";
import grayFilterIcon from "../assets/grayFilter.svg";

interface FilterBarProps<T> {
    fields: {
        key: T | string,
        label: string,
    }[],
    onFilter: (
        field: keyof T | string,
        term: string
    ) => void,
    initialField?: string,
    initialTerm?: string,
}

export function FilterBar<T>({ fields, onFilter, initialField, initialTerm }: FilterBarProps<T>) {
    const [selectedField, setSelectedField] = useState<string>(initialField || String(fields[0].key || ''));
    const [searchTerm, setSearchTerm] = useState(initialTerm || '');
    const [hasFilter, setHasFilter] = useState(false);
    const [isOpen, setIsOpen] = useState(false);

    function handleApplyFilter(e: React.FormEvent) {
        e.preventDefault();
        onFilter(selectedField, searchTerm);
        if (searchTerm !== '' && selectedField !== '') {
            setHasFilter(true);
        } else {
            setHasFilter(false);
        }
        setIsOpen(false);
    }

    function handleClose() {
        if (hasFilter) {
            setIsOpen(false);
        } else {
            setSearchTerm('');
            setSelectedField(String(fields[0].key || ''));
            setHasFilter(false);
            setIsOpen(false);
        }
    }

    return (
        <>
            <button onClick={() => setIsOpen(true)}
                className={`flex items-center justify-center bg-form-bg w-10 pt-0.5 rounded-t-xl cursor-pointer ${isOpen || hasFilter ? "h-8" : "h-6"}`}
                title="Filtrar"
            >
                <img src={hasFilter ? blueFilterIcon : grayFilterIcon} alt="Filtrar" className="w-5 h-5" />
            </button>
            {isOpen && (
                <ModalPortal>
                    <div className="flex justify-center items-center fixed top-0 left-0 w-full h-full bg-black/50 z-100 p-4">
                        <div className="relative flex flex-col bg-white justify-center items-center rounded-2xl shadow-xl px-10 pt-12 pb-6 gap-5 w-200 max-h-[90vh]">
                            <button
                                onClick={handleClose}
                                className="absolute cursor-pointer bg-standard-blue w-10 h-10 rounded-xl top-2 right-2 text-white text-xl font-bold flex items-center justify-center"
                            >
                                ✕
                            </button>
                            <h2 className="absolute top-2 text-2xl text-standard-blue font-bold">
                                Filtros
                            </h2>
                            <form onSubmit={handleApplyFilter} className="flex w-full gap-4">
                                <div className="w-1/5">
                                    <select
                                        value={selectedField}
                                        onChange={(e) => setSelectedField(e.target.value)}
                                        className="bg-white border border-border p-2 rounded w-full"
                                    >
                                        {fields.map((field) => (
                                            <option key={String(field.key)} value={String(field.key)}>
                                                {field.label}
                                            </option>
                                        ))}
                                    </select>
                                </div>

                                <input
                                    type='text'
                                    placeholder='Termo para o filtro...'
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                    className="w-3/5 bg-white border border-border p-2 rounded"
                                />

                                <button
                                    type="submit"
                                    className="w-1/5 bg-standard-blue text-white font-bold cursor-pointer px-4 py-2 rounded"
                                >
                                    Filtrar
                                </button>
                            </form>
                        </div>
                    </div>
                </ModalPortal>
            )}
        </>
    )

}