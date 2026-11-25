SET SESSION sql_mode = concat(@@sql_mode, ',NO_AUTO_VALUE_ON_ZERO');

INSERT INTO veterinario (id, nome)
VALUES (0, "_nao_identificado_")
ON DUPLICATE KEY UPDATE id = id;

INSERT INTO enum_tipo_vacina (id, nome)
VALUES (0, "_nao_identificado_")
ON DUPLICATE KEY UPDATE id = id;
