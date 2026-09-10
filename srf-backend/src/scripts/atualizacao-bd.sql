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

INSERT INTO srf.destino_amostra(name)
VALUES ('Teste sorológico'), ('Leishmania'), ('Rosangela'), ('Reserva'), ('Teste sorológico + Reserva');

alter table srf.envio_amostra_veterinario
add id_destino_amostra int not null;

alter table srf.envio_amostra_veterinario
add constraint envio_amostra_veterinario_id_destino_fkey
foreign key (id_destino_amostra) references srf.destino_amostra(id);

alter table srf.envio_amostra_veterinario
drop foreign  key envio_amostra_veterinario_id_armazenamento_fkey,
drop column id_armazenamento;

-- 2[parcialmente])
SET SQL_SAFE_UPDATES = 0;
update srf.tipo_amostra_veterinaria
set descricao = 'Medula'
where descricao = 'Mêdulo';
SET SQL_SAFE_UPDATES = 1;

-- 3) verificar com Anderson como proceder

-- 4[parcialmente])
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

-- 15) concluído

-- 16) concluido

-- 17) a fazer

-- 18[parcialmente]) a alteração de animal entrará junto a outras alterações requisitadas
alter table srf.tutor
add endereco varchar(255) null;
*/

