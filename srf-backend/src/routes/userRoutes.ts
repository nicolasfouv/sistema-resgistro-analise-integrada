import { Router } from "express";
import { authMiddleware } from "../middlewares/authMiddleware";
import { UserController } from "../controllers/userController";

export const userRoutes = Router();

const userController = new UserController();

userRoutes.get('/user/get-all', authMiddleware('admin'), userController.getUsers);
userRoutes.get('/user/user-access/:userId', userController.getUserAccess);
userRoutes.post('/user/create', authMiddleware('admin'), userController.createUser);
userRoutes.post('/login', userController.login);
userRoutes.post('/forgot-password', userController.forgotPassword);
userRoutes.delete('/user/delete', authMiddleware('admin'), userController.deleteUser);
userRoutes.put('/user/update/details', authMiddleware('admin'), userController.updateUserDetails);
userRoutes.put('/user/update/pic', authMiddleware('admin'), userController.updateUserPic);
userRoutes.put('/user/update/access', authMiddleware('admin'), userController.updateUserAccess);
userRoutes.put('/user/update/password', authMiddleware('admin'), userController.updateUserPassword);

