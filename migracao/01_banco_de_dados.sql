DROP DATABASE IF EXISTS `NOME_DO_BANCO`;
CREATE DATABASE IF NOT EXISTS `NOME_DO_BANCO`
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE `NOME_DO_BANCO`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
 
-- =============================================================================
-- 1) TABELAS DE APOIO SIMPLES (id + nome)
-- =============================================================================
 
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `agente_sorologico`  (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `agente_suspeito`    (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `armazem`            (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `especie`            (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `especie_ectoparasito` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `especie_helminto`   (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `especie_ovo_cisto`  (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `gene_alvo`          (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `genero_ectoparasito` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `grupo_animal_morto` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `medicamento`        (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `responsavel_coleta` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tecnologia_processamento` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `teste_sorologico`   (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tipo_extracao`      (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `vacina`             (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `veterinario`        (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
 
CREATE TABLE `localizacao_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localizacao_helminto_nome_key` (`nome`)
) ENGINE=InnoDB;
 
CREATE TABLE `codigo_sigla_animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_sigla_animal_morto_sigla_key` (`sigla`)
) ENGINE=InnoDB;
 
CREATE TABLE `codigo_sigla_animal_vivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_sigla_animal_vivo_sigla_key` (`sigla`)
) ENGINE=InnoDB;
 
CREATE TABLE `dispositivo_rastreio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(191) NOT NULL,
  `numero_serie` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `metodo_monitoramento` (`id` int NOT NULL AUTO_INCREMENT, `descricao` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tipo_amostra_cpcr`    (`id` int NOT NULL AUTO_INCREMENT, `descricao` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tipo_amostra_necropsia` (`id` int NOT NULL AUTO_INCREMENT, `descricao` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tipo_amostra_qpcr`    (`id` int NOT NULL AUTO_INCREMENT, `descricao` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `tipo_amostra_veterinaria` (`id` int NOT NULL AUTO_INCREMENT, `descricao` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
 
CREATE TABLE `tipo_medida_corporal_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) NOT NULL,
  `unidade` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `tipo_medida_corporal_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) NOT NULL,
  `unidade` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `pergunta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pergunta_animal_pergunta_key` (`pergunta`)
) ENGINE=InnoDB;
 
CREATE TABLE `pergunta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pergunta_tutor_pergunta_key` (`pergunta`)
) ENGINE=InnoDB;
 
-- Tabelas criadas nas migrações
CREATE TABLE `destino_amostra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB;
 
CREATE TABLE `destino_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB;
 
CREATE TABLE `enum_etapa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB;
 
-- =============================================================================
-- 2) ENUMS (id + nome)
-- =============================================================================
 
CREATE TABLE `enum_condicao_reprodutiva`  (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_estado_clinico`        (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_estado_corporal`       (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_estado_geral_exame_fisico` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_faixa_etaria`          (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_genero`                (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_genero_animal`         (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_hidratacao`            (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_interpretacao`         (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_interpretacao_analise_sorologica` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_metodo_cpcr`           (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_mucosa`                (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_origem_animal_morto`   (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_status_alocacao_amostra_necropsia`   (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_status_alocacao_amostra_veterinario` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_status_animal_morto`   (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_status_cpcr`           (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_status_qpcr`           (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_tipo_resultado_analise_sorologica` (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
CREATE TABLE `enum_tipo_vacina`           (`id` int NOT NULL AUTO_INCREMENT, `nome` varchar(191) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;
 
CREATE TABLE `enum_nivel_acesso` (
  `id` varchar(191) NOT NULL,
  `valor` int NOT NULL,
  `nome` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
-- =============================================================================
-- 3) USUÁRIOS, PERMISSÕES E FORMULÁRIOS
-- =============================================================================
 
CREATE TABLE `funcao` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `grupo` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_nome_key` (`nome`)
) ENGINE=InnoDB;
 
CREATE TABLE `usuario` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `senha` varchar(191) NOT NULL,
  `id_funcao` varchar(191) NOT NULL DEFAULT '2',
  `userPic` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_email_key` (`email`),
  CONSTRAINT `usuario_id_funcao_fkey` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `categoria` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  `icone_categoria` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_nome_key` (`nome`)
) ENGINE=InnoDB;
 
CREATE TABLE `sub_categoria` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  `id_categoria` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categoria_nome_key` (`nome`),
  CONSTRAINT `sub_categoria_id_categoria_fkey` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `formulario` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  `id_sub_categoria` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `formulario_id_sub_categoria_fkey` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `autorizacao_grupo` (
  `id` varchar(191) NOT NULL,
  `id_grupo` varchar(191) NOT NULL,
  `id_formulario` varchar(191) NOT NULL,
  `id_nivel_acesso` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `autorizacao_grupo_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_grupo_fkey` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `autorizacao_usuario` (
  `id` varchar(191) NOT NULL,
  `id_usuario` varchar(191) NOT NULL,
  `id_formulario` varchar(191) NOT NULL,
  `id_nivel_acesso` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `autorizacao_usuario_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `auditlog` (
  `id` varchar(191) NOT NULL,
  `id_usuario` varchar(191) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acao` varchar(191) NOT NULL,
  `id_formulario` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `auditlog_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `auditlog_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `changelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_auditlog` varchar(191) NOT NULL,
  `tabela` varchar(191) NOT NULL,
  `id_registro` varchar(191) NOT NULL,
  `tipo_acao` varchar(191) NOT NULL,
  `dados_antigos` json DEFAULT NULL,
  `dados_novos` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `changelog_id_auditlog_fkey` FOREIGN KEY (`id_auditlog`) REFERENCES `auditlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `solicitante` (
  `id` varchar(191) NOT NULL,
  `nome` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `senha` varchar(191) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensagem` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solicitante_email_key` (`email`)
) ENGINE=InnoDB;
 
CREATE TABLE `token_redefinicao_senha` (
  `id` varchar(191) NOT NULL,
  `id_usuario` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `expira_em` datetime NOT NULL,
  `utilizado` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_redefinicao_senha_token_key` (`token`),
  CONSTRAINT `token_redefinicao_senha_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
 
-- =============================================================================
-- 4) TUTORES, ANIMAIS VIVOS E ENTREVISTAS
-- =============================================================================
 
CREATE TABLE `tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) NOT NULL,
  `id_genero` int NOT NULL,
  `data_nascimento` datetime NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tutor_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `animal_vivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(191) NOT NULL,
  `id_especie` int NOT NULL,
  `nome` varchar(191) DEFAULT NULL,
  `id_genero` int NOT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `foto_animal` varchar(191) DEFAULT NULL,
  `link_carteirinha` varchar(191) DEFAULT NULL,
  `id_tutor` int DEFAULT NULL,
  `idade` tinyint(1) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `fora_da_amostragem` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `animal_vivo_codigo_key` (`codigo`),
  CONSTRAINT `animal_vivo_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_vivo_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_vivo_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `entrevista_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tutor` int NOT NULL,
  `data` datetime NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrevista_tutor_id_tutor_key` (`id_tutor`),
  CONSTRAINT `entrevista_tutor_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_entrevista_tutor_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `entrevista_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_entrevista_tutor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `entrevista_animal_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrevista_animal_id_entrevista_tutor_fkey` FOREIGN KEY (`id_entrevista_tutor`) REFERENCES `entrevista_tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `opcao_resposta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pergunta_animal` int NOT NULL,
  `resposta_possivel` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `opcao_resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `opcao_resposta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pergunta_tutor` int NOT NULL,
  `resposta_possivel` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `opcao_resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `resposta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrevista_animal` int NOT NULL,
  `id_pergunta_animal` int NOT NULL,
  `texto` varchar(191) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `id_opcao_resposta_animal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `resposta_animal_id_entrevista_animal_fkey` FOREIGN KEY (`id_entrevista_animal`) REFERENCES `entrevista_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resposta_animal_id_opcao_resposta_animal_fkey` FOREIGN KEY (`id_opcao_resposta_animal`) REFERENCES `opcao_resposta_animal` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `resposta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrevista_tutor` int NOT NULL,
  `id_pergunta_tutor` int NOT NULL,
  `texto` varchar(191) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `id_opcao_resposta_tutor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `resposta_tutor_id_entrevista_tutor_fkey` FOREIGN KEY (`id_entrevista_tutor`) REFERENCES `entrevista_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resposta_tutor_id_opcao_resposta_tutor_fkey` FOREIGN KEY (`id_opcao_resposta_tutor`) REFERENCES `opcao_resposta_tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
-- =============================================================================
-- 5) RASTREIO GPS
-- =============================================================================
 
CREATE TABLE `rastreio_gps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_dispositivo_rastreio` int NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `dias_monitorados` int NOT NULL,
  `pontos_localizacao` int NOT NULL,
  `area_vida` double NOT NULL,
  `id_metodo_monitoramento` int NOT NULL,
  `link_planilha_bruta` varchar(191) DEFAULT NULL,
  `link_planilha_editada` varchar(191) DEFAULT NULL,
  `data_atualizacao_planilha_bruta` datetime DEFAULT NULL,
  `data_atualizacao_planilha_editada` datetime DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  `id_etapa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rastreio_gps_id_animal_vivo_key` (`id_animal_vivo`),
  CONSTRAINT `rastreio_gps_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rastreio_gps_id_dispositivo_rastreio_fkey` FOREIGN KEY (`id_dispositivo_rastreio`) REFERENCES `dispositivo_rastreio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rastreio_gps_id_metodo_monitoramento_fkey` FOREIGN KEY (`id_metodo_monitoramento`) REFERENCES `metodo_monitoramento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rastreio_gps_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`),
  CONSTRAINT `fk_rastreio_gps_etapa` FOREIGN KEY (`id_etapa`) REFERENCES `enum_etapa` (`id`)
) ENGINE=InnoDB;
 
-- =============================================================================
-- 6) VISITA VETERINÁRIA E DERIVADOS
-- =============================================================================
 
CREATE TABLE `visita_veterinaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_responsavel` int NOT NULL,
  `data` datetime NOT NULL,
  `foto_animal` varchar(191) DEFAULT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visita_veterinaria_id_animal_vivo_data_key` (`id_animal_vivo`,`data`),
  CONSTRAINT `visita_veterinaria_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `visita_veterinaria_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `medida_corporal_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_tipo_medida_corporal` int NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medida_corporal_veterinario_id_visita_veterinaria_id_tipo_me_key` (`id_visita_veterinaria`,`id_tipo_medida_corporal`),
  CONSTRAINT `medida_corporal_veterinario_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medida_corporal_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `exame_fisico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_estado_geral` int NOT NULL,
  `FR` varchar(191) NOT NULL,
  `FC` int NOT NULL,
  `temp_retal` double NOT NULL,
  `id_mucosa` int NOT NULL,
  `TPC` int NOT NULL,
  `id_hidratacao` int NOT NULL,
  `peso` double NOT NULL,
  `score` int NOT NULL,
  `observacao_coleta_sangue` varchar(191) DEFAULT NULL,
  `observacao_exame_fisico` varchar(191) DEFAULT NULL,
  `observacao_geral` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exame_fisico_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `exame_fisico_id_estado_geral_fkey` FOREIGN KEY (`id_estado_geral`) REFERENCES `enum_estado_geral_exame_fisico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_hidratacao_fkey` FOREIGN KEY (`id_hidratacao`) REFERENCES `enum_hidratacao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_mucosa_fkey` FOREIGN KEY (`id_mucosa`) REFERENCES `enum_mucosa` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_exame_fisico_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `resultado_exame` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `eritrocitos` double NOT NULL,
  `hemoglobina` double NOT NULL,
  `hematocrito` double NOT NULL,
  `vcm` double NOT NULL,
  `hcm` double NOT NULL,
  `chcm` double NOT NULL,
  `plaquetas` double NOT NULL,
  `leucocitos` double NOT NULL,
  `bastonetes` double NOT NULL,
  `segmentados_percentual` double NOT NULL,
  `linfocitos_percentual` double NOT NULL,
  `monocitos_percentual` double NOT NULL,
  `eosinofilos_percentual` double NOT NULL,
  `basofilos_percentual` double NOT NULL,
  `alt` double NOT NULL,
  `creatinina` double NOT NULL,
  `fosfatase_alcalina` double NOT NULL,
  `proteina_total` double NOT NULL,
  `ureia` double NOT NULL,
  `id_interpretacao` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_exame_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `resultado_exame_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_exame_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_resultado_exame_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_sorologica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_teste_sorologico` int NOT NULL,
  `id_agente_sorologico` int NOT NULL,
  `resultado` double NOT NULL,
  `id_interpretacao` int NOT NULL,
  `id_tipo_resultado` int NOT NULL,
  `simbolo_ponto_corte` varchar(191) NOT NULL,
  `valor_ponto_corte` varchar(191) NOT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_sorologica_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `analise_sorologica_id_agente_sorologico_fkey` FOREIGN KEY (`id_agente_sorologico`) REFERENCES `agente_sorologico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao_analise_sorologica` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_teste_sorologico_fkey` FOREIGN KEY (`id_teste_sorologico`) REFERENCES `teste_sorologico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_tipo_resultado_fkey` FOREIGN KEY (`id_tipo_resultado`) REFERENCES `enum_tipo_resultado_analise_sorologica` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_sorologica_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_fezes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `peso` double NOT NULL,
  `id_tecnologia_processamento` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analise_fezes_id_visita_veterinaria_idx` (`id_visita_veterinaria`),
  CONSTRAINT `analise_fezes_id_tecnologia_processamento_fkey` FOREIGN KEY (`id_tecnologia_processamento`) REFERENCES `tecnologia_processamento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_fezes_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_fezes_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_ovo_cisto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analise_fezes` int NOT NULL,
  `id_especie_ovo_cisto` int NOT NULL,
  `quantidade` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ovo_cisto_id_analise_fezes_id_especie_ovo_cisto_key` (`id_analise_fezes`,`id_especie_ovo_cisto`),
  CONSTRAINT `analise_ovo_cisto_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ovo_cisto_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_ovo_cisto_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_molecular` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analise_fezes` int NOT NULL,
  `id_especie_ovo_cisto` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_molecular_id_analise_fezes_id_especie_ovo_cisto_key` (`id_analise_fezes`,`id_especie_ovo_cisto`),
  CONSTRAINT `analise_molecular_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_molecular_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_molecular_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_ectoparasito_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_genero_ectoparasito` int NOT NULL,
  `id_especie_ectoparasito` int NOT NULL,
  `id_subespecie_ectoparasito` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_ninfas` int NOT NULL,
  `quantidade_larvas` int NOT NULL,
  `quantidade_ovos` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ectoparasito_veterinario_id_visita_veterinaria_id_ge_key` (`id_visita_veterinaria`,`id_genero_ectoparasito`,`id_especie_ectoparasito`,`id_subespecie_ectoparasito`),
  CONSTRAINT `analise_ectoparasito_veterinario_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_ectoparasito_vet_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `alocacao_amostra_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `id_armazenamento` int NOT NULL,
  `id_status` int NOT NULL,
  `link_imagem` varchar(191) DEFAULT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alocacao_amostra_veterinario_id_visita_veterinaria_id_tipo_a_key` (`id_visita_veterinaria`,`id_tipo_amostra`),
  CONSTRAINT `alocacao_amostra_veterinario_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
-- ATENÇÃO: o unique original era (alocacao, armazenamento). Com a troca de
-- armazenamento por destino, o equivalente é (alocacao, destino).
CREATE TABLE `envio_amostra_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alocacao_amostra_veterinario` int NOT NULL,
  `id_status` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_envio` datetime NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_destino_amostra` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `envio_amostra_vet_alocacao_destino_key` (`id_alocacao_amostra_veterinario`,`id_destino_amostra`),
  CONSTRAINT `envio_amostra_veterinario_id_alocacao_amostra_veterinario_fkey` FOREIGN KEY (`id_alocacao_amostra_veterinario`) REFERENCES `alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_veterinario_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_veterinario_id_destino_fkey` FOREIGN KEY (`id_destino_amostra`) REFERENCES `destino_amostra` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `aplicacao_vacina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_vacina` int NOT NULL,
  `id_visita_veterinaria` int DEFAULT NULL,
  `data` datetime NOT NULL,
  `id_tipo_vacina` int DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `aplicacao_vacina_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_tipo_vacina_fkey` FOREIGN KEY (`id_tipo_vacina`) REFERENCES `enum_tipo_vacina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_vacina_fkey` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_aplicacao_vacina_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `castracao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_visita_veterinaria` int DEFAULT NULL,
  `data` datetime NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `castracao_id_animal_vivo_key` (`id_animal_vivo`),
  UNIQUE KEY `castracao_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `castracao_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `castracao_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_castracao_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `vermifugacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_responsavel` int NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `id_medicamento` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_visita_veterinaria` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vermifugacao_id_animal_vivo_key` (`id_animal_vivo`),
  UNIQUE KEY `vermifugacao_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `vermifugacao_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vermifugacao_id_responsavel_fkey` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vermifugacao_id_medicamento_fkey` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vermifugacao_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
-- =============================================================================
-- 7) ANIMAIS MORTOS E NECRÓPSIA
-- =============================================================================
 
CREATE TABLE `animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(191) NOT NULL,
  `id_grupo_animal_morto` int NOT NULL,
  `id_especie` int NOT NULL,
  `id_origem_animal_morto` int NOT NULL,
  `id_status_animal_morto` int NOT NULL,
  `data_coleta` datetime NOT NULL,
  `id_responsavel_coleta` int NOT NULL,
  `longitude_coleta` double NOT NULL,
  `latitude_coleta` double NOT NULL,
  `link_imagem` varchar(191) DEFAULT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `animal_morto_codigo_key` (`codigo`),
  CONSTRAINT `animal_morto_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_grupo_animal_morto_fkey` FOREIGN KEY (`id_grupo_animal_morto`) REFERENCES `grupo_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_origem_animal_morto_fkey` FOREIGN KEY (`id_origem_animal_morto`) REFERENCES `enum_origem_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_responsavel_coleta_fkey` FOREIGN KEY (`id_responsavel_coleta`) REFERENCES `responsavel_coleta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_status_animal_morto_fkey` FOREIGN KEY (`id_status_animal_morto`) REFERENCES `enum_status_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_morto` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_estado_corporal` int NOT NULL,
  `id_estado_clinico` int NOT NULL,
  `id_tutor` int DEFAULT NULL,
  `id_condicao_reprodutiva` int NOT NULL,
  `peso` double NOT NULL,
  `id_faixa_etaria` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_genero_identificado` int NOT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `necropsia_id_animal_morto_key` (`id_animal_morto`),
  CONSTRAINT `necropsia_id_animal_morto_fkey` FOREIGN KEY (`id_animal_morto`) REFERENCES `animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_condicao_reprodutiva_fkey` FOREIGN KEY (`id_condicao_reprodutiva`) REFERENCES `enum_condicao_reprodutiva` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_estado_clinico_fkey` FOREIGN KEY (`id_estado_clinico`) REFERENCES `enum_estado_clinico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_estado_corporal_fkey` FOREIGN KEY (`id_estado_corporal`) REFERENCES `enum_estado_corporal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_faixa_etaria_fkey` FOREIGN KEY (`id_faixa_etaria`) REFERENCES `enum_faixa_etaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_genero_identificado_fkey` FOREIGN KEY (`id_genero_identificado`) REFERENCES `enum_genero_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_necropsia_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `medida_corporal_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_medida_corporal` int NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medida_corporal_necropsia_id_necropsia_id_tipo_medida_corpor_key` (`id_necropsia`,`id_tipo_medida_corporal`),
  CONSTRAINT `medida_corporal_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medida_corporal_necropsia_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `alocacao_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `id_armazenamento` int NOT NULL,
  `id_status` int NOT NULL,
  `link_imagem` varchar(191) DEFAULT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alocacao_amostra_necropsia_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  CONSTRAINT `alocacao_amostra_necropsia_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
-- ATENÇÃO: mesmo ajuste do envio veterinário: unique (alocacao, destino).
CREATE TABLE `envio_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alocacao_amostra_necropsia` int NOT NULL,
  `id_status` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_envio` datetime NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_destino_amostra` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `envio_amostra_nec_alocacao_destino_key` (`id_alocacao_amostra_necropsia`,`id_destino_amostra`),
  CONSTRAINT `envio_amostra_necropsia_id_alocacao_amostra_necropsia_fkey` FOREIGN KEY (`id_alocacao_amostra_necropsia`) REFERENCES `alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_necropsia_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_necropsia_id_destino_fkey` FOREIGN KEY (`id_destino_amostra`) REFERENCES `destino_amostra_necropsia` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `analise_ectoparasito_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_genero_ectoparasito` int NOT NULL,
  `id_especie_ectoparasito` int NOT NULL,
  `id_subespecie_ectoparasito` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_ninfas` int NOT NULL,
  `quantidade_larvas` int NOT NULL,
  `quantidade_ovos` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ectoparasito_necropsia_id_necropsia_id_genero_ectopa_key` (`id_necropsia`,`id_genero_ectoparasito`,`id_especie_ectoparasito`,`id_subespecie_ectoparasito`),
  CONSTRAINT `analise_ectoparasito_necropsia_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_ectoparasito_necropsia_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
-- A localização saiu de analise_helminto e passou para alocacao_helminto (N:N)
CREATE TABLE `analise_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_especie_helminto` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_total` int NOT NULL,
  `observacao` varchar(191) DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_helminto_id_necropsia_id_especie_helminto_key` (`id_necropsia`,`id_especie_helminto`),
  CONSTRAINT `analise_helminto_id_especie_helminto_fkey` FOREIGN KEY (`id_especie_helminto`) REFERENCES `especie_helminto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_helminto_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_analise_helminto_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `alocacao_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analise_helminto` int NOT NULL,
  `id_localizacao` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alocacao_helminto_id_analise_helminto_id_localizacao_key` (`id_analise_helminto`,`id_localizacao`),
  CONSTRAINT `alocacao_helminto_id_analise_helminto_fkey` FOREIGN KEY (`id_analise_helminto`) REFERENCES `analise_helminto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_helminto_id_localizacao_fkey` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao_helminto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE `resultado_cpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_tipo_extracao` int NOT NULL,
  `id_gene_alvo` int NOT NULL,
  `primer` varchar(191) NOT NULL,
  `pb` int NOT NULL,
  `id_agente_suspeito` int NOT NULL,
  `id_metodo_cpcr` int NOT NULL,
  `id_resultado_cpcr` int NOT NULL,
  `controle` varchar(191) NOT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_cpcr_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  CONSTRAINT `resultado_cpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_metodo_cpcr_fkey` FOREIGN KEY (`id_metodo_cpcr`) REFERENCES `enum_metodo_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_resultado_cpcr_fkey` FOREIGN KEY (`id_resultado_cpcr`) REFERENCES `enum_status_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_tipo_extracao_fkey` FOREIGN KEY (`id_tipo_extracao`) REFERENCES `tipo_extracao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_resultado_cpcr_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
CREATE TABLE `resultado_qpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_gene_alvo` int NOT NULL,
  `id_agente_suspeito` int NOT NULL,
  `ct_medio` double NOT NULL,
  `copias_estimadas` double NOT NULL,
  `id_resultado_qpcr` int NOT NULL,
  `controle` varchar(191) NOT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_qpcr_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  CONSTRAINT `resultado_qpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_resultado_qpcr_fkey` FOREIGN KEY (`id_resultado_qpcr`) REFERENCES `enum_status_qpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_qpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_resultado_qpcr_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`)
) ENGINE=InnoDB;
 
SET FOREIGN_KEY_CHECKS = 1;
 
-- =============================================================================
-- 8) DADOS INICIAIS
-- =============================================================================
 
-- Controle do Prisma (mantido como no dump; remova se não usar `prisma migrate`)
INSERT INTO `_prisma_migrations` VALUES
('36f92a31-9af7-4060-b73f-0d09e4b9937b','e6dd744191823d5b7335818807b486d4428c63675ec483556a17074f895f1b03','2026-03-05 13:21:53.570','20260305132136_system_template_structure',NULL,NULL,'2026-03-05 13:21:36.792',1),
('4589c10a-ea15-4404-9137-63e0db146f08','9c99d9b3651b8a43375a3a86849dee8cd866a75b8e7aa679df9858e0e4ac788a','2026-03-06 12:18:05.727','20260306121804_fix_card_link_is_optional',NULL,NULL,'2026-03-06 12:18:04.492',1),
('bb899775-977d-43f3-bc55-48726c2659b7','dd7300f969f49ee55a6686a08cbf89b5870595482e8764db1b150125acc1fa74','2026-03-05 13:35:50.684','20260305133329_add_specific_database',NULL,NULL,'2026-03-05 13:33:29.953',1);
 
-- Níveis de acesso
INSERT INTO `enum_nivel_acesso` VALUES
('edit',2,'Editar'),
('edit_unrestricted',3,'Editar sem restrições'),
('read',1,'Ler');
 
-- Funções
INSERT INTO `funcao` VALUES ('0','owner'),('1','admin'),('2','common');
 
-- Grupos
INSERT INTO `grupo` VALUES
('entr','Entrevistador'),
('leg','Legista'),
('pesqecto','Pesquisador de Ectoparasitos'),
('pesqfez','Pesquisador de Fezes'),
('pesqhelm','Pesquisador de Helmintos'),
('pesqsor','Pesquisador de Sorológico'),
('vet','Veterinário');
 
-- Usuários (ATENÇÃO: contas de exemplo; troque as senhas antes de usar em produção)
INSERT INTO `usuario` VALUES
('09af1365-644c-4dd7-8a4b-f00b57024c95','Usuário Super Admin Exemplo','superadmin@exemplo.com','$2b$10$.OBvQt/OnVzFkMrrZ37/BeCrIiqsn93Ww04pxiwZKfCVyE4dHI/o2','0',NULL),
('5d98ce9c-07fa-4046-b40e-54ff4c733590','Usuário Comum Exemplo','comum@exemplo.com','$2b$10$22PRwChwS218eAJNzkfrWOkwzqwSa3fantASuJoBCkKD7wzN/jqtq','2',NULL),
('84ca85ea-1347-4b64-9525-b59a12aaee56','Usuário Admin Exemplo','admin@exemplo.com','$2b$10$wBU39Gj69jp2Jktjr6o2iuXzcNCn9EDdpkcQKq8Nms2UaMlUlXUpy','1',NULL);
 
-- Categorias, subcategorias e formulários
INSERT INTO `categoria` VALUES
('0_animaisvivos','Animais Vivos','https://www.svgrepo.com/show/295893/pet-house-kennel.svg'),
('1_animaismortos','Animais Mortos','https://www.svgrepo.com/show/493629/warning-triangle.svg'),
('2_cadastrosbasicos','Cadastros Básicos','https://www.svgrepo.com/show/145158/form.svg');
 
INSERT INTO `sub_categoria` VALUES
('animais','0_Animais','0_animaisvivos'),
('animaisatropelados','0_Animais Atropelados','1_animaismortos'),
('entrevistas','1_Entrevistas','0_animaisvivos'),
('exameseanalises','4_Exames e Análises','0_animaisvivos'),
('geral','0_Geral','2_cadastrosbasicos'),
('necropsias','1_Necrópsias','1_animaismortos'),
('rastreiodegps','2_Rastreio de GPS','0_animaisvivos'),
('resultadoseanalises','2_Resultados e Análises','1_animaismortos'),
('veterinario','3_Veterinário','0_animaisvivos');
 
INSERT INTO `formulario` VALUES
('amostras-am','Amostra','necropsias'),
('amostras-av','Amostra','veterinario'),
('analiseectoparasitos-am','Análise de Ectoparasitos','resultadoseanalises'),
('analiseectoparasitos-av','Ectoparasitos','exameseanalises'),
('analisefezes','Fezes','exameseanalises'),
('analisehelmintos','Análise de Helmintos','resultadoseanalises'),
('analisemolecular','Molecular','exameseanalises'),
('analiseovocistos','Ovos/Cistos','exameseanalises'),
('animal-am','Animal','animaisatropelados'),
('animal-av','Animal','animais'),
('cadastrobasico-am','Animais Mortos','geral'),
('cadastrobasico-av','Animais Vivos','geral'),
('castracao','Castração','animais'),
('entrevista','Entrevista','entrevistas'),
('examefisico','Exame Físico','veterinario'),
('necropsia','Necrópsia','necropsias'),
('rastreiogps','Rastreio de GPS','rastreiodegps'),
('resultadoexame-am','QPCR e CPCR','resultadoseanalises'),
('resultadoexame-av','Hemograma/Bioquímico','exameseanalises'),
('resultadosorologico','Sorologia','exameseanalises'),
('tutor','Tutor','entrevistas'),
('vacina','Vacina','veterinario'),
('vermifugacao','Vermifugação','animais'),
('visitaveterinaria','Visita Veterinária','veterinario');
 
-- Permissões por grupo
INSERT INTO `autorizacao_grupo` VALUES
('001','entr','analiseectoparasitos-am','read'),('002','entr','analiseectoparasitos-av','read'),('003','entr','analisefezes','read'),('004','entr','analisehelmintos','read'),('005','entr','analisemolecular','read'),('006','entr','analiseovocistos','read'),('007','entr','animal-am','read'),('008','entr','animal-av','edit'),('009','entr','entrevista','edit'),('010','entr','cadastrobasico-av','edit'),('011','entr','necropsia','read'),('012','entr','rastreiogps','edit'),('013','entr','resultadoexame-am','read'),('014','entr','resultadoexame-av','read'),('015','entr','resultadosorologico','read'),('016','entr','tutor','edit'),('017','entr','vacina','read'),('018','entr','visitaveterinaria','read'),('019','entr','amostras-av','read'),('020','entr','amostras-am','read'),('021','entr','examefisico','read'),
('101','leg','analiseectoparasitos-am','read'),('102','leg','analiseectoparasitos-av','read'),('103','leg','analisefezes','read'),('104','leg','analisehelmintos','edit'),('105','leg','analisemolecular','read'),('106','leg','analiseovocistos','read'),('107','leg','animal-am','edit'),('108','leg','animal-av','read'),('109','leg','entrevista','read'),('110','leg','cadastrobasico-av','edit'),('111','leg','necropsia','edit'),('112','leg','rastreiogps','read'),('113','leg','resultadoexame-am','read'),('114','leg','resultadoexame-av','read'),('115','leg','resultadosorologico','read'),('116','leg','tutor','read'),('117','leg','vacina','read'),('118','leg','visitaveterinaria','read'),('119','leg','amostras-av','read'),('120','leg','amostras-am','read'),('121','leg','examefisico','read'),
('201','pesqecto','analiseectoparasitos-am','edit'),('202','pesqecto','analiseectoparasitos-av','edit'),('203','pesqecto','analisefezes','read'),('204','pesqecto','analisehelmintos','read'),('205','pesqecto','analisemolecular','read'),('206','pesqecto','analiseovocistos','read'),('207','pesqecto','animal-am','read'),('208','pesqecto','animal-av','read'),('209','pesqecto','entrevista','read'),('210','pesqecto','cadastrobasico-av','read'),('211','pesqecto','necropsia','read'),('212','pesqecto','rastreiogps','read'),('213','pesqecto','resultadoexame-am','read'),('214','pesqecto','resultadoexame-av','read'),('215','pesqecto','resultadosorologico','read'),('216','pesqecto','tutor','read'),('217','pesqecto','vacina','read'),('218','pesqecto','visitaveterinaria','read'),('219','pesqecto','amostras-av','read'),('220','pesqecto','amostras-am','read'),('221','pesqecto','examefisico','read'),
('301','pesqfez','analiseectoparasitos-am','read'),('302','pesqfez','analiseectoparasitos-av','read'),('303','pesqfez','analisefezes','edit'),('304','pesqfez','analisehelmintos','read'),('305','pesqfez','analisemolecular','edit'),('306','pesqfez','analiseovocistos','edit'),('307','pesqfez','animal-am','read'),('308','pesqfez','animal-av','read'),('309','pesqfez','entrevista','read'),('310','pesqfez','cadastrobasico-av','read'),('311','pesqfez','necropsia','read'),('312','pesqfez','rastreiogps','read'),('313','pesqfez','resultadoexame-am','read'),('314','pesqfez','resultadoexame-av','read'),('315','pesqfez','resultadosorologico','read'),('316','pesqfez','tutor','read'),('317','pesqfez','vacina','read'),('318','pesqfez','visitaveterinaria','read'),('319','pesqfez','amostras-av','read'),('320','pesqfez','amostras-am','read'),('321','pesqfez','examefisico','read'),
('401','pesqhelm','analiseectoparasitos-am','read'),('402','pesqhelm','analiseectoparasitos-av','read'),('403','pesqhelm','analisefezes','edit'),('404','pesqhelm','analisehelmintos','edit'),('405','pesqhelm','analisemolecular','read'),('406','pesqhelm','analiseovocistos','edit'),('407','pesqhelm','animal-am','read'),('408','pesqhelm','animal-av','read'),('409','pesqhelm','entrevista','read'),('410','pesqhelm','cadastrobasico-av','read'),('411','pesqhelm','necropsia','read'),('412','pesqhelm','rastreiogps','read'),('413','pesqhelm','resultadoexame-am','read'),('414','pesqhelm','resultadoexame-av','read'),('415','pesqhelm','resultadosorologico','read'),('416','pesqhelm','tutor','read'),('417','pesqhelm','vacina','read'),('418','pesqhelm','visitaveterinaria','read'),('419','pesqhelm','amostras-av','read'),('420','pesqhelm','amostras-am','read'),('421','pesqhelm','examefisico','read'),
('501','pesqsor','analiseectoparasitos-am','read'),('502','pesqsor','analiseectoparasitos-av','read'),('503','pesqsor','analisefezes','read'),('504','pesqsor','analisehelmintos','read'),('505','pesqsor','analisemolecular','read'),('506','pesqsor','analiseovocistos','read'),('507','pesqsor','animal-am','read'),('508','pesqsor','animal-av','read'),('509','pesqsor','entrevista','read'),('510','pesqsor','cadastrobasico-av','read'),('511','pesqsor','necropsia','read'),('512','pesqsor','rastreiogps','read'),('513','pesqsor','resultadoexame-am','edit'),('514','pesqsor','resultadoexame-av','edit'),('515','pesqsor','resultadosorologico','edit'),('516','pesqsor','tutor','read'),('517','pesqsor','vacina','read'),('518','pesqsor','visitaveterinaria','read'),('519','pesqsor','amostras-av','read'),('520','pesqsor','amostras-am','read'),('521','pesqsor','examefisico','read'),
('601','vet','analiseectoparasitos-am','read'),('602','vet','analiseectoparasitos-av','read'),('603','vet','analisefezes','edit'),('604','vet','analisehelmintos','read'),('605','vet','analisemolecular','edit'),('606','vet','analiseovocistos','edit'),('607','vet','animal-am','read'),('608','vet','animal-av','edit'),('609','vet','entrevista','read'),('610','vet','cadastrobasico-av','edit'),('611','vet','necropsia','read'),('612','vet','rastreiogps','read'),('613','vet','resultadoexame-am','read'),('614','vet','resultadoexame-av','read'),('615','vet','resultadosorologico','read'),('616','vet','tutor','edit'),('617','vet','vacina','edit'),('618','vet','visitaveterinaria','edit'),('619','vet','amostras-av','edit'),('620','vet','amostras-am','read'),('621','vet','examefisico','edit');
 
-- Permissões individuais
INSERT INTO `autorizacao_usuario` VALUES
('3083c04b-e5e2-4344-ab18-292699ead1dc','5d98ce9c-07fa-4046-b40e-54ff4c733590','cadastrobasico-av','read'),
('6dadaf6b-c1e6-453e-96da-22de05145ba5','5d98ce9c-07fa-4046-b40e-54ff4c733590','visitaveterinaria','edit'),
('ce7c791f-95cb-4a9f-bf16-62aeb82c5061','5d98ce9c-07fa-4046-b40e-54ff4c733590','amostras-av','read'),
('d62682df-8be2-497e-b979-e4565a7ef0d6','5d98ce9c-07fa-4046-b40e-54ff4c733590','cadastrobasico-am','read'),
('e76db212-b097-453f-912f-34b558d74eca','5d98ce9c-07fa-4046-b40e-54ff4c733590','examefisico','read');
 
-- Tabelas de apoio criadas nas migrações
INSERT INTO `destino_amostra` (`nome`) VALUES
('Teste sorológico'),('Leishmania'),('Rosangela'),('Reserva'),('Teste sorológico + Reserva');
 
INSERT INTO `destino_amostra_necropsia` (`nome`) VALUES
('Teste sorológico'),('Leishmania'),('Rosangela'),('Reserva'),('Teste sorológico + Reserva');
 
INSERT INTO `enum_etapa` (`nome`) VALUES
('Controle'),('Castrado'),('Vermifugado'),('Castrado + Vermifugado');

INSERT INTO `teste`.`enum_genero` (`id`, `nome`) VALUES ('1', 'Fêmea');
INSERT INTO `teste`.`enum_genero` (`id`, `nome`) VALUES ('2', 'Macho');
 
-- =============================================================================
-- 9) CONFERÊNCIA RÁPIDA (opcional)
-- =============================================================================
-- SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'srf';
-- SELECT 'usuario' t, COUNT(*) n FROM usuario UNION ALL
-- SELECT 'formulario', COUNT(*) FROM formulario UNION ALL
-- SELECT 'autorizacao_grupo', COUNT(*) FROM autorizacao_grupo UNION ALL
-- SELECT 'autorizacao_usuario', COUNT(*) FROM autorizacao_usuario;
