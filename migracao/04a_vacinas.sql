USE mig_auxiliar;

-- Script de compação para verificar se os animais do registro de vacinação existem no banco de dados
SELECT replace(a.ID_Animal, ' ', '') AS ID_Animal, a.Nome_Animal FROM vacinas a
WHERE NOT EXISTS (
	SELECT 1 FROM NOME_DO_BANCO.animal_vivo b
    WHERE lower(replace(b.codigo, ' ', '')) = lower(replace(a.ID_Animal, ' ', ''))
)
AND NOT EXISTS (
	SELECT 1 FROM NOME_DO_BANCO.animal_vivo b
    WHERE lower(trim(b.nome)) = lower(trim(a.Nome_Animal))
);