import { useState } from "react";
import { useAuth } from "../../contexts/AuthContext";
import userImg from "../../assets/loginUser.svg";
import lightGrayPen from "../../assets/lightGrayPen.svg";
import grayLock from "../../assets/grayLock.svg";
import grayExit from "../../assets/grayExit.svg";
import grayProfile from "../../assets/grayProfile.svg";
import { ChangeDetailModal } from "./changeDetailModal";
import { ChangePictureModal } from "./changePictureModal";
import { ChangePasswordModal } from "./changePasswordModal";

export function User() {
    const { user, signOut } = useAuth();

    const [showChangeDetailModal, setShowChangeDetailModal] = useState(false);
    const [showChangePictureModal, setShowChangePictureModal] = useState(false);
    const [showChangePasswordModal, setShowChangePasswordModal] = useState(false);

    return (
        <>
            {showChangeDetailModal && (
                <ChangeDetailModal
                    close={() => setShowChangeDetailModal(false)}
                    refresh={() => { }}
                />
            )}
            {showChangePictureModal && (
                <ChangePictureModal
                    close={() => setShowChangePictureModal(false)}
                    refresh={() => { }}
                />
            )}
            {showChangePasswordModal && (
                <ChangePasswordModal
                    close={() => setShowChangePasswordModal(false)}
                    refresh={() => { }}
                />
            )}
            <section className="ml-sidebar-size p-8 min-h-screen min-w-[600px] text-text-main grid grid-cols-[1fr_2fr] gap-8">
                <div className="flex flex-col bg-white rounded shadow-sm border border-border px-2 py-4">

                    <h2 className="text-lg font-bold mb-8 text-standard-red text-center">Minha Conta</h2>
                    <div className="flex flex-col">
                        {/* Foto de perfil */}
                        <div className="relative mx-auto size-40 rounded-full mb-10">
                            <div className="absolute bottom-0 right-0 size-full rounded-full cursor-pointer hover:opacity-100 opacity-0 transition-opacity duration-200 hover:bg-black/20">
                                <img
                                    src={lightGrayPen}
                                    alt="Editar foto de perfil"
                                    className="size-full p-10"
                                    onClick={() => setShowChangePictureModal(true)}
                                />
                            </div>
                            <img
                                src={user?.userPic || userImg}
                                alt="Foto de perfil"
                                className={`size-full bg-[#444141] rounded-full ${user?.userPic ? '' : 'p-2'} mx-auto`}
                            />
                        </div>
                        {/* Dados do usuário */}
                        <div className="flex flex-col px-8 py-4 mb-4 gap-8">
                            <div className="flex justify-between font-semibold">
                                <p className="text-text-light-gray">Nome</p>
                                <p>{user?.name}</p>
                            </div>
                            <div className="flex justify-between font-semibold">
                                <p className="text-text-light-gray">Email</p>
                                <p>{user?.email}</p>
                            </div>
                        </div>
                        {/* Botões de ação */}
                        <div
                            onClick={() => setShowChangeDetailModal(true)}
                            className="flex cursor-pointer hover:bg-black/5 px-8 py-4 rounded-lg gap-8">
                            <img src={grayProfile} alt="Editar" className="size-6" />
                            <p className="font-semibold">Alterar perfil</p>
                        </div>
                        <div
                            onClick={() => setShowChangePasswordModal(true)}
                            className="flex cursor-pointer hover:bg-black/5 px-8 py-4 rounded-lg gap-8">
                            <img src={grayLock} alt="Editar" className="size-6" />
                            <p className="font-semibold">Alterar senha</p>
                        </div>
                        <div
                            onClick={() => signOut()}
                            className="flex cursor-pointer hover:bg-black/5 px-8 py-[14px] rounded-lg gap-8">
                            <img src={grayExit} alt="Sair" className="size-7" />
                            <p className="font-semibold">Sair</p>
                        </div>
                    </div>
                </div>

                <div className="bg-white rounded shadow-sm border border-border px-2 py-4">
                    <h2 className="text-lg font-bold mb-4 text-standard-red text-center">Minha Atividade</h2>
                    <p>Em desenvolvimento...</p>
                </div>
            </section>
        </>
    )
}