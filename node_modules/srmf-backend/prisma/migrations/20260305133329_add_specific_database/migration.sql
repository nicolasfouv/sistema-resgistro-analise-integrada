-- CreateTable
CREATE TABLE `animal_vivo` (
    `id` VARCHAR(191) NOT NULL,
    `id_especie` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `id_genero` VARCHAR(191) NOT NULL,
    `data_nascimento` DATETIME(3) NOT NULL,
    `ativo` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `especie` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_genero_animal` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rastreio_gps` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_vivo` VARCHAR(191) NOT NULL,
    `id_dispositivo_rastreio` VARCHAR(191) NOT NULL,
    `data_inicio` DATETIME(3) NOT NULL,
    `data_fim` DATETIME(3) NULL,
    `observacao` VARCHAR(191) NULL,
    `dias_monitorados` INTEGER NOT NULL,
    `pontos_localizacao` INTEGER NOT NULL,
    `area_vida` DOUBLE NOT NULL,
    `id_metodo_monitoramento` VARCHAR(191) NOT NULL,
    `link_planilha_bruta` VARCHAR(191) NULL,
    `link_planilha_editada` VARCHAR(191) NULL,

    UNIQUE INDEX `rastreio_gps_id_animal_vivo_key`(`id_animal_vivo`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `metodo_monitoramento` (
    `id` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dispositivo_rastreio` (
    `id` VARCHAR(191) NOT NULL,
    `marca` VARCHAR(191) NOT NULL,
    `numero_serie` VARCHAR(191) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrevista_animal` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_vivo` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `entrevista_animal_id_animal_vivo_key`(`id_animal_vivo`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `resposta_animal` (
    `id` VARCHAR(191) NOT NULL,
    `id_entrevista_animal` VARCHAR(191) NOT NULL,
    `id_pergunta_animal` VARCHAR(191) NOT NULL,
    `texto` VARCHAR(191) NULL,
    `quantidade` INTEGER NULL,
    `id_opcao_resposta_animal` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pergunta_animal` (
    `id` VARCHAR(191) NOT NULL,
    `pergunta` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `opcao_resposta_animal` (
    `id` VARCHAR(191) NOT NULL,
    `id_pergunta_animal` VARCHAR(191) NOT NULL,
    `resposta_possivel` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrevista_tutor` (
    `id` VARCHAR(191) NOT NULL,
    `id_tutor` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,

    UNIQUE INDEX `entrevista_tutor_id_tutor_key`(`id_tutor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tutor` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `id_genero` VARCHAR(191) NOT NULL,
    `data_nascimento` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_genero` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `resposta_tutor` (
    `id` VARCHAR(191) NOT NULL,
    `id_entrevista_tutor` VARCHAR(191) NOT NULL,
    `id_pergunta_tutor` VARCHAR(191) NOT NULL,
    `texto` VARCHAR(191) NULL,
    `quantidade` INTEGER NULL,
    `id_opcao_resposta_tutor` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `opcao_resposta_tutor` (
    `id` VARCHAR(191) NOT NULL,
    `id_pergunta_tutor` VARCHAR(191) NOT NULL,
    `resposta_possivel` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pergunta_tutor` (
    `id` VARCHAR(191) NOT NULL,
    `pergunta` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `castracao` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_vivo` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    UNIQUE INDEX `castracao_id_animal_vivo_key`(`id_animal_vivo`),
    UNIQUE INDEX `castracao_id_visita_veterinaria_key`(`id_visita_veterinaria`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `visita_veterinaria` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_vivo` VARCHAR(191) NOT NULL,
    `id_veterinario` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,
    `link_carteirinha` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `veterinario` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vacina` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `aplicacao_vacina` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_vivo` VARCHAR(191) NOT NULL,
    `id_vacina` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NULL,
    `data` DATETIME(3) NOT NULL,
    `id_tipo_vacina` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_tipo_vacina` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `exame` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_estado_geral` VARCHAR(191) NOT NULL,
    `id_interpretacao` VARCHAR(191) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    UNIQUE INDEX `exame_id_visita_veterinaria_key`(`id_visita_veterinaria`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_estado_geral` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_interpretacao` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `valor_exame` (
    `id` VARCHAR(191) NOT NULL,
    `id_exame` VARCHAR(191) NOT NULL,
    `id_tipo_exame` VARCHAR(191) NOT NULL,
    `valor` VARCHAR(191) NOT NULL,
    `id_interpretacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_interpretacao_valor_exame` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_exame` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_fezes` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `peso` DOUBLE NOT NULL,
    `id_tecnologia_processamento` VARCHAR(191) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    UNIQUE INDEX `analise_fezes_id_visita_veterinaria_key`(`id_visita_veterinaria`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tecnologia_processamento` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_ovo_cisto` (
    `id` VARCHAR(191) NOT NULL,
    `id_analise_fezes` VARCHAR(191) NOT NULL,
    `id_especie_ovo_cisto` VARCHAR(191) NOT NULL,
    `quantidade` INTEGER NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `especie_ovo_cisto` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_molecular` (
    `id` VARCHAR(191) NOT NULL,
    `id_analise_fezes` VARCHAR(191) NOT NULL,
    `id_especie_ovo_cisto` VARCHAR(191) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `exame_fisico` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_estado_geral` VARCHAR(191) NOT NULL,
    `FR` VARCHAR(191) NOT NULL,
    `FC` INTEGER NOT NULL,
    `temp_retal` DOUBLE NOT NULL,
    `id_mucosa` VARCHAR(191) NOT NULL,
    `TPC` INTEGER NOT NULL,
    `id_hidratacao` VARCHAR(191) NOT NULL,
    `peso` DOUBLE NOT NULL,
    `score` INTEGER NOT NULL,
    `observacao_coleta_sangue` VARCHAR(191) NULL,
    `observacao_exame_fisico` VARCHAR(191) NULL,
    `observacao_geral` VARCHAR(191) NULL,

    UNIQUE INDEX `exame_fisico_id_visita_veterinaria_key`(`id_visita_veterinaria`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_estado_geral_exame_fisico` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_mucosa` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_hidratacao` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medida_corporal_veterinario` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_tipo_medida_corporal` VARCHAR(191) NOT NULL,
    `valor` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_medida_corporal_veterinario` (
    `id` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `unidade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_medida_corporal_necropsia` (
    `id` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `unidade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_ectoparasito_veterinario` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_genero_ectoparasito` VARCHAR(191) NOT NULL,
    `id_especie_ectoparasito` VARCHAR(191) NOT NULL,
    `id_subespecie_ectoparasito` VARCHAR(191) NOT NULL,
    `quantidade_machos` INTEGER NOT NULL,
    `quantidade_femeas` INTEGER NOT NULL,
    `quantidade_ninfas` INTEGER NOT NULL,
    `quantidade_larvas` INTEGER NOT NULL,
    `quantidade_ovos` INTEGER NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `genero_ectoparasito` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `especie_ectoparasito` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_sorologica` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_amostra` VARCHAR(191) NOT NULL,
    `id_teste_sorologico` VARCHAR(191) NOT NULL,
    `id_agente_sorologico` VARCHAR(191) NOT NULL,
    `ponto_corte` VARCHAR(191) NOT NULL,
    `resultado` DOUBLE NOT NULL,
    `id_interpretacao` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_interpretacao_analise_sorologica` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `teste_sorologico` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agente_sorologico` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alocacao_amostra_veterinario` (
    `id` VARCHAR(191) NOT NULL,
    `id_visita_veterinaria` VARCHAR(191) NOT NULL,
    `id_tipo_amostra` VARCHAR(191) NOT NULL,
    `id_armazenamento` VARCHAR(191) NOT NULL,
    `id_status` VARCHAR(191) NOT NULL,
    `data_envio` DATETIME(3) NULL,
    `link_imagem` VARCHAR(191) NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_status_alocacao_amostra` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_amostra` (
    `id` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `armazem` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `animal_morto` (
    `id` VARCHAR(191) NOT NULL,
    `id_grupo_animal_morto` VARCHAR(191) NOT NULL,
    `id_especie` VARCHAR(191) NOT NULL,
    `id_origem_animal_morto` VARCHAR(191) NOT NULL,
    `id_status_animal_morto` VARCHAR(191) NOT NULL,
    `data_coleta` DATETIME(3) NOT NULL,
    `id_responsavel_coleta` VARCHAR(191) NOT NULL,
    `longitude_coleta` DOUBLE NOT NULL,
    `latitude_coleta` DOUBLE NOT NULL,
    `link_imagem` VARCHAR(191) NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `grupo_animal_morto` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_origem_animal_morto` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_status_animal_morto` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `responsavel_coleta` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `necropsia` (
    `id` VARCHAR(191) NOT NULL,
    `id_animal_morto` VARCHAR(191) NOT NULL,
    `data_realizacao` DATETIME(3) NOT NULL,
    `id_estado_corporal` VARCHAR(191) NOT NULL,
    `id_estado_clinico` VARCHAR(191) NOT NULL,
    `id_tutor` VARCHAR(191) NULL,
    `id_condicao_reprodutiva` VARCHAR(191) NOT NULL,
    `peso` DOUBLE NOT NULL,
    `id_faixa_etaria` VARCHAR(191) NOT NULL,
    `observacao` VARCHAR(191) NULL,

    UNIQUE INDEX `necropsia_id_animal_morto_key`(`id_animal_morto`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_estado_corporal` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_estado_clinico` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_condicao_reprodutiva` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_faixa_etaria` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medida_corporal_necropsia` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_tipo_medida_corporal` VARCHAR(191) NOT NULL,
    `valor` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_helminto` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_especie_helminto` VARCHAR(191) NOT NULL,
    `localizacao` VARCHAR(191) NOT NULL,
    `quantidade_machos` INTEGER NOT NULL,
    `quantidade_femeas` INTEGER NOT NULL,
    `quantidade_total` INTEGER NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `especie_helminto` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `analise_ectoparasito_necropsia` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_genero_ectoparasito` VARCHAR(191) NOT NULL,
    `id_especie_ectoparasito` VARCHAR(191) NOT NULL,
    `id_subespecie_ectoparasito` VARCHAR(191) NOT NULL,
    `quantidade_machos` INTEGER NOT NULL,
    `quantidade_femeas` INTEGER NOT NULL,
    `quantidade_ninfas` INTEGER NOT NULL,
    `quantidade_larvas` INTEGER NOT NULL,
    `quantidade_ovos` INTEGER NOT NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alocacao_amostra_necropsia` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_tipo_amostra` VARCHAR(191) NOT NULL,
    `id_armazenamento` VARCHAR(191) NOT NULL,
    `id_status` VARCHAR(191) NOT NULL,
    `data_envio` DATETIME(3) NULL,
    `link_imagem` VARCHAR(191) NULL,
    `observacao` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `resultado_cpcr` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_tipo_amostra` VARCHAR(191) NOT NULL,
    `data_realizacao` DATETIME(3) NOT NULL,
    `id_tipo_extracao` VARCHAR(191) NOT NULL,
    `id_gene_alvo` VARCHAR(191) NOT NULL,
    `primer` VARCHAR(191) NOT NULL,
    `pb` INTEGER NOT NULL,
    `id_agente_suspeito` VARCHAR(191) NOT NULL,
    `id_metodo_cpcr` VARCHAR(191) NOT NULL,
    `id_resultado_cpcr` VARCHAR(191) NOT NULL,
    `controle` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `resultado_qpcr` (
    `id` VARCHAR(191) NOT NULL,
    `id_necropsia` VARCHAR(191) NOT NULL,
    `id_tipo_amostra` VARCHAR(191) NOT NULL,
    `data_realizacao` DATETIME(3) NOT NULL,
    `id_gene_alvo` VARCHAR(191) NOT NULL,
    `id_agente_suspeito` VARCHAR(191) NOT NULL,
    `ct_medio` DOUBLE NOT NULL,
    `copias_estimadas` DOUBLE NOT NULL,
    `id_resultado_qpcr` VARCHAR(191) NOT NULL,
    `controle` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_extracao` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gene_alvo` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `agente_suspeito` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_metodo_cpcr` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_status_cpcr` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enum_status_qpcr` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `animal_vivo` ADD CONSTRAINT `animal_vivo_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_vivo` ADD CONSTRAINT `animal_vivo_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero_animal`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rastreio_gps` ADD CONSTRAINT `rastreio_gps_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rastreio_gps` ADD CONSTRAINT `rastreio_gps_id_dispositivo_rastreio_fkey` FOREIGN KEY (`id_dispositivo_rastreio`) REFERENCES `dispositivo_rastreio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rastreio_gps` ADD CONSTRAINT `rastreio_gps_id_metodo_monitoramento_fkey` FOREIGN KEY (`id_metodo_monitoramento`) REFERENCES `metodo_monitoramento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `entrevista_animal` ADD CONSTRAINT `entrevista_animal_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_animal` ADD CONSTRAINT `resposta_animal_id_entrevista_animal_fkey` FOREIGN KEY (`id_entrevista_animal`) REFERENCES `entrevista_animal`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_animal` ADD CONSTRAINT `resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_animal` ADD CONSTRAINT `resposta_animal_id_opcao_resposta_animal_fkey` FOREIGN KEY (`id_opcao_resposta_animal`) REFERENCES `opcao_resposta_animal`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `opcao_resposta_animal` ADD CONSTRAINT `opcao_resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `entrevista_tutor` ADD CONSTRAINT `entrevista_tutor_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tutor` ADD CONSTRAINT `tutor_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_tutor` ADD CONSTRAINT `resposta_tutor_id_entrevista_tutor_fkey` FOREIGN KEY (`id_entrevista_tutor`) REFERENCES `entrevista_tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_tutor` ADD CONSTRAINT `resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resposta_tutor` ADD CONSTRAINT `resposta_tutor_id_opcao_resposta_tutor_fkey` FOREIGN KEY (`id_opcao_resposta_tutor`) REFERENCES `opcao_resposta_tutor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `opcao_resposta_tutor` ADD CONSTRAINT `opcao_resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `castracao` ADD CONSTRAINT `castracao_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `castracao` ADD CONSTRAINT `castracao_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `visita_veterinaria` ADD CONSTRAINT `visita_veterinaria_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `visita_veterinaria` ADD CONSTRAINT `visita_veterinaria_id_veterinario_fkey` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aplicacao_vacina` ADD CONSTRAINT `aplicacao_vacina_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aplicacao_vacina` ADD CONSTRAINT `aplicacao_vacina_id_vacina_fkey` FOREIGN KEY (`id_vacina`) REFERENCES `vacina`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aplicacao_vacina` ADD CONSTRAINT `aplicacao_vacina_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aplicacao_vacina` ADD CONSTRAINT `aplicacao_vacina_id_tipo_vacina_fkey` FOREIGN KEY (`id_tipo_vacina`) REFERENCES `enum_tipo_vacina`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame` ADD CONSTRAINT `exame_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame` ADD CONSTRAINT `exame_id_estado_geral_fkey` FOREIGN KEY (`id_estado_geral`) REFERENCES `enum_estado_geral`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame` ADD CONSTRAINT `exame_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `valor_exame` ADD CONSTRAINT `valor_exame_id_exame_fkey` FOREIGN KEY (`id_exame`) REFERENCES `exame`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `valor_exame` ADD CONSTRAINT `valor_exame_id_tipo_exame_fkey` FOREIGN KEY (`id_tipo_exame`) REFERENCES `tipo_exame`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `valor_exame` ADD CONSTRAINT `valor_exame_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao_valor_exame`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_fezes` ADD CONSTRAINT `analise_fezes_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_fezes` ADD CONSTRAINT `analise_fezes_id_tecnologia_processamento_fkey` FOREIGN KEY (`id_tecnologia_processamento`) REFERENCES `tecnologia_processamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ovo_cisto` ADD CONSTRAINT `analise_ovo_cisto_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ovo_cisto` ADD CONSTRAINT `analise_ovo_cisto_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_molecular` ADD CONSTRAINT `analise_molecular_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_molecular` ADD CONSTRAINT `analise_molecular_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame_fisico` ADD CONSTRAINT `exame_fisico_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame_fisico` ADD CONSTRAINT `exame_fisico_id_estado_geral_fkey` FOREIGN KEY (`id_estado_geral`) REFERENCES `enum_estado_geral_exame_fisico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame_fisico` ADD CONSTRAINT `exame_fisico_id_mucosa_fkey` FOREIGN KEY (`id_mucosa`) REFERENCES `enum_mucosa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `exame_fisico` ADD CONSTRAINT `exame_fisico_id_hidratacao_fkey` FOREIGN KEY (`id_hidratacao`) REFERENCES `enum_hidratacao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `medida_corporal_veterinario` ADD CONSTRAINT `medida_corporal_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `medida_corporal_veterinario` ADD CONSTRAINT `medida_corporal_veterinario_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_veterinario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_veterinario` ADD CONSTRAINT `analise_ectoparasito_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_veterinario` ADD CONSTRAINT `analise_ectoparasito_veterinario_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_veterinario` ADD CONSTRAINT `analise_ectoparasito_veterinario_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_veterinario` ADD CONSTRAINT `analise_ectoparasito_veterinario_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_sorologica` ADD CONSTRAINT `analise_sorologica_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_sorologica` ADD CONSTRAINT `analise_sorologica_id_amostra_fkey` FOREIGN KEY (`id_amostra`) REFERENCES `alocacao_amostra_veterinario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_sorologica` ADD CONSTRAINT `analise_sorologica_id_teste_sorologico_fkey` FOREIGN KEY (`id_teste_sorologico`) REFERENCES `teste_sorologico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_sorologica` ADD CONSTRAINT `analise_sorologica_id_agente_sorologico_fkey` FOREIGN KEY (`id_agente_sorologico`) REFERENCES `agente_sorologico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_sorologica` ADD CONSTRAINT `analise_sorologica_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao_analise_sorologica`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_veterinario` ADD CONSTRAINT `alocacao_amostra_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_veterinario` ADD CONSTRAINT `alocacao_amostra_veterinario_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_veterinario` ADD CONSTRAINT `alocacao_amostra_veterinario_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_veterinario` ADD CONSTRAINT `alocacao_amostra_veterinario_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_morto` ADD CONSTRAINT `animal_morto_id_grupo_animal_morto_fkey` FOREIGN KEY (`id_grupo_animal_morto`) REFERENCES `grupo_animal_morto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_morto` ADD CONSTRAINT `animal_morto_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_morto` ADD CONSTRAINT `animal_morto_id_origem_animal_morto_fkey` FOREIGN KEY (`id_origem_animal_morto`) REFERENCES `enum_origem_animal_morto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_morto` ADD CONSTRAINT `animal_morto_id_status_animal_morto_fkey` FOREIGN KEY (`id_status_animal_morto`) REFERENCES `enum_status_animal_morto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `animal_morto` ADD CONSTRAINT `animal_morto_id_responsavel_coleta_fkey` FOREIGN KEY (`id_responsavel_coleta`) REFERENCES `responsavel_coleta`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_animal_morto_fkey` FOREIGN KEY (`id_animal_morto`) REFERENCES `animal_morto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_estado_corporal_fkey` FOREIGN KEY (`id_estado_corporal`) REFERENCES `enum_estado_corporal`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_estado_clinico_fkey` FOREIGN KEY (`id_estado_clinico`) REFERENCES `enum_estado_clinico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_condicao_reprodutiva_fkey` FOREIGN KEY (`id_condicao_reprodutiva`) REFERENCES `enum_condicao_reprodutiva`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `necropsia` ADD CONSTRAINT `necropsia_id_faixa_etaria_fkey` FOREIGN KEY (`id_faixa_etaria`) REFERENCES `enum_faixa_etaria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `medida_corporal_necropsia` ADD CONSTRAINT `medida_corporal_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `medida_corporal_necropsia` ADD CONSTRAINT `medida_corporal_necropsia_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_helminto` ADD CONSTRAINT `analise_helminto_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_helminto` ADD CONSTRAINT `analise_helminto_id_especie_helminto_fkey` FOREIGN KEY (`id_especie_helminto`) REFERENCES `especie_helminto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_necropsia` ADD CONSTRAINT `analise_ectoparasito_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_necropsia` ADD CONSTRAINT `analise_ectoparasito_necropsia_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_necropsia` ADD CONSTRAINT `analise_ectoparasito_necropsia_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `analise_ectoparasito_necropsia` ADD CONSTRAINT `analise_ectoparasito_necropsia_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_necropsia` ADD CONSTRAINT `alocacao_amostra_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_necropsia` ADD CONSTRAINT `alocacao_amostra_necropsia_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_necropsia` ADD CONSTRAINT `alocacao_amostra_necropsia_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alocacao_amostra_necropsia` ADD CONSTRAINT `alocacao_amostra_necropsia_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_tipo_extracao_fkey` FOREIGN KEY (`id_tipo_extracao`) REFERENCES `tipo_extracao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_metodo_cpcr_fkey` FOREIGN KEY (`id_metodo_cpcr`) REFERENCES `enum_metodo_cpcr`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_cpcr` ADD CONSTRAINT `resultado_cpcr_id_resultado_cpcr_fkey` FOREIGN KEY (`id_resultado_cpcr`) REFERENCES `enum_status_cpcr`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_qpcr` ADD CONSTRAINT `resultado_qpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_qpcr` ADD CONSTRAINT `resultado_qpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_qpcr` ADD CONSTRAINT `resultado_qpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_qpcr` ADD CONSTRAINT `resultado_qpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resultado_qpcr` ADD CONSTRAINT `resultado_qpcr_id_resultado_qpcr_fkey` FOREIGN KEY (`id_resultado_qpcr`) REFERENCES `enum_status_qpcr`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
