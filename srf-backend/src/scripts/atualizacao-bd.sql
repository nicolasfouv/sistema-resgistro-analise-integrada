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

-- 4[parcialmente]) fazer um link com sidedrawer entre a amostra de fezes e a analise
alter table srf.analise_fezes
add index analise_fezes_id_visita_veterinaria_idx (id_visita_veterinaria);

alter table srf.analise_fezes
drop index analise_fezes_id_visita_veterinaria_key;

-- 5) concluído

-- 6) concluído

-- 7) a fazer

-- 8) concluído
alter table srf.entrevista_tutor
add observacao varchar(191) null;

-- 9) concluído

-- 10) concluído

-- 11) a fazer

-- 12) concluído

-- 13[parcialmente]) verificar quais campos devem ser removidos

-- 14) a fazer

-- 15) concluído ex fisico

-- 16) concluido

-- 17) a fazer, verificar quais campos incluir

-- 18[parcialmente]) a alteração de animal entrará junto a outras alterações requisitadas
alter table srf.tutor
add endereco varchar(255) null;

-- 19) atualizar a parte de gps, separar pos fases: controle, castrado, vermifugado, castrado + vermifugado (não necessáriamente nessa ordem)

-- pensar sobre como vai funcionar a diferenciação de projetos no sistema


ALTER TABLE srf.`analise_helminto`
DROP FOREIGN KEY `analise_helminto_id_localizacao_fkey`;

ALTER TABLE srf.`analise_helminto`
DROP INDEX `analise_helminto_id_localizacao_fkey`;

ALTER TABLE srf.`analise_helminto`
DROP INDEX `analise_helminto_id_necropsia_id_especie_helminto_id_localiz_key`;

ALTER TABLE srf.`analise_helminto`
ADD UNIQUE KEY `analise_helminto_id_necropsia_id_especie_helminto_key`
    (`id_necropsia`, `id_especie_helminto`);

ALTER TABLE srf.`analise_helminto`
DROP COLUMN `id_localizacao`;
*/



