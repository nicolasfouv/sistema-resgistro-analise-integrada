import { useState } from "react"

interface FilterBarProps<T> {
    columns: {
        key: T | string,
        label: string,
    }[],
    onFilter: (
        column: keyof T | string,
        term: string
    ) => void,
    initialColumn?: string,
    initialTerm?: string,
}

export function FilterBar<T>({ columns, onFilter, initialColumn, initialTerm }: FilterBarProps<T>) {
    const [selectedCol, setSelectedCol] = useState<string>(initialColumn || String(columns[0].key || ''));
    const [searchTerm, setSearchTerm] = useState(initialTerm || '');

    function handleApplyFilter(e: React.FormEvent) {
        e.preventDefault();
        onFilter(selectedCol, searchTerm);
    }

    return (
        <div className="gap-4 bg-form-bg p-4 mx-6 mb-6 rounded-md">
            <h3 className="font-bold text-text-main uppercase text-xs mb-2">Pesquisar</h3>
            <form onSubmit={handleApplyFilter} className="flex gap-4">
                <div className="w-1/4">
                    <select
                        value={selectedCol}
                        onChange={(e) => setSelectedCol(e.target.value)}
                        className="bg-white border border-border p-2 rounded w-full"
                    >
                        {columns.map((col) => (
                            <option key={String(col.key)} value={String(col.key)}>
                                {col.label}
                            </option>
                        ))}
                    </select>
                </div>

                <input
                    type='text'
                    placeholder='Termo para o filtro...'
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="bg-white border border-border p-2 rounded w-2/4" />
                <button type="submit" className="bg-standard-blue text-white font-bold cursor-pointer px-4 rounded w-1/4">Filtrar</button>
            </form>
        </div>
    )

}