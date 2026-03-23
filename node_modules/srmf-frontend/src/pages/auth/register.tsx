import { useState, type FormEvent } from "react";

import registerNameImg from '../../assets/registerName.svg';
import registerEmailImg from '../../assets/registerEmail.svg';
import registerPasswordImg from '../../assets/registerPassword.svg';
import registerMessageImg from '../../assets/registerMessage.svg';
import { register } from "../../services/userService";
import { Link, useNavigate } from "react-router-dom";

export function Register() {
    const navigate = useNavigate();

    const [isLoading, setIsLoading] = useState(false);
    const [registerData, setRegisterData] = useState({
        name: '',
        email: '',
        password: '',
        passwordConfirm: '',
        message: '',
    });
    const [errorStatus, setErrorStatus] = useState(undefined);
    const [errorName, setErrorName] = useState('');
    const [errorEmail, setErrorEmail] = useState('');
    const [errorPassword, setErrorPassword] = useState('');
    const [errorPasswordConfirm, setErrorPasswordConfirm] = useState('');

    function handleInputChange(event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) {
        setRegisterData(prevState => ({ ...prevState, [event.target.id]: event.target.value }));
        setErrorStatus(undefined);
        setErrorName('');
        setErrorEmail('');
        setErrorPassword('');
        setErrorPasswordConfirm('');
    }

    async function handleSubmit(event: FormEvent) {
        event.preventDefault();
        setIsLoading(true);
        try {
            if (registerData.password === registerData.passwordConfirm) {
                await register(registerData.name, registerData.email, registerData.password, registerData.message);
                alert('Requisição enviada com sucesso!\n\nPor favor, aguarde a confirmação de seu cadastro.');
                navigate('/login', { replace: true });
            }
            setErrorPasswordConfirm('As senhas não coincidem');
        } catch (error: any) {
            setErrorName(error.response.data.message.name);
            setErrorStatus(error.response.status);
            setErrorEmail(error.response.data.message.email);
            setErrorPassword(error.response.data.message.password);
        } finally {
            setIsLoading(false);
        }
    }
    return (
        <section className="flex flex-col w-full min-h-screen items-center justify-center">
            <div className="flex flex-col bg-white w-310 h-160 justify-center items-center rounded-2xl shadow-xl p-10">
                <form onSubmit={handleSubmit} className="size-full">
                    <h1 className="block mx-auto text-center text-4xl font-bold my-5">Solicitação de Acesso</h1>
                    <div className="grid grid-cols-2 gap-10">
                        <div className="flex flex-col">

                            <div className="flex items-center mt-5 relative w-full">
                                <img src={registerNameImg} alt="Name register image" className="absolute left-2 w-8 h-8" />
                                <input type="text" id="name" placeholder="Nome" className="w-full h-14 pl-11 border border-border rounded-xl text-2xl pb-1" value={registerData.name} onChange={handleInputChange} />
                            </div>
                            {errorStatus === 400 && <p className="-mt-0.5 -mb-3 ml-2 text-red-500">{errorName}</p>}

                            <div className="flex items-center mt-5 relative w-full">
                                <img src={registerEmailImg} alt="Email register image" className="absolute left-2 w-8 h-8" />
                                <input type="email" id="email" placeholder="Email" className="w-full h-14 pl-11 border border-border rounded-xl text-2xl pb-1" value={registerData.email} onChange={handleInputChange} />
                            </div>
                            {(errorStatus === 400 && <p className="-mt-0.5 -mb-3 ml-2 text-red-500">{errorEmail}</p>) || (errorStatus === 409 && <p className="-mt-0.5 -mb-3 ml-2 text-red-500">E-mail já utilizado</p>)}

                            <div className="flex items-center mt-5 relative w-full">
                                <img src={registerPasswordImg} alt="Password register image" className="absolute left-2 w-8 h-8" />
                                <input type="password" id="password" placeholder="Senha" className="w-full h-14 pl-11 border border-border rounded-xl text-2xl pb-1" value={registerData.password} onChange={handleInputChange} />
                            </div>
                            {errorStatus === 400 && <p className="-mt-0.5 -mb-3 ml-2 text-red-500">{errorPassword}</p>}

                            <div className="flex items-center mt-5 relative w-full">
                                <img src={registerPasswordImg} alt="Password register image" className="absolute left-2 w-8 h-8" />
                                <input type="password" id="passwordConfirm" placeholder="Confirmar Senha" className="w-full h-14 pl-11 border border-border rounded-xl text-2xl pb-1" value={registerData.passwordConfirm} onChange={handleInputChange} />
                            </div>
                            {errorPasswordConfirm && <p className="-mt-0.5 -mb-3 ml-2 text-red-500">{errorPasswordConfirm}</p>}
                        </div>

                        <div className="flex pt-5 relative w-full h-full -mb-0.5">
                            <img src={registerMessageImg} alt="Message register image" className="absolute left-2 top-8 w-8 h-8" />
                            <textarea id="message" placeholder="Justificativa da solicitação (opcional)" className="w-full h-full pl-11 border border-border rounded-xl text-2xl resize-none pt-2" value={registerData.message} onChange={handleInputChange} />
                        </div>
                    </div>

                    <button type="submit" disabled={isLoading}
                        className="block mx-auto mt-10 w-140 h-14 rounded-md bg-standard-blue text-white text-xl font-bold cursor-pointer">
                        {isLoading ? 'ENVIANDO...' : 'ENVIAR SOLICITAÇÃO'}
                    </button>
                </form>

                <div className="flex flex-col items-center mt-5">
                    <p className="text-xl">Já possui uma conta?</p>
                    <p className="text-xl text-standard-blue underline"><Link to="/login">Fazer login</Link></p>
                </div>
            </div>
        </section>
    )
}