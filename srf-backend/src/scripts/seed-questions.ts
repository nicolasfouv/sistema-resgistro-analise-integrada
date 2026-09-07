import 'dotenv/config';
import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

interface QuestionSeed {
    text: string;
    options?: string[];
}

// PERGUNTAS DO TUTOR

const tutorQuestions: QuestionSeed[] = [
    {
        text: '1) Respondente:',
        options: ['Masculino', 'Feminino'],
    },
    {
        text: '2) Idade:',
    },
    {
        text: '3) Faz quantos anos que você mora aqui:',
    },
    {
        text: '4) Qual é o tipo de vínculo da sua família com a propriedade em que reside?',
        options: [
            'Propriedade própria (quitada)',
            'Propriedade própria (financiada)',
            'Alugada',
            'Residência em troca de trabalho (ex.: caseiros, cuidadores)',
            'Propriedade comunitária (ex.: ocupações de terras, áreas coletivas)',
            'Propriedade em situação de posse (sem regularização formal)',
            'Outro',
        ],
    },
    {
        text: '5a) Quantas televisões há na sua casa?',
    },
    {
        text: '5b) Quantos freezers há na sua casa?',
    },
    {
        text: '5c) Quantas geladeiras há na sua casa?',
    },
    {
        text: '6) Você tem algum meio de transporte? Se sim, quais?',
    },
    {
        text: '7) Nível de escolaridade:',
        options: [
            'Não frequentou escola',
            'Ensino fundamental incompleto',
            'Ensino fundamental completo',
            'Ensino médio incompleto',
            'Ensino médio completo',
            'Ensino superior incompleto',
            'Ensino superior completo',
            'Pós graduação latu sensu',
            'Pós graduação strictu sensu',
        ],
    },
    {
        text: '8a) Número de adultos que moram na casa (+18 anos):',
    },
    {
        text: '8b) Número de adolescentes que moram na casa (12 a 18 anos):',
    },
    {
        text: '8c) Número de crianças que moram na casa (0 a 12 anos):',
    },
    {
        text: '9) Nível de escolaridade dos demais residentes:',
    },
    {
        text: '10) Com o que trabalham os adultos da casa?',
    },
    {
        text: '11) Quantas atividades vocês têm/realizam na propriedade?',
    },
    {
        text: '12) Em caso de produção agrícola, a produção é voltada para subsistência ou você trabalha como funcionário de outra pessoa?',
    },
    {
        text: '13) Você possui tratores ou algum outro tipo de maquinário agrícola? Se sim, quantos?',
    },
    {
        text: '14) Quais e quantos animais de estimação ou criação vocês têm na propriedade?',
    },
    {
        text: '14a) Gatos, são castrados?',
    },
    {
        text: '14b) Porcos, quantos?',
    },
    {
        text: '14c) Galinhas, quantos?',
    },
    {
        text: '14d) Vacas, quantos?',
    },
    {
        text: '14e) Cavalos, quantos?',
    },
    {
        text: '14f) Outras aves?',
    },
    {
        text: '15) Número de cachorros em casa:',
    },
    {
        text: '16) Por que vocês têm cachorro(a)?',
        options: [
            'Gosto de animais domésticos',
            'Para tomar conta da casa',
            'Caçar',
            'Outro',
        ],
    },
    {
        text: '21) Tem alguém que é o principal responsável pelo(a) cachorro/cadela?',
        options: [
            'Não, todos cuidam do cachorro',
            'Sim',
        ],
    },
    {
        text: '21a) Se sim, quem? Sexo, Idade, Nível de escolaridade:',
    },
    {
        text: '24) Você já passeou ou passeia com seu(s) cão(es)?',
        options: [
            'Todos os dias',
            'Algumas vezes por semana',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '24a) Se sim, por qual região?',
    },
    {
        text: '28) Com que frequência você faz carinho no seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '29) Alguém na casa brinca com o cão?',
        options: ['Sim', 'Não'],
    },
    {
        text: '29a) Se sim, quem brinca?',
    },
    {
        text: '29b) Que tipo de brincadeira?',
    },
    {
        text: '30) O que você faz quando o seu cão faz algo de errado ou não te obedece?',
        options: ['Castiga', 'Briga', 'Outro'],
    },
    {
        text: '30a) Se castiga, que tipo de castigo?',
    },
    {
        text: '31) Você oferece petisco ao seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '32) Você sai de carro com o seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '33) Você dá banho ou tosa o seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '34) Na sua opinião, quanto trabalho seu cachorro dá no dia a dia?',
        options: [
            'Quase nenhum trabalho',
            'Pouco trabalho',
            'Trabalho moderado',
            'Muito trabalho',
        ],
    },
    {
        text: '35) Seu(s) cão(es) fica animado e agitado quando você dá um petisco ou um brinquedo para ele(s)?',
        options: ['Sim', 'Não'],
    },
    {
        text: '36) Você gosta de ter seu cachorro por perto?',
        options: ['Nunca', 'Às vezes', 'Sempre'],
    },
    {
        text: '37) Você acha que vai sofrer quando seu cão morrer?',
        options: ['Não', 'Muito pouco', 'Pouco', 'Bastante', 'Demais'],
    },
    {
        text: '38) Quanto você acha que seu cachorro custa para você?',
        options: ['Nada ou muito pouco', 'Pouco', 'Razoável', 'Muito'],
    },
    {
        text: '39) Considerando todo o trabalho, você acha que vale a pena ter cães?',
        options: ['Não', 'Mais ou menos', 'Com certeza'],
    },
    {
        text: '39a) Por quê?',
    },
    {
        text: '40) Como é a alimentação do(a) seu/sua cachorro/cadela?',
        options: [
            'Alimenta-se somente com ração',
            'Alimenta-se com ração e comida de casa',
            'Alimenta-se somente com comida de casa',
            'Outra',
        ],
    },
    {
        text: '40a) Se somente ração, qual?',
    },
    {
        text: '40b) Se outra, especificar:',
    },
    {
        text: '41) Qual o tipo de ração ofertada?',
        options: ['À granel', 'Pacote fechado'],
    },
    {
        text: '41a) Marca e tipo, se houver:',
    },
    {
        text: '42) Quais os tipos de alimentos caseiros ofertados?',
        options: [
            'Resto de refeição',
            'Frango/carne/porco cozido ou frito',
            'Farelo de milho',
            'Outro',
        ],
    },
    {
        text: '42a) Se outro alimento caseiro, qual?',
    },
    {
        text: '45) Com qual frequência seu/sua cachorro/cachorra é alimentado(a)?',
        options: [
            'Oferecemos alimento uma vez ao dia',
            'Oferecemos alimento duas vezes ao dia',
            'Oferecemos alimento de três ou mais vezes ao dia',
            'Outros',
        ],
    },
    {
        text: '45a) Se outros, especificar:',
    },
    {
        text: '46) A água oferecida ao cachorro/cadela é trocada/reposta com qual frequência?',
        options: [
            'Colocamos água nova quando ele bebe toda água',
            'Duas vezes ao dia, mesmo que ainda tenha água',
            'No mínimo três vezes ao dia',
        ],
    },
    {
        text: '47) Mais alguém de fora oferece alimentos ao(à) seu/sua cachorro/cadela?',
        options: ['Não', 'Não sei', 'Sim'],
    },
    {
        text: '47a) Se sim, quem e o que oferece?',
    },
    {
        text: '48) Seu cachorro fica solto?',
        options: [
            'Não, nunca',
            'Sim, apenas à noite',
            'Sim, durante dia e noite',
        ],
    },
    {
        text: '48a) Se sim, quais cães?',
    },
    {
        text: '52) Seu/sua cachorro/cadela corre atrás de bichos?',
        options: ['Não', 'Nunca vi', 'Sim'],
    },
    {
        text: '52a) Se sim, o que você faz quando vê?',
    },
    {
        text: '53) De quais animais o(s) seu(s) cachorro(s) corre(m) atrás?',
    },
    {
        text: '54) No último ano, quantas vezes você viu o seu cachorro correr atrás de animais selvagens?',
    },
    {
        text: '56) Seu/sua cachorro/cadela traz para casa bichos que caçou na rua?',
        options: ['Não', 'Sim'],
    },
    {
        text: '56a) Se sim, quais bichos?',
    },
    {
        text: '57) Quais bichos eles evitam ou têm medo?',
    },
    {
        text: '58) Quais bichos você vê com frequência na sua propriedade?',
    },
    {
        text: '59) Você vacina seu/sua cachorro/cadela?',
        options: ['Sim', 'Não', 'Outro'],
    },
    {
        text: '59a) Se outro, especificar:',
    },
    {
        text: '61) Você sabe se aqui na cidade tem gente que caça com cachorros?',
        options: ['Não', 'Sim'],
    },
    {
        text: '61a) Se sim, o que você já viu ou ouviu?',
    },
];

