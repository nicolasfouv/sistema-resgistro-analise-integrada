import 'dotenv/config';
import { PrismaClient } from '../../generated/prisma';

const prisma = new PrismaClient();

// Tipos auxiliares

interface QuestionSeed {
    text: string;
    options?: string[];
}

// PERGUNTAS DO TUTOR

const tutorQuestions: QuestionSeed[] = [
    // 1) Respondente
    {
        text: '1) Respondente:',
        options: ['Masculino', 'Feminino'],
    },
    // 2) Idade
    {
        text: '2) Idade:',
    },
    // 3) Faz quantos anos que você mora aqui
    {
        text: '3) Faz quantos anos que você mora aqui:',
    },
    // 4) Tipo de vínculo da família com a propriedade
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
    // 5a) Quantas televisões
    {
        text: '5a) Quantas televisões há na sua casa?',
    },
    // 5b) Quantos freezers
    {
        text: '5b) Quantos freezers há na sua casa?',
    },
    // 5c) Quantas geladeiras
    {
        text: '5c) Quantas geladeiras há na sua casa?',
    },
    // 6) Meio de transporte
    {
        text: '6) Você tem algum meio de transporte? Se sim, quais?',
    },
    // 7) Nível de escolaridade
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
    // 8) Número de adultos, adolescentes e crianças
    {
        text: '8a) Número de adultos que moram na casa (+18 anos):',
    },
    {
        text: '8b) Número de adolescentes que moram na casa (12 a 18 anos):',
    },
    {
        text: '8c) Número de crianças que moram na casa (0 a 12 anos):',
    },
    // 9) Nível de escolaridade dos demais residentes
    {
        text: '9) Nível de escolaridade dos demais residentes:',
    },
    // 10) Com o que trabalham os adultos da casa
    {
        text: '10) Com o que trabalham os adultos da casa?',
    },
    // 11) Quantas atividades vocês têm/realizam na propriedade
    {
        text: '11) Quantas atividades vocês têm/realizam na propriedade?',
    },
    // 12) Produção agrícola
    {
        text: '12) Em caso de produção agrícola, a produção é voltada para subsistência ou você trabalha como funcionário de outra pessoa?',
    },
    // 13) Tratores / maquinário agrícola
    {
        text: '13) Você possui tratores ou algum outro tipo de maquinário agrícola? Se sim, quantos?',
    },
    // 14) Animais de estimação ou criação
    {
        text: '14) Quais e quantos animais de estimação ou criação vocês têm na propriedade?',
    },
    // 14 sub) Gatos castrados
    {
        text: '14a) Gatos, são castrados?',
    },
    // 14 sub) Porcos
    {
        text: '14b) Porcos, quantos?',
    },
    // 14 sub) Galinhas
    {
        text: '14c) Galinhas, quantos?',
    },
    // 14 sub) Vacas
    {
        text: '14d) Vacas, quantos?',
    },
    // 14 sub) Cavalos
    {
        text: '14e) Cavalos, quantos?',
    },
    // 14 sub) Outras aves
    {
        text: '14f) Outras aves?',
    },
    // 15) Número de cachorros em casa
    {
        text: '15) Número de cachorros em casa:',
    },
    // 16) Por que vocês têm cachorro(a)?
    {
        text: '16) Por que vocês têm cachorro(a)?',
        options: [
            'Gosto de animais domésticos',
            'Para tomar conta da casa',
            'Caçar',
            'Outro',
        ],
    },
    // 21) Principal responsável pelo cachorro/cadela
    {
        text: '21) Tem alguém que é o principal responsável pelo(a) cachorro/cadela?',
        options: [
            'Não, todos cuidam do cachorro',
            'Sim',
        ],
    },
    // 21 sub) Quem, sexo, idade, escolaridade
    {
        text: '21a) Se sim, quem? Sexo, Idade, Nível de escolaridade:',
    },
    // 24) Você já passeou ou passeia com seu(s) cão(es)?
    {
        text: '24) Você já passeou ou passeia com seu(s) cão(es)?',
        options: [
            'Todos os dias',
            'Algumas vezes por semana',
            'Raramente',
            'Nunca',
        ],
    },
    // 24 sub) Região do passeio
    {
        text: '24a) Se sim, por qual região?',
    },
    // 28) Com que frequência você faz carinho no seu cachorro?
    {
        text: '28) Com que frequência você faz carinho no seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 29) Alguém na casa brinca com o cão?
    {
        text: '29) Alguém na casa brinca com o cão?',
        options: ['Sim', 'Não'],
    },
    // 29 sub) Quem brinca?
    {
        text: '29a) Se sim, quem brinca?',
    },
    // 29 sub) Tipo de brincadeira
    {
        text: '29b) Que tipo de brincadeira?',
    },
    // 30) O que você faz quando o cão faz algo errado?
    {
        text: '30) O que você faz quando o seu cão faz algo de errado ou não te obedece?',
        options: ['Castiga', 'Briga', 'Outro'],
    },
    // 30 sub) Tipo de castigo
    {
        text: '30a) Se castiga, que tipo de castigo?',
    },
    // 31) Petisco
    {
        text: '31) Você oferece petisco ao seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 32) Sai de carro com o cachorro?
    {
        text: '32) Você sai de carro com o seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 33) Banho ou tosa
    {
        text: '33) Você dá banho ou tosa o seu cachorro?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 34) Quanto trabalho seu cachorro dá?
    {
        text: '34) Na sua opinião, quanto trabalho seu cachorro dá no dia a dia?',
        options: [
            'Quase nenhum trabalho',
            'Pouco trabalho',
            'Trabalho moderado',
            'Muito trabalho',
        ],
    },
    // 35) Cão fica animado com petisco/brinquedo?
    {
        text: '35) Seu(s) cão(es) fica animado e agitado quando você dá um petisco ou um brinquedo para ele(s)?',
        options: ['Sim', 'Não'],
    },
    // 36) Gosta de ter o cachorro por perto?
    {
        text: '36) Você gosta de ter seu cachorro por perto?',
        options: ['Nunca', 'Às vezes', 'Sempre'],
    },
    // 37) Vai sofrer quando o cão morrer?
    {
        text: '37) Você acha que vai sofrer quando seu cão morrer?',
        options: ['Não', 'Muito pouco', 'Pouco', 'Bastante', 'Demais'],
    },
    // 38) Quanto o cachorro custa?
    {
        text: '38) Quanto você acha que seu cachorro custa para você?',
        options: ['Nada ou muito pouco', 'Pouco', 'Razoável', 'Muito'],
    },
    // 39) Vale a pena ter cães?
    {
        text: '39) Considerando todo o trabalho, você acha que vale a pena ter cães?',
        options: ['Não', 'Mais ou menos', 'Com certeza'],
    },
    // 39 sub) Por quê?
    {
        text: '39a) Por quê?',
    },
    // 40) Alimentação do cachorro/cadela
    {
        text: '40) Como é a alimentação do(a) seu/sua cachorro/cadela?',
        options: [
            'Alimenta-se somente com ração',
            'Alimenta-se com ração e comida de casa',
            'Alimenta-se somente com comida de casa',
            'Outra',
        ],
    },
    // 40 sub) Qual ração?
    {
        text: '40a) Se somente ração, qual?',
    },
    // 40 sub) Outra alimentação
    {
        text: '40b) Se outra, especificar:',
    },
    // 41) Tipo de ração ofertada
    {
        text: '41) Qual o tipo de ração ofertada?',
        options: ['À granel', 'Pacote fechado'],
    },
    // 41 sub) Marca e tipo
    {
        text: '41a) Marca e tipo, se houver:',
    },
    // 42) Tipos de alimentos caseiros
    {
        text: '42) Quais os tipos de alimentos caseiros ofertados?',
        options: [
            'Resto de refeição',
            'Frango/carne/porco cozido ou frito',
            'Farelo de milho',
            'Outro',
        ],
    },
    // 42 sub) Outro alimento
    {
        text: '42a) Se outro alimento caseiro, qual?',
    },
    // 45) Frequência de alimentação
    {
        text: '45) Com qual frequência seu/sua cachorro/cachorra é alimentado(a)?',
        options: [
            'Oferecemos alimento uma vez ao dia',
            'Oferecemos alimento duas vezes ao dia',
            'Oferecemos alimento de três ou mais vezes ao dia',
            'Outros',
        ],
    },
    // 45 sub) Se outros
    {
        text: '45a) Se outros, especificar:',
    },
    // 46) Frequência troca de água
    {
        text: '46) A água oferecida ao cachorro/cadela é trocada/reposta com qual frequência?',
        options: [
            'Colocamos água nova quando ele bebe toda água',
            'Duas vezes ao dia, mesmo que ainda tenha água',
            'No mínimo três vezes ao dia',
        ],
    },
    // 47) Alguém de fora oferece alimentos?
    {
        text: '47) Mais alguém de fora oferece alimentos ao(à) seu/sua cachorro/cadela?',
        options: ['Não', 'Não sei', 'Sim'],
    },
    // 47 sub) Quem e o quê?
    {
        text: '47a) Se sim, quem e o que oferece?',
    },
    // 48) Cachorro fica solto?
    {
        text: '48) Seu cachorro fica solto?',
        options: [
            'Não, nunca',
            'Sim, apenas à noite',
            'Sim, durante dia e noite',
        ],
    },
    // 48 sub) Quais cães ficam soltos?
    {
        text: '48a) Se sim, quais cães?',
    },
    // 52) Cachorro corre atrás de bichos?
    {
        text: '52) Seu/sua cachorro/cadela corre atrás de bichos?',
        options: ['Não', 'Nunca vi', 'Sim'],
    },
    // 52 sub) O que faz quando vê?
    {
        text: '52a) Se sim, o que você faz quando vê?',
    },
    // 53) De quais animais o cachorro corre atrás?
    {
        text: '53) De quais animais o(s) seu(s) cachorro(s) corre(m) atrás?',
    },
    // 54) Quantas vezes viu o cachorro correr atrás de animais selvagens no último ano?
    {
        text: '54) No último ano, quantas vezes você viu o seu cachorro correr atrás de animais selvagens?',
    },
    // 56) Cachorro traz bichos caçados para casa?
    {
        text: '56) Seu/sua cachorro/cadela traz para casa bichos que caçou na rua?',
        options: ['Não', 'Sim'],
    },
    // 56 sub) Quais bichos?
    {
        text: '56a) Se sim, quais bichos?',
    },
    // 57) Quais bichos eles evitam ou têm medo?
    {
        text: '57) Quais bichos eles evitam ou têm medo?',
    },
    // 58) Quais bichos você vê com frequência na propriedade?
    {
        text: '58) Quais bichos você vê com frequência na sua propriedade?',
    },
    // 59) Vacina o cachorro?
    {
        text: '59) Você vacina seu/sua cachorro/cadela?',
        options: ['Sim', 'Não', 'Outro'],
    },
    // 59 sub) Se outro
    {
        text: '59a) Se outro, especificar:',
    },
    // 61) Gente que caça com cachorros na cidade?
    {
        text: '61) Você sabe se aqui na cidade tem gente que caça com cachorros?',
        options: ['Não', 'Sim'],
    },
    // 61 sub) O que viu/ouviu?
    {
        text: '61a) Se sim, o que você já viu ou ouviu?',
    },
];

// PERGUNTAS DO ANIMAL
// Perguntas: 17, 18, 19, 20, 22, 23, 25, 26, 27, 43, 44, 49, 50, 51, 55, 60

const animalQuestions: QuestionSeed[] = [
    // 17) Sexo do cachorro/cadela
    {
        text: '17) Cachorro/cadela - Sexo:',
        options: ['Macho', 'Fêmea'],
    },
    // 17 sub) Já teve cria?
    {
        text: '17a) Caso seja fêmea, já teve alguma cria?',
        options: ['Não', 'Sim'],
    },
    // 17 sub) Quantas crias?
    {
        text: '17b) Se sim, quantas crias?',
    },
    // 17 sub) Deu cria no último ano?
    {
        text: '17c) Ela deu cria no último ano?',
        options: ['Não', 'Sim'],
    },
    // 17 sub) Quantos filhotes?
    {
        text: '17d) Se sim, quantos filhotes?',
    },
    // 17 sub) O que fizeram com os filhotes?
    {
        text: '17e) Se sim, o que fizeram com os filhotes?',
    },
    // 18) Raça(s)
    {
        text: '18) Raça(s):',
    },
    // 19) Idade(s)
    {
        text: '19) Idade(s):',
    },
    // 20) Origem(ns)
    {
        text: '20) Origem(ns):',
    },
    // 22) O cão te acompanha quando sai de casa?
    {
        text: '22) O seu cão te acompanha ou tenta te acompanhar quando você sai da sua casa e/ou vai a algum lugar além da sua casa?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 23) Cachorro acompanha nas atividades rurais?
    {
        text: '23) Caso algum adulto trabalhe na área rural (cafezal, gado, etc), o cachorro o acompanha nas atividades diárias?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 25) Cão arisco ou medroso?
    {
        text: '25) Seu cão é arisco ou medroso?',
        options: ['Não', 'Sim'],
    },
    // 25 sub) De quem tem medo?
    {
        text: '25a) Se sim, de quem ele mais tem medo?',
    },
    // 26) Cachorro tem medo de alguém?
    {
        text: '26) Você percebe que seu cachorro tem medo de alguém?',
        options: [
            'Não, ele não tem medo',
            'Sim, tem medo de mim',
            'Sim, tem medo de outras pessoas',
            'Sim, tem medo de ambos',
        ],
    },
    // 26 sub) Por quê?
    {
        text: '26a) Se sim, por quê?',
    },
    // 27) O cão faz festa quando te vê?
    {
        text: '27) O seu cão "faz festa" quando te vê?',
        options: [
            'Com frequência',
            'De vez em quando',
            'Raramente',
            'Nunca',
        ],
    },
    // 43) Cão ingere carcaças ou restos de animais mortos?
    {
        text: '43) Seu cão ingere carcaças ou restos de animais mortos?',
        options: ['Sim', 'Não', 'Não sei'],
    },
    // 43 sub) Quais animais e origem da carcaça
    {
        text: '43a) Se sim, quais animais e qual a origem da carcaça (abatido em casa, encontrada na propriedade, etc)?',
    },
    // 44) O que o cão come com mais frequência?
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
    // 49) Onde dorme o cachorro/cadela?
    {
        text: '49) Onde dorme seu/sua cachorro/cadela?',
        options: [
            'Dentro de casa',
            'Em uma casinha do lado de fora da casa',
            'Em um pano/acolchoado em local coberto',
            'Outro',
        ],
    },
    // 49 sub) Se outro
    {
        text: '49a) Se outro, especificar:',
    },
    // 50) Cachorro passa muito tempo fora de casa?
    {
        text: '50) De vez em quando seu/sua cachorro/cadela passa muito tempo fora de casa?',
        options: ['Não', 'Sim'],
    },
    // 50 sub) Com que frequência?
    {
        text: '50a) Se sim, com que frequência sai?',
    },
    // 50 sub) Onde acha que fica?
    {
        text: '50b) Se sim, onde acha que ele(a) fica?',
    },
    // 51) Líder da matilha?
    {
        text: '51) Em caso de matilhas, você percebe se algum dos cães é o líder da matilha?',
        options: ['Não', 'Sim'],
    },
    // 51 sub) Qual?
    {
        text: '51a) Se sim, qual?',
    },
    // 51 sub) Comportamento
    {
        text: '51b) Que tipo de comportamento ele tem que te faz achar que ele é o líder?',
    },
    // 55) Já conseguiram matar algum animal?
    {
        text: '55) Eles já conseguiram matar algum animal?',
        options: ['Sim', 'Não'],
    },
    // 55 sub) Quais?
    {
        text: '55a) Se sim, quais?',
    },
    // 60) Quais cães e qual vacina?
    {
        text: '60) Quais vacinas já foram aplicadas?',
        options: [
            'Raiva',
            'Múltipla (parvovirose, cinomose etc)',
        ],
    },
    // 60 sub) Detalhar
    {
        text: '60a) Detalhar outras vacinas aplicadas:',
    },
];

// Função auxiliar para inserir perguntas e opções

async function seedTutorQuestions() {
    console.log('Limpando registros anteriores...');
    await prisma.tutorAnswerOption.deleteMany();
    await prisma.tutorQuestion.deleteMany();

    console.log('Inserindo perguntas do tutor (tutorQuestion)...');

    for (const q of tutorQuestions) {
        // Verifica se a pergunta já existe
        const existing = await prisma.tutorQuestion.findUnique({
            where: { text: q.text },
        });

        let questionId: number;

        if (existing) {
            questionId = existing.id;
            console.log(`Pergunta já existe: "${q.text}" (id: ${questionId})`);
        } else {
            const created = await prisma.tutorQuestion.create({
                data: { text: q.text },
            });
            questionId = created.id;
            console.log(`Pergunta criada: "${q.text}" (id: ${questionId})`);
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
                    console.log(`Opção criada: "${optionText}"`);
                } else {
                    console.log(`Opção já existe: "${optionText}"`);
                }
            }
        }
    }

    console.log(`Total de perguntas do tutor processadas: ${tutorQuestions.length}\n`);
}

async function seedAnimalQuestions() {
    console.log('Limpando registros anteriores...');
    await prisma.animalAnswerOption.deleteMany();
    await prisma.animalQuestion.deleteMany();

    console.log('Inserindo perguntas do animal (animalQuestion)...');

    for (const q of animalQuestions) {
        // Verifica se a pergunta já existe
        const existing = await prisma.animalQuestion.findUnique({
            where: { text: q.text },
        });

        let questionId: number;

        if (existing) {
            questionId = existing.id;
            console.log(`Pergunta já existe: "${q.text}" (id: ${questionId})`);
        } else {
            const created = await prisma.animalQuestion.create({
                data: { text: q.text },
            });
            questionId = created.id;
            console.log(`Pergunta criada: "${q.text}" (id: ${questionId})`);
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
                    console.log(`Opção criada: "${optionText}"`);
                } else {
                    console.log(`Opção já existe: "${optionText}"`);
                }
            }
        }
    }

    console.log(`Total de perguntas do animal processadas: ${animalQuestions.length}\n`);
}

// Execução principal

async function main() {
    console.log('SEED: Questionário de Entrevista');
    await seedTutorQuestions();
    await seedAnimalQuestions();
}

main()
    .catch((e) => {
        console.error('Erro durante o seed:', e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
