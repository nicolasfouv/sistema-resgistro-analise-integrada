import 'dotenv';
import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";
import { prisma } from "..";

interface Payload {
    sub: string,
}

export function authMiddleware(permission?: 'admin') {

    return async (req: Request, res: Response, next: NextFunction) => {
        const authHeader = req.headers.authorization;
        if (!authHeader || !authHeader.startsWith('Bearer ')) return res.status(401).json({ message: 'Token não fornecido' });

        const [, token] = authHeader.split(' ');
        try {
            const decoded = verify(token as string, process.env.JWT_SECRET as string) as Payload;
            const user_id = decoded.sub;
            req.userId = user_id;

            if (permission) {
                const user = await prisma.user.findUnique({
                    where: { id: user_id }, select: { role: { select: { name: true } } }
                })
                if (user?.role?.name !== 'admin' && user?.role?.name !== 'owner') return res.status(403).json({ message: 'Acesso negado' });
                return next();
            }
            return next();

        } catch (error) {
            return res.status(401).json({ message: 'Token inválido' });
        }
    }

}