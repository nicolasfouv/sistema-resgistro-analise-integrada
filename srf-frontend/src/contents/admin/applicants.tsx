import { type ContentProps } from "../../components/content";
import { acceptApplicant, getApplicants, rejectApplicant } from "../../services/applicantService";

export interface Applicant {
    id: string,
    name: string,
    email: string,
    date: string,
    message: string,
}

export const ApplicantContentDefinition = {
    id: 'solicitacoes',
    label: 'Solicitações',
    columns: [
        {
            key: 'name',
            label: 'Nome',
            width: 'w-1/5'
        },
        {
            key: 'email',
            label: 'E-mail',
            width: 'w-2/5'
        },
        {
            key: 'date',
            label: 'Data',
            width: 'w-1/5'
        }
    ],
    rowIdField: 'id',
    renderActions: (item: Applicant, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <button
            onClick={() => toggle(item.id)}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            Expandir
        </button>
    ),
    renderExpansion: (item: Applicant, close: () => void, refresh: () => void) => (
        <>
            <div className="sticky top-0 z-10 bg-form-bg pb-2">
                <div className="flex justify-between items-center pb-1 mb-2 border-b border-gray-600">
                    <h3 className="font-bold text-text-main uppercase">Informações da Solicitação</h3>
                    <div className="flex gap-2 text-xs font-bold uppercase">
                        <button onClick={async () => { await acceptApplicant(item.id); refresh(); }} className="text-button-green uppercase cursor-pointer">Aceitar</button>
                        <button onClick={async () => { await rejectApplicant(item.id); refresh(); }} className="text-button-red uppercase cursor-pointer">Recusar</button>
                        <button onClick={close} className="text-standard-blue uppercase cursor-pointer">Recolher</button>
                    </div>
                </div>
                <div className="flex gap-2 w-full text-sm">
                    <div className="flex flex-col w-1/5">
                        <label htmlFor="name" className="ml-1 font-bold">Nome</label>
                        <input type="text" disabled value={item.name} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-2/5">
                        <label htmlFor="email" className="ml-1 font-bold">E-mail</label>
                        <input type="text" disabled value={item.email} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                    <div className="flex flex-col w-1/5">
                        <label htmlFor="date" className="ml-1 font-bold">Data</label>
                        <input type="text" disabled value={item.date} className="mb-2 border border-border rounded px-2 py-1 text-text-input" />
                    </div>
                </div>
                <hr className="border-gray-200" />
            </div>
            <div className="text-sm text-text-main">
                <label htmlFor="message" className="ml-1 font-bold">Mensagem</label>
                <textarea disabled value={item.message || 'Não há justificativa para a solicitação'} className="mb-2 border border-border rounded px-2 py-1 resize-none w-full text-text-input" />
            </div>
        </>
    )
};

export const fetchApplicantsData = async () => {
    const applicants = await getApplicants();
    return applicants.map(a => ({
        ...a,
        date: new Date(a.date).toLocaleDateString('pt-BR'),
    }));
};

export const ApplicantPermissionsContent: ContentProps<Applicant> = {
    ...ApplicantContentDefinition,
    data: [],
} as unknown as ContentProps<Applicant>;