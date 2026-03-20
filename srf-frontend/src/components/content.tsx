import { useEffect, useState, useMemo } from "react";
import React, { type ReactNode } from "react";
import { FilterBar, type FilterValue } from "./filter";

export interface ColumnProps<T> {
    key: keyof T | string,
    label: string,
    width?: string,
}

interface FilterFieldBase<T> {
    key: keyof T | string;
    label: string;
}

export interface TextFilterField<T> extends FilterFieldBase<T> {
    type: 'text';
}

export interface DateFilterField<T> extends FilterFieldBase<T> {
    type: 'date';
}

export interface BooleanFilterField<T> extends FilterFieldBase<T> {
    type: 'boolean';
    trueLabel: string;
    falseLabel: string;
}

export interface EnumFilterField<T> extends FilterFieldBase<T> {
    type: 'enum';
    options: { value: string; label: string }[];
}

export type FilterFieldProps<T> =
    | TextFilterField<T>
    | DateFilterField<T>
    | BooleanFilterField<T>
    | EnumFilterField<T>;

export interface ContentProps<T> {
    id: string,
    label: string,
    columns: ColumnProps<T>[],
    firstColumnDetail?: (item: T) => ReactNode,
    data: T[],
    filterFields?: FilterFieldProps<T>[],
    rowIdField: keyof T,
    renderActions: (item: T, isExpanded: boolean, toggleRow: (id: string) => void, refresh: () => void) => ReactNode,
    renderExpansion?: (item: T, close: () => void, refresh: () => void) => ReactNode,
    toolBar?: (refresh: () => void) => ReactNode,
}

export interface PageProps {
    title: string,
    activeFormId: string,
    formChange: (formId: string) => void,
    contents: ContentProps<any>[],
    onRefresh?: () => void,
    hasAccess?: boolean,
    canCreate?: boolean,
    initialFilter?: { field: string; term: string },
}

