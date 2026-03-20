import { useState } from "react"
import { ModalPortal } from "./modalPortal";
import blueFilterIcon from "../assets/blueFilter.svg";
import grayFilterIcon from "../assets/grayFilter.svg";
import type { FilterFieldProps } from "./content";

export type FilterValue =
    | { type: 'text'; term: string }
    | { type: 'date'; from: string; to: string }
    | { type: 'boolean'; value: string }
    | { type: 'enum'; value: string };

interface FilterBarProps<T> {
    fields: FilterFieldProps<T>[],
    onFilter: (
        field: string,
        value: FilterValue,
    ) => void,
    initialField?: string,
    initialTerm?: string,
}

export function FilterBar<T>({ fields, onFilter, initialField, initialTerm }: FilterBarProps<T>) {
    const [selectedField, setSelectedField] = useState<string>(initialField || String(fields[0]?.key || ''));
    const [searchTerm, setSearchTerm] = useState(initialTerm || '');
    const [dateFrom, setDateFrom] = useState('');
    const [dateTo, setDateTo] = useState('');
    const [selectedOption, setSelectedOption] = useState('');
    const [hasFilter, setHasFilter] = useState(false);
    const [isOpen, setIsOpen] = useState(false);

    const currentField = fields.find(f => String(f.key) === selectedField);
    const currentType = currentField?.type ?? 'text';

    function resetInputs() {
        setSearchTerm('');
        setDateFrom('');
        setDateTo('');
        setSelectedOption('');
    }

    function handleFieldChange(newField: string) {
        setSelectedField(newField);
        resetInputs();
    }

    function hasValue(): boolean {
        switch (currentType) {
            case 'text': return searchTerm !== '';
            case 'date': return dateFrom !== '' || dateTo !== '';
            case 'boolean': return selectedOption !== '';
            case 'enum': return selectedOption !== '';
            default: return false;
        }
    }

    function buildFilterValue(): FilterValue {
        switch (currentType) {
            case 'text': return { type: 'text', term: searchTerm };
            case 'date': return { type: 'date', from: dateFrom, to: dateTo };
            case 'boolean': return { type: 'boolean', value: selectedOption };
            case 'enum': return { type: 'enum', value: selectedOption };
            default: return { type: 'text', term: searchTerm };
        }
    }

    function handleApplyFilter(e: React.FormEvent) {
        e.preventDefault();
        const filterVal = buildFilterValue();
        onFilter(selectedField, filterVal);
        if (hasValue()) {
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
            resetInputs();
            setSelectedField(String(fields[0]?.key || ''));
            setHasFilter(false);
            setIsOpen(false);
        }
    }

    function renderInput() {
        switch (currentType) {
            case 'text':
                return (
                    <input
                        type='text'
                        placeholder='Termo para o filtro...'
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        className="w-3/5 bg-white border border-border p-2 rounded"
                    />
                );
            case 'date':
                return (
                    <div className="w-3/5 flex items-center gap-2">
                        <label className="text-sm text-text-main font-bold whitespace-nowrap">De</label>
                        <input
                            type='date'
                            value={dateFrom}
                            onChange={(e) => setDateFrom(e.target.value)}
                            className="flex-1 bg-white border border-border p-2 rounded"
                        />
                        <label className="text-sm text-text-main font-bold whitespace-nowrap">Até</label>
                        <input
                            type='date'
                            value={dateTo}
                            onChange={(e) => setDateTo(e.target.value)}
                            className="flex-1 bg-white border border-border p-2 rounded"
                        />
                    </div>
                );
            case 'boolean': {
                const boolField = currentField as Extract<FilterFieldProps<T>, { type: 'boolean' }>;
                return (
                    <select
                        value={selectedOption}
                        onChange={(e) => setSelectedOption(e.target.value)}
                        className="w-3/5 bg-white border border-border p-2 rounded"
                    >
                        <option value="">Selecione...</option>
                        <option value="true">{boolField.trueLabel}</option>
                        <option value="false">{boolField.falseLabel}</option>
                    </select>
                );
            }
            case 'enum': {
                const enumField = currentField as Extract<FilterFieldProps<T>, { type: 'enum' }>;
                return (
                    <select
                        value={selectedOption}
                        onChange={(e) => setSelectedOption(e.target.value)}
                        className="w-3/5 bg-white border border-border p-2 rounded"
                    >
                        <option value="">Selecione...</option>
                        {enumField.options.map(opt => (
                            <option key={opt.value} value={opt.value}>{opt.label}</option>
                        ))}
                    </select>
                );
            }
            default:
                return null;
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
                                        onChange={(e) => handleFieldChange(e.target.value)}
                                        className="bg-white border border-border p-2 rounded w-full"
                                    >
                                        {fields.map((field) => (
                                            <option key={String(field.key)} value={String(field.key)}>
                                                {field.label}
                                            </option>
                                        ))}
                                    </select>
                                </div>

                                {renderInput()}

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