// PERGUNTAS DO ANIMAL
// Perguntas: 17, 18, 19, 20, 22, 23, 25, 26, 27, 43, 44, 49, 50, 51, 55, 60

const animalQuestions: QuestionSeed[] = [
    {
        text: '17) Cachorro/cadela - Sexo:',
        options: ['Macho', 'Fêmea'],
    },
    {
        text: '17a) Caso seja fêmea, já teve alguma cria?',
        options: ['Não', 'Sim'],
    },
    {
        text: '17b) Se sim, quantas crias?',
    },
    {
        text: '17c) Ela deu cria no último ano?',
        options: ['Não', 'Sim'],
    },
    {
        text: '17d) Se sim, quantos filhotes?',
    },
    {
        text: '17e) Se sim, o que fizeram com os filhotes?',
    },
    {
        text: '18) Raça(s):',
    },
    {
        text: '19) Idade(s):',
    },
    {
        text: '20) Origem(ns):',
    },
    {
        text: '22) O seu cão te acompanha ou tenta te acompanhar quando você sai da sua casa e/ou vai a algum lugar além da sua casa?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '23) Caso algum adulto trabalhe na área rural (cafezal, gado, etc), o cachorro o acompanha nas atividades diárias?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '25) Seu cão é arisco ou medroso?',
        options: ['Não', 'Sim'],
    },
    {
        text: '25a) Se sim, de quem ele mais tem medo?',
    },
    {
        text: '26) Você percebe que seu cachorro tem medo de alguém?',
        options: [
            'Não, ele não tem medo',
            'Sim, tem medo de mim',
            'Sim, tem medo de outras pessoas',
            'Sim, tem medo de ambos',
        ],
    },
    {
        text: '26a) Se sim, por quê?',
    },
    {
        text: '27) O seu cão "faz festa" quando te vê?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    {
        text: '43) Seu cão ingere carcaças ou restos de animais mortos?',
        options: ['Sim', 'Não', 'Não sei'],
    },
    {
        text: '43a) Se sim, quais animais e qual a origem da carcaça (abatido em casa, encontrada na propriedade, etc)?',
    },
    {
        text: '44) O que o seu cão come com mais frequência?',
        options: [
            'Ração',
            'Resto de comida',
            'Animais de captura',
            'Restos de animais de criação que lhes são fornecidos',
            'Não sei',
        ],
    },
    {
        text: '49) Onde dorme seu/sua cachorro/cadela?',
        options: [
            'Dentro de casa',
            'Em uma casinha do lado de fora da casa',
            'Em um pano/acolchoado em local coberto',
            'Outro',
        ],
    },
    {
        text: '49a) Se outro, especificar:',
    },
    {
        text: '50) De vez em quando seu/sua cachorro/cadela passa muito tempo fora de casa?',
        options: ['Não', 'Sim'],
    },
    {
        text: '50a) Se sim, com que frequência sai?',
    },
    {
        text: '50b) Se sim, onde acha que ele(a) fica?',
    },
    {
        text: '51) Em caso de matilhas, você percebe se algum dos cães é o líder da matilha?',
        options: ['Não', 'Sim'],
    },
    {
        text: '51a) Se sim, qual?',
    },
    {
        text: '51b) Que tipo de comportamento ele tem que te faz achar que ele é o líder?',
    },
    {
        text: '55) Eles já conseguiram matar algum animal?',
        options: ['Sim', 'Não'],
    },
    {
        text: '55a) Se sim, quais?',
    },
    {
        text: '60) Quais vacinas já foram aplicadas?',
        options: [
            'Raiva',
            'Múltipla (parvovirose, cinomose etc)',
        ],
    },
    {
        text: '60a) Detalhar outras vacinas aplicadas:',
    },
];

