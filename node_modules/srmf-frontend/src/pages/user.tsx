import { useAuth } from "../contexts/AuthContext";

export function User() {
    const { user, signOut } = useAuth();
    return (
        <section className="ml-sidebar-size">
            <h1>Minha Conta</h1>
            <p>{user?.name}</p>
            <p>{user?.email}</p>
            <button onClick={() => signOut()} className="cursor-pointer">Sair</button>
        </section>
    )
}