export function Content({
    title,
    activeFormId,
    formChange,
    contents,
    onRefresh,
    hasAccess,
    canCreate,
    initialFilter
}: PageProps) {
    const activeContent = contents.find(content => content.id === activeFormId);
    const [expandedId, setExpandedId] = useState<string | null>(null);
    const [filteredData, setFilteredData] = useState(activeContent?.data);
    const [sortConfig, setSortConfig] = useState<{ key: string | null, direction: 'asc' | 'desc' }>({ key: null, direction: 'asc' });

    useEffect(() => {
        if (initialFilter && activeContent?.data) {
            const searchTerm = initialFilter.term.toLocaleLowerCase();
            const newData = activeContent.data.filter(item =>
                String(item[initialFilter.field]).toLowerCase().includes(searchTerm)
            );
            setFilteredData(newData);
        } else {
            setFilteredData(activeContent?.data);
        }
    }, [activeContent?.data])

    useEffect(() => {
        setExpandedId(null);
        setSortConfig({ key: null, direction: 'asc' });
    }, [activeFormId])

    const sortedData = useMemo(() => {
        if (!filteredData) return [];
        if (!sortConfig.key) return filteredData;

        return [...filteredData].sort((a, b) => {
            const aValue = String(a[sortConfig.key!]).toLowerCase();
            const bValue = String(b[sortConfig.key!]).toLowerCase();

            if (aValue < bValue) return sortConfig.direction === 'asc' ? -1 : 1;
            if (aValue > bValue) return sortConfig.direction === 'asc' ? 1 : -1;
            return 0;
        });
    }, [filteredData, sortConfig]);

    function toggleRow(id: string) {
        setExpandedId(prev => (prev === id ? null : id));
    }

    function handleFilter(field: string, filterValue: FilterValue) {
        if (!activeContent?.data) return;

        if (filterValue.type === 'text') {
            const searchTerm = filterValue.term.toLocaleLowerCase();
            const newData = activeContent.data.filter(item =>
                String(item[field]).toLowerCase().includes(searchTerm)
            );
            setFilteredData(newData);
        } else if (filterValue.type === 'date') {
            const from = filterValue.from ? new Date(filterValue.from + 'T00:00:00') : null;
            const to = filterValue.to ? new Date(filterValue.to + 'T23:59:59') : null;
            const newData = activeContent.data.filter(item => {
                const raw = item[field];
                if (!raw) return false;
                const itemDate = new Date(raw);
                if (from && itemDate < from) return false;
                if (to && itemDate > to) return false;
                return true;
            });
            setFilteredData(newData);
        } else if (filterValue.type === 'boolean') {
            const target = filterValue.value;
            const newData = activeContent.data.filter(item =>
                String(item[field]).toLowerCase() === target
            );
            setFilteredData(newData);
        } else if (filterValue.type === 'enum') {
            const target = filterValue.value;
            const newData = activeContent.data.filter(item =>
                String(item[field]).toLowerCase() === target.toLowerCase()
            );
            setFilteredData(newData);
        }
    }

    function handleSort(key: string | any) {
        setSortConfig(prev => {
            if (prev.key === key) {
                return { key, direction: prev.direction === 'asc' ? 'desc' : 'asc' };
            }
            return { key, direction: 'asc' };
        });
    }

    return (
        <section className="ml-sidebar-size p-8 min-h-screen min-w-[600px] text-text-main">

            {/* Header */}
            <h1 className="text-standard-red font-bold text-xl mb-1 uppercase">{title}</h1>

            <div className="max-2-6xl mx-auto bg-white rounded shadow-sm border border-border">
                {/* Tabs */}
                <div className="px-6 pt-4 border-b border-border mb-3">
                    <div className="flex gap-2">
                        {contents.map((content) => (
                            <button
                                key={content.id}
                                onClick={() => formChange(content.id)}
                                className={`pb-3 px-6 text-sm font-bold transition-all relative cursor-pointer ${activeFormId === content.id ? 'text-standard-red border-b-2 border-standard-red' : 'text-text-main hover:text-standard-red'}`}
                            >
                                {content.label}
                            </button>
                        ))}
                    </div>
                </div>

                {/* ToolBar */}
                {activeContent && hasAccess !== false && <>
                    {/* Action Icons */}
                    <div className="flex justify-end items-end mx-6 gap-1 h-8">
                        {canCreate !== false && activeContent?.toolBar && activeContent?.toolBar(onRefresh || (() => { }))}
                        <FilterBar
                            key={activeContent?.id}
                            fields={activeContent?.filterFields || (activeContent?.columns || []).map(c => ({ ...c, type: 'text' as const }))}
                            onFilter={handleFilter}
                            initialField={initialFilter?.field}
                            initialTerm={initialFilter?.term}
                        />
                    </div>

                    {/* Table */}
                    <div className="px-6 pb-6">
                        <table className="w-full border-collapse">
                            <thead>
                                <tr className="bg-form-bg border-b border-border">
                                    {activeContent?.columns.map(col => (
                                        <th
                                            key={String(col.key)}
                                            className={`px-4 py-3 text-left text-sm font-bold text-text-main ${col.width ?? ''} cursor-pointer hover:bg-black/5 select-none`}
                                            onClick={() => handleSort(col.key)}
                                        >
                                            <div className="flex items-center gap-1">
                                                {col.label}
                                                {sortConfig.key === col.key && (
                                                    <span>{sortConfig.direction === 'asc' ? '▲' : '▼'}</span>
                                                )}
                                            </div>
                                        </th>
                                    ))}
                                    <th className="px-4 py-3 text-sm font-bold text-text-main text-right pr-6">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {sortedData && sortedData.length > 0 && sortedData.map((item) => {
                                    const id = item[activeContent?.rowIdField!] as unknown as string;
                                    const isExpanded = expandedId === id;

                                    if (!isExpanded) {
                                        return (
                                            <React.Fragment key={id}>

                                                <tr className="border-b border-border">
                                                    {activeContent?.columns.map(col => (
                                                        <td key={String(col.key)} className="px-4 py-4 text-sm text-text-main">
                                                            <div className="flex items-center gap-2">
                                                                {String(item[col.key])}
                                                                {activeContent?.firstColumnDetail && col === activeContent?.columns[0] && activeContent?.firstColumnDetail!(item)}
                                                            </div>
                                                        </td>
                                                    ))}
                                                    <td className="px-4 py-4 text-right">
                                                        {activeContent?.renderActions!(item, isExpanded, () => toggleRow(id), onRefresh || (() => { }))}
                                                    </td>
                                                </tr>
                                            </React.Fragment>
                                        )
                                    } else {
                                        {/* Expansion */ }
                                        return (
                                            <React.Fragment key={id}>

                                                {activeContent?.renderExpansion && (
                                                    <tr>
                                                        <td colSpan={activeContent.columns.length + 1}>
                                                            <div className="bg-form-bg border border-border rounded my-2 px-4 py-2">
                                                                {activeContent?.renderExpansion!(item, () => setExpandedId(null), onRefresh || (() => { }))}
                                                            </div>
                                                        </td>
                                                    </tr>
                                                )}

                                            </React.Fragment>
                                        )
                                    }
                                })}
                            </tbody>
                        </table>
                        {sortedData?.length === 0 && (
                            <div className="px-4 py-4 text-center text-sm text-text-main">
                                Nenhum dado encontrado.
                            </div>
                        )}
                    </div>
                </>}
                {hasAccess === false && (
                    <div className="p-16 text-center">
                        <h2 className="text-xl font-bold text-standard-red mb-2">Acesso Negado</h2>
                        <p className="text-text-main">Você não tem permissão para visualizar o conteúdo deste formulário.</p>
                    </div>
                )}
            </div>
        </section>
    );
}