// Função auxiliar para inserir perguntas e opções

async function seedTutorQuestions() {
    await prisma.tutorAnswerOption.deleteMany();
    await prisma.tutorQuestion.deleteMany();

    for (const q of tutorQuestions) {
        // Verifica se a pergunta já existe
        const existing = await prisma.tutorQuestion.findUnique({
            where: { text: q.text },
        });

        let questionId: number;

        if (existing) {
            questionId = existing.id;
        } else {
            const created = await prisma.tutorQuestion.create({
                data: { text: q.text },
            });
            questionId = created.id;
        }

        // Inserir opções de resposta, se houver
        if (q.options && q.options.length > 0) {
            for (const optionText of q.options) {
                // Verificar se a opção já existe para esta pergunta
                const existingOption = await prisma.tutorAnswerOption.findFirst({
                    where: {
                        tutorQuestionId: questionId,
                        text: optionText,
                    },
                });

                if (!existingOption) {
                    await prisma.tutorAnswerOption.create({
                        data: {
                            tutorQuestionId: questionId,
                            text: optionText,
                        },
                    });
                }
            }
        }
    }

}

async function seedAnimalQuestions() {
    await prisma.animalAnswerOption.deleteMany();
    await prisma.animalQuestion.deleteMany();

    for (const q of animalQuestions) {
        // Verifica se a pergunta já existe
        const existing = await prisma.animalQuestion.findUnique({
            where: { text: q.text },
        });

        let questionId: number;

        if (existing) {
            questionId = existing.id;
        } else {
            const created = await prisma.animalQuestion.create({
                data: { text: q.text },
            });
            questionId = created.id;
        }

        // Inserir opções de resposta, se houver
        if (q.options && q.options.length > 0) {
            for (const optionText of q.options) {
                // Verificar se a opção já existe para esta pergunta
                const existingOption = await prisma.animalAnswerOption.findFirst({
                    where: {
                        animalQuestionId: questionId,
                        text: optionText,
                    },
                });

                if (!existingOption) {
                    await prisma.animalAnswerOption.create({
                        data: {
                            animalQuestionId: questionId,
                            text: optionText,
                        },
                    });
                }
            }
        }
    }
}

// Execução principal
async function main() {
    await seedTutorQuestions();
    await seedAnimalQuestions();
}

main()
    .catch((e) => {
        console.error('Erro:', e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
