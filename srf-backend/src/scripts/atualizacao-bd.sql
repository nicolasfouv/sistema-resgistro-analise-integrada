/*
-- 1) concluído
alter table srf.animal_vivo
modify column data_nascimento datetime null;

alter table srf.animal_vivo
add idade boolean null;

create table destino_amostra (
	id int primary key auto_increment,
    nome varchar(255) unique
);

INSERT INTO srf.destino_amostra(nome)
VALUES ('Teste sorológico'), ('Leishmania'), ('Rosangela'), ('Reserva'), ('Teste sorológico + Reserva');

alter table srf.envio_amostra_veterinario
add id_destino_amostra int not null;

alter table srf.envio_amostra_veterinario
add constraint envio_amostra_veterinario_id_destino_fkey
foreign key (id_destino_amostra) references srf.destino_amostra(id);

alter table srf.envio_amostra_veterinario
drop foreign  key envio_amostra_veterinario_id_armazenamento_fkey,
drop column id_armazenamento;

CREATE TABLE destino_amostra_necropsia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO destino_amostra_necropsia (nome)
VALUES
    ('Teste sorológico'),
    ('Leishmania'),
    ('Rosangela'),
    ('Reserva'),
    ('Teste sorológico + Reserva');

ALTER TABLE envio_amostra_necropsia
    ADD id_destino_amostra INT NOT NULL;

ALTER TABLE envio_amostra_necropsia
    ADD CONSTRAINT envio_amostra_necropsia_id_destino_fkey
    FOREIGN KEY (id_destino_amostra)
    REFERENCES destino_amostra_necropsia(id);

ALTER TABLE envio_amostra_necropsia
    DROP FOREIGN KEY envio_amostra_necropsia_id_armazenamento_fkey,
    DROP COLUMN id_armazenamento;

-- 2) concluído
SET SQL_SAFE_UPDATES = 0;
update srf.tipo_amostra_veterinaria
set descricao = 'Medula'
where descricao = 'Mêdulo';
SET SQL_SAFE_UPDATES = 1;

-- 3) concluído
alter table srf.visita_veterinaria
drop index visita_veterinaria_id_animal_vivo_id_veterinario_data_key,
add unique key visita_veterinaria_id_animal_vivo_data_key (id_animal_vivo, data);

CREATE TABLE srf.`alocacao_helminto` (
    `id` int NOT NULL AUTO_INCREMENT,
    `id_analise_helminto` int NOT NULL,
    `id_localizacao` int NOT NULL,

    PRIMARY KEY (`id`),

    UNIQUE KEY `alocacao_helminto_id_analise_helminto_id_localizacao_key`
        (`id_analise_helminto`, `id_localizacao`),

    KEY `alocacao_helminto_id_localizacao_fkey`
        (`id_localizacao`),

    CONSTRAINT `alocacao_helminto_id_analise_helminto_fkey`
        FOREIGN KEY (`id_analise_helminto`)
        REFERENCES `analise_helminto` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT `alocacao_helminto_id_localizacao_fkey`
        FOREIGN KEY (`id_localizacao`)
        REFERENCES `localizacao_helminto` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

ALTER TABLE srf.`analise_helminto`
DROP FOREIGN KEY `analise_helminto_id_localizacao_fkey`;

ALTER TABLE srf.`analise_helminto`
DROP INDEX `analise_helminto_id_necropsia_id_especie_helminto_id_localiz_key`;

ALTER TABLE srf.`analise_helminto`
ADD UNIQUE KEY `analise_helminto_id_necropsia_id_especie_helminto_key`
(
    `id_necropsia`,
    `id_especie_helminto`
);

ALTER TABLE srf.`analise_helminto`
DROP COLUMN `id_localizacao`;

-- 4) concluído
alter table srf.analise_fezes
add index analise_fezes_id_visita_veterinaria_idx (id_visita_veterinaria);

alter table srf.analise_fezes
drop index analise_fezes_id_visita_veterinaria_key;

-- 5) concluído

-- 6) concluído

-- 7) a fazer => formulário de vermifugação

-- 8) concluído
alter table srf.entrevista_tutor
add observacao varchar(191) null;

-- 9) concluído

-- 10) concluído

-- 11) concluído
ALTER TABLE srf.rastreio_gps
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.entrevista_tutor
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.castracao
    ADD COLUMN id_responsavel INT NULL;
    
ALTER TABLE srf.aplicacao_vacina
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_fezes
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_ovo_cisto
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_molecular
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.exame_fisico
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_ectoparasito_veterinario
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.resultado_exame
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_sorologica
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.necropsia
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.analise_helminto
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.resultado_cpcr
    ADD COLUMN id_responsavel INT NOT NULL;

ALTER TABLE srf.resultado_qpcr
    ADD COLUMN id_responsavel INT NOT NULL;
    
ALTER TABLE srf.rastreio_gps
    ADD INDEX `rastreio_gps_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.entrevista_tutor
    ADD INDEX `entrevista_tutor_id_responsavel_fkey` (`id_responsavel`),
    ADD INDEX `entrevista_tutor_id_tutor_fkey` (`id_tutor`);

ALTER TABLE srf.castracao
    ADD INDEX `castracao_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.aplicacao_vacina
    ADD INDEX `aplicacao_vacina_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_fezes
    ADD INDEX `analise_fezes_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_ovo_cisto
    ADD INDEX `analise_ovo_cisto_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_molecular
    ADD INDEX `analise_molecular_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.exame_fisico
    ADD INDEX `exame_fisico_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_ectoparasito_veterinario
    ADD INDEX `analise_ectoparasito_veterinario_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.resultado_exame
    ADD INDEX `resultado_exame_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_sorologica
    ADD INDEX `analise_sorologica_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.necropsia
    ADD INDEX `necropsia_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_helminto
    ADD INDEX `analise_helminto_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.resultado_cpcr
    ADD INDEX `resultado_cpcr_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.resultado_qpcr
    ADD INDEX `resultado_qpcr_id_responsavel_fkey` (`id_responsavel`);
    
ALTER TABLE srf.rastreio_gps
    ADD CONSTRAINT `fk_rastreio_gps_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.entrevista_tutor
    ADD CONSTRAINT `fk_entrevista_tutor_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.castracao
    ADD CONSTRAINT `fk_castracao_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.aplicacao_vacina
    ADD CONSTRAINT `fk_aplicacao_vacina_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_fezes
    ADD CONSTRAINT `fk_analise_fezes_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_ovo_cisto
    ADD CONSTRAINT `fk_analise_ovo_cisto_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_molecular
    ADD CONSTRAINT `fk_analise_molecular_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.exame_fisico
    ADD CONSTRAINT `fk_exame_fisico_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_ectoparasito_veterinario
    ADD CONSTRAINT `fk_analise_ectoparasito_vet_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.resultado_exame
    ADD CONSTRAINT `fk_resultado_exame_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_sorologica
    ADD CONSTRAINT `fk_analise_sorologica_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.necropsia
    ADD CONSTRAINT `fk_necropsia_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.analise_helminto
    ADD CONSTRAINT `fk_analise_helminto_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.resultado_cpcr
    ADD CONSTRAINT `fk_resultado_cpcr_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

ALTER TABLE srf.resultado_qpcr
    ADD CONSTRAINT `fk_resultado_qpcr_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);
    
ALTER TABLE srf.visita_veterinaria
    DROP FOREIGN KEY `visita_veterinaria_id_veterinario_fkey`;

ALTER TABLE srf.visita_veterinaria
    DROP INDEX `visita_veterinaria_id_veterinario_fkey`;

ALTER TABLE srf.visita_veterinaria
    CHANGE COLUMN `id_veterinario`
                  `id_responsavel`
                  INT NOT NULL;

ALTER TABLE srf.visita_veterinaria
    ADD INDEX `visita_veterinaria_id_responsavel_fkey`
    (`id_responsavel`);

ALTER TABLE srf.visita_veterinaria
    ADD CONSTRAINT `visita_veterinaria_id_responsavel_fkey`
    FOREIGN KEY (`id_responsavel`)
    REFERENCES `veterinario` (`id`);
    
ALTER TABLE srf.analise_ectoparasito_necropsia
	ADD COLUMN id_responsavel INT NOT NULL;
    
ALTER TABLE srf.analise_ectoparasito_necropsia
	ADD INDEX `analise_ectoparasito_necropsia_id_responsavel_fkey` (`id_responsavel`);

ALTER TABLE srf.analise_ectoparasito_necropsia
	ADD CONSTRAINT `fk_analise_ectoparasito_necropsia_responsavel`
    FOREIGN KEY (`id_responsavel`) REFERENCES `veterinario` (`id`);

-- 12) concluído

-- 13) concluído
alter table srf.resultado_exame
drop column linfocitos,
drop column segmentados,
drop column monocitos,
drop column eosinofilos,
drop column basofilos;

-- 14 & 18) concluído
alter table srf.tutor
add endereco varchar(255) null,
add latitude double null,
add longitude double null;

alter table srf.animal_vivo
add latitude double null,
add longitude double null,
add fora_da_amostragem boolean default(false);

alter table srf.animal_vivo
modify column ativo boolean not null default(false);;

-- 15) concluído

-- 16) concluido

-- 17) a fazer, verificar quais campos incluir

-- 19) concluído

-- atualizar a parte de gps, separar pos fases: controle, castrado, vermifugado, castrado + vermifugado (não necessáriamente nessa ordem)

-- pensar sobre como vai funcionar a diferenciação de projetos no sistema

*/


