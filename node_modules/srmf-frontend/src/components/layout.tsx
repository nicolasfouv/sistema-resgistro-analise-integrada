import { Outlet } from "react-router-dom";
import { Private } from "./private";
import { Sidebar } from "./sidebar";

export function Layout() {
    return (
        <>
            <Private>
                <Sidebar />
                <Outlet />
            </Private>
        </>
    )
}