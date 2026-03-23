import { type ContentProps } from "../../components/content";
import { createUser, getUsers } from "../../services/userService";
import deleteButtonDisabledImg from '../../assets/deleteButtonDisabled.svg';
import deleteButtonImg from '../../assets/deleteButton.svg';
import editButtonImg from '../../assets/editButton.svg';
import formsButtonImg from '../../assets/formsButton.svg';
import { useAuth } from "../../contexts/AuthContext";
import { useState } from "react";
import { UserPermissionsModal } from "./userPermissionsModal";
import { EditUserModal } from "./editUserModal";
import { DeleteUserModal } from "./deleteUserModal";

export interface User {
    id: string,
    name: string,
    email: string,
    userPic: string,
    role: { name: string },
}

function UserFirstColumnDetail({ item }: { item: User }) {
    const { user } = useAuth();
    return (
        (item.role?.name === 'admin' || item.role?.name === 'owner') ? (
            (item.id === user?.id) ? (
                <div className="flex gap-1">
                    <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">(eu)</p>
                    <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">
                        admin
                    </p>
                </div>
            ) : (
                <p className="block bg-form-bg rounded-xl py-1 px-1.5 text-[14px] text-text-light-gray">
                    admin
                </p>
            )
        ) : null
    )
}


function UserActions({ item, refresh }: { item: User, refresh: () => void }) {
    const { user } = useAuth();

    const [showFormsModal, setShowFormsModal] = useState(false);
    const [showEditModal, setShowEditModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);

    return (
        <div className="flex justify-end gap-2">

            {/* FORMS PERMISSIONS MODAL */}
            <button onClick={() => {
                setShowFormsModal(true);
            }} className="size-8 cursor-pointer">
                <img src={formsButtonImg} alt="Forms button" />
            </button>
            {showFormsModal && user && <UserPermissionsModal user={item} close={() => setShowFormsModal(false)} />}

            {/* EDIT USER MODAL */}
            <button onClick={() => {
                setShowEditModal(true);
            }} className="size-8 cursor-pointer">
                <img src={editButtonImg} alt="Edit button" />
            </button>
            {showEditModal && <EditUserModal user={item} close={() => setShowEditModal(false)} refresh={refresh} />}

            {/* DELETE USER MODAL */}
            <button
                onClick={() => setShowDeleteModal(true)}
                className={`size-8 ${item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin' ? '' : 'cursor-pointer'}`}
                disabled={item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin'}
                title="Excluir"
            >
                <img src={item.id === user?.id || item.role?.name === 'owner' || item.role?.name === 'admin' ? deleteButtonDisabledImg : deleteButtonImg} alt="Delete button" />
            </button>
            {showDeleteModal && <DeleteUserModal user={item} close={() => setShowDeleteModal(false)} refresh={refresh} />}

        </div >
    );
}

function UserToolBar({ refresh }: { refresh: () => void }) {
    const { user } = useAuth();
    if (user?.role !== 'owner') {
        return null;
    }
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState<{ name?: string, email?: string, password?: string } | null>(null);
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError(null);
        try {
            await createUser(name, email, password);
            refresh();
            setName('');
            setEmail('');
            setPassword('');
        } catch (error: any) {
            setError(error.response?.data?.message as { name?: string, email?: string, password?: string });
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="gap-4 bg-form-bg p-4 rounded-md mx-6 mb-6">
            <h3 className="font-bold text-text-main uppercase text-xs mb-2">Adicionar usuário</h3>
            <form onSubmit={handleSubmit} className="grid grid-cols-4 gap-4">
                <input type='text' placeholder='Nome' className="bg-white border border-border p-2 rounded" value={name} onChange={(e) => setName(e.target.value)} />
                <input type='text' placeholder='Email' className="bg-white border border-border p-2 rounded" value={email} onChange={(e) => setEmail(e.target.value)} />
                <input type='text' placeholder='Senha' className="bg-white border border-border p-2 rounded" value={password} onChange={(e) => setPassword(e.target.value)} />
                <button className="bg-standard-blue text-white font-bold cursor-pointer px-4 rounded" disabled={loading}> {loading ? 'Aguarde...' : 'Adicionar'}</button>
            </form>
            {error && (
                <div className="text-red-500 text-sm mt-2">{error.name || error.email || error.password}</div>
            )}
        </div>
    )
}

export const UsersContentDefinition = {
    id: 'usuarios',
    label: 'Usuários',
    columns: [
        {
            key: 'name',
            label: 'Nome',
            width: 'w-2/5'
        },
        {
            key: 'email',
            label: 'E-mail',
            width: 'w-2/5'
        }
    ],
    firstColumnDetail: (item: User) => (
        <UserFirstColumnDetail item={item} />
    ),
    rowIdField: 'id' as keyof User,
    renderActions: (item: User, isExpanded: boolean, toggle: (id: string) => void, refresh: () => void) => (
        <UserActions item={item} refresh={refresh} />
    ),
    toolBar: (refresh: () => void) => (
        <UserToolBar refresh={refresh} />
    )
};

export async function fetchUsersData() {
    return getUsers();
};

export const UsersPermissionsContent: ContentProps<User> = {
    ...UsersContentDefinition,
    data: [],
} as unknown as ContentProps<User>;
