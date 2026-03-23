import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import { login } from '../services/userService';

interface UserLogin {
    id: string;
    name: string;
    email: string;
    userPic?: string;
    role: string;
    token?: string;
}

interface AuthContextType {
    signedIn: boolean;
    user: UserLogin | null;
    signIn: (email: string, password: string) => Promise<void>;
    signOut: () => void;
    loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<UserLogin | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const storedUser = localStorage.getItem('user');
        const storedToken = localStorage.getItem('token');

        if (storedUser && storedToken) {
            setUser(JSON.parse(storedUser));
        }
        setLoading(false);
    }, []);

    async function signIn(email: string, password: string) {
        try {
            const response = await login(email, password);
            const userData = response.user;
            const token = response.token;

            setUser(userData);

            localStorage.setItem('user', JSON.stringify(userData));
            if (token) {
                localStorage.setItem('token', token);
            }
        } catch (error) {
            throw error;
        }
    }

    function signOut() {
        setUser(null);
        localStorage.removeItem('user');
        localStorage.removeItem('token');
    }

    const value = {
        signedIn: !!user,
        user,
        signIn,
        signOut,
        loading
    };

    return (
        <AuthContext.Provider value={value}>
            {!loading && children}
        </AuthContext.Provider>
    );
}

export function useAuth() {
    const context = useContext(AuthContext);
    if (context === undefined) {
        throw new Error('useAuth deve ser usado dentro de um AuthProvider');
    }
    return context;
}
