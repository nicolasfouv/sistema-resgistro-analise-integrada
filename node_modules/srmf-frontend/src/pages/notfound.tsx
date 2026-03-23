import { Navigate } from "react-router-dom";

export function NotFound() {
    return (
        <div className="ml-sidebar-width flex flex-col items-center justify-center h-screen">
            <h1 className="text-4xl font-bold">404</h1>
            <p className="text-xl">Página não encontrada</p>
            <Navigate to='/minha-conta' />
        </div>
    )
}   