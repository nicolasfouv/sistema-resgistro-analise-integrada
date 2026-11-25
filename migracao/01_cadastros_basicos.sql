-- Este script insere os dados básicos no banco de dados.
-- Executar este script não afetará os dados já existentes.

SET NAMES utf8mb4;

-- especie (specie)
INSERT INTO `especie` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Canis lupus familiaris' AS `nome`
  UNION ALL
  SELECT 'Felis catus' AS `nome`
  UNION ALL
  SELECT 'Cerdocyon thous' AS `nome`
  UNION ALL
  SELECT 'Procyon cancrivorus' AS `nome`
  UNION ALL
  SELECT 'Chrysocyon brachyurus' AS `nome`
  UNION ALL
  SELECT 'Conepatus semistriatus' AS `nome`
  UNION ALL
  SELECT 'Nasua nasua' AS `nome`
  UNION ALL
  SELECT 'Puma yagouaroundi' AS `nome`
  UNION ALL
  SELECT 'Leopardus pardalis' AS `nome`
  UNION ALL
  SELECT 'Puma concolor' AS `nome`
  UNION ALL
  SELECT 'Lycalopex vetulus' AS `nome`
  UNION ALL
  SELECT 'Eira barbara' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `especie` t
  WHERE t.`nome` = v.`nome`
);

-- genero_ectoparasito (ectoparasiteGenus)
INSERT INTO `genero_ectoparasito` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Tunga' AS `nome`
  UNION ALL
  SELECT 'Ctenocephalides' AS `nome`
  UNION ALL
  SELECT 'Rhipicephalus' AS `nome`
  UNION ALL
  SELECT 'Ambyomma' AS `nome`
  UNION ALL
  SELECT 'Trichodectes' AS `nome`
  UNION ALL
  SELECT 'Linognathus' AS `nome`
  UNION ALL
  SELECT 'Sarcoptes' AS `nome`
  UNION ALL
  SELECT 'Demodex' AS `nome`
  UNION ALL
  SELECT 'Otodectes' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `genero_ectoparasito` t
  WHERE t.`nome` = v.`nome`
);

-- especie_ectoparasito (ectoparasiteSpecie)
INSERT INTO `especie_ectoparasito` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Ctenocephalides felis felis' AS `nome`
  UNION ALL
  SELECT 'Ctenocephalides canis' AS `nome`
  UNION ALL
  SELECT 'Tunga penetrans' AS `nome`
  UNION ALL
  SELECT 'Rhipicephalus sanguineus' AS `nome`
  UNION ALL
  SELECT 'Rhipicephalus linnaei' AS `nome`
  UNION ALL
  SELECT 'Ambyomma sculptum' AS `nome`
  UNION ALL
  SELECT 'Rhipicephalus microplus' AS `nome`
  UNION ALL
  SELECT 'Trichodectes canis' AS `nome`
  UNION ALL
  SELECT 'Linognathus setosus' AS `nome`
  UNION ALL
  SELECT 'Sarcoptes scabiei var. canis' AS `nome`
  UNION ALL
  SELECT 'Sarcoptes scabiei var. hominis' AS `nome`
  UNION ALL
  SELECT 'Demodex canis' AS `nome`
  UNION ALL
  SELECT 'Otodectes cynotis' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `especie_ectoparasito` t
  WHERE t.`nome` = v.`nome`
);

-- armazem (storage)
INSERT INTO `armazem` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'LEMa' AS `nome`
  UNION ALL
  SELECT 'LEIMa' AS `nome`
  UNION ALL
  SELECT 'IOC-FIOCRUZ' AS `nome`
  UNION ALL
  SELECT 'ScienceVet' AS `nome`
  UNION ALL
  SELECT 'ImunoDot' AS `nome`
  UNION ALL
  SELECT 'LEGO' AS `nome`
  UNION ALL
  SELECT 'VBBL' AS `nome`
  UNION ALL
  SELECT 'CHIOC' AS `nome`
  UNION ALL
  SELECT 'Prof. Darci' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `armazem` t
  WHERE t.`nome` = v.`nome`
);

-- enum_status_alocacao_amostra_veterinario (enumVeterinarianSampleAllocationStatus)
INSERT INTO `enum_status_alocacao_amostra_veterinario` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Aguardando processamento' AS `nome`
  UNION ALL
  SELECT 'Processada' AS `nome`
  UNION ALL
  SELECT 'Armazenada' AS `nome`
  UNION ALL
  SELECT 'Descartada' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_status_alocacao_amostra_veterinario` t
  WHERE t.`nome` = v.`nome`
);

-- tipo_amostra_veterinaria (veterinarianSampleType)
INSERT INTO `tipo_amostra_veterinaria` (`descricao`)
SELECT v.`descricao`
FROM (
  SELECT 'Sangue (c/ e s/ EDTA)' AS `descricao`
  UNION ALL
  SELECT 'Soro' AS `descricao`
  UNION ALL
  SELECT 'Pêlo' AS `descricao`
  UNION ALL
  SELECT 'Medula' AS `descricao`
  UNION ALL
  SELECT 'Sangue (c/ EDTA)' AS `descricao`
  UNION ALL
  SELECT 'Sangue (s/ EDTA)' AS `descricao`
  UNION ALL
  SELECT 'Fecal Loops' AS `descricao`
  UNION ALL
  SELECT 'Swab' AS `descricao`
  UNION ALL
  SELECT 'Fezes' AS `descricao`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_amostra_veterinaria` t
  WHERE t.`descricao` = v.`descricao`
);

-- veterinario (veterinarian)
INSERT INTO `veterinario` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Victoria Rosy Machado' AS `nome`
  UNION ALL
  SELECT 'Gabriela Alves' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `veterinario` t
  WHERE t.`nome` = v.`nome`
);

-- vacina (vaccine)
INSERT INTO `vacina` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'V8' AS `nome`
  UNION ALL
  SELECT 'Raiva' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `vacina` t
  WHERE t.`nome` = v.`nome`
);

-- enum_tipo_vacina (enumVaccineType)
INSERT INTO `enum_tipo_vacina` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Reforço' AS `nome`
  UNION ALL
  SELECT 'Protocolo de filhote - V8' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_tipo_vacina` t
  WHERE t.`nome` = v.`nome`
);

-- enum_interpretacao (enumExamInterpretation)
INSERT INTO `enum_interpretacao` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Sem alterações' AS `nome`
  UNION ALL
  SELECT 'Alterações discretas' AS `nome`
  UNION ALL
  SELECT 'Alterações moderadas' AS `nome`
  UNION ALL
  SELECT 'Alterações acentuadas' AS `nome`
  UNION ALL
  SELECT 'Inconclusivo - amostra inadequada' AS `nome`
  UNION ALL
  SELECT 'Não realizado' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_interpretacao` t
  WHERE t.`nome` = v.`nome`
);

-- tecnologia_processamento (processingTechnology)
INSERT INTO `tecnologia_processamento` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Sedimentação espontânea (Hoffman-Pons-Janer / Lutz)' AS `nome`
  UNION ALL
  SELECT 'Sedimentação em formol-éter ou formol-acetato de etila (Ritchie modificado)' AS `nome`
  UNION ALL
  SELECT 'Flutuação em NaCl saturado (Willis-Mollay)' AS `nome`
  UNION ALL
  SELECT 'Flutuação centrífuga em sulfato de zinco (Faust)' AS `nome`
  UNION ALL
  SELECT 'Flutuação em sacarose (Sheather)' AS `nome`
  UNION ALL
  SELECT 'Coloração para Cryptosporidium (Ziehl-Neelsen modificado / Kinyoun)' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tecnologia_processamento` t
  WHERE t.`nome` = v.`nome`
);

-- especie_ovo_cisto (eggCystSpecie)
INSERT INTO `especie_ovo_cisto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Ancylostoma caninum' AS `nome`
  UNION ALL
  SELECT 'Ancylostoma braziliense' AS `nome`
  UNION ALL
  SELECT 'Uncinaria stenocephala' AS `nome`
  UNION ALL
  SELECT 'Dipylidium caninum' AS `nome`
  UNION ALL
  SELECT 'Trichuris vulpis' AS `nome`
  UNION ALL
  SELECT 'Cystoisospora caninum' AS `nome`
  UNION ALL
  SELECT 'Giardia spp.' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `especie_ovo_cisto` t
  WHERE t.`nome` = v.`nome`
);

-- enum_estado_geral_exame_fisico (enumPhysicalExamGeneralCondition)
INSERT INTO `enum_estado_geral_exame_fisico` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Bom' AS `nome`
  UNION ALL
  SELECT 'Regular' AS `nome`
  UNION ALL
  SELECT 'Ruim' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_estado_geral_exame_fisico` t
  WHERE t.`nome` = v.`nome`
);

-- enum_mucosa (enumMucous)
INSERT INTO `enum_mucosa` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Hipocorada' AS `nome`
  UNION ALL
  SELECT 'Normocorada' AS `nome`
  UNION ALL
  SELECT 'Hiperêmica' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_mucosa` t
  WHERE t.`nome` = v.`nome`
);

-- enum_hidratacao (enumHydration)
INSERT INTO `enum_hidratacao` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Hidratado' AS `nome`
  UNION ALL
  SELECT 'Desidratação leve' AS `nome`
  UNION ALL
  SELECT 'Desidratação moderada' AS `nome`
  UNION ALL
  SELECT 'Desidratação grave' AS `nome`
  UNION ALL
  SELECT 'Desidratação crítica' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_hidratacao` t
  WHERE t.`nome` = v.`nome`
);

-- enum_tipo_resultado_analise_sorologica (enumSorologyResultType)
INSERT INTO `enum_tipo_resultado_analise_sorologica` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Título' AS `nome`
  UNION ALL
  SELECT 'Densidade Óptica (D.O.)' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_tipo_resultado_analise_sorologica` t
  WHERE t.`nome` = v.`nome`
);

-- enum_interpretacao_analise_sorologica (enumSorologyInterpretation)
INSERT INTO `enum_interpretacao_analise_sorologica` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Positivo' AS `nome`
  UNION ALL
  SELECT 'Negativo' AS `nome`
  UNION ALL
  SELECT 'Inconclusivo' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_interpretacao_analise_sorologica` t
  WHERE t.`nome` = v.`nome`
);

-- teste_sorologico (sorologyTest)
INSERT INTO `teste_sorologico` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'ELISA (ensaio imunoenzimático)' AS `nome`
  UNION ALL
  SELECT 'IFA/RIFI (reação de imunofluorescência indireta)' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `teste_sorologico` t
  WHERE t.`nome` = v.`nome`
);

-- agente_sorologico (sorologyAgent)
INSERT INTO `agente_sorologico` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Ehrlichia canis' AS `nome`
  UNION ALL
  SELECT 'Babesia canis' AS `nome`
  UNION ALL
  SELECT 'Leishmania chagasi' AS `nome`
  UNION ALL
  SELECT 'Toxoplasma gondii' AS `nome`
  UNION ALL
  SELECT 'Neospora caninum' AS `nome`
  UNION ALL
  SELECT 'Bartonella henselae' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `agente_sorologico` t
  WHERE t.`nome` = v.`nome`
);

-- dispositivo_rastreio (trackingDevice)
INSERT INTO `dispositivo_rastreio` (`marca`, `numero_serie`)
SELECT v.`marca`, v.`numero_serie`
FROM (
  SELECT 'I-got' AS `marca`, '' AS `numero_serie`
  UNION ALL
  SELECT 'Columbus' AS `marca`, '' AS `numero_serie`
  UNION ALL
  SELECT 'Novo 1' AS `marca`, '' AS `numero_serie`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `dispositivo_rastreio` t
  WHERE t.`marca` = v.`marca`
    AND t.`numero_serie` = v.`numero_serie`
);

-- metodo_monitoramento (monitoringMethod)
INSERT INTO `metodo_monitoramento` (`descricao`)
SELECT v.`descricao`
FROM (
  SELECT 'Minimum Convex Polygon (MCP)' AS `descricao`
  UNION ALL
  SELECT 'Kernel Density Estimation (KDE)' AS `descricao`
  UNION ALL
  SELECT 'Autocorrelated Kernel Density Estimation (AKDE)' AS `descricao`
  UNION ALL
  SELECT 'Brownian Bridge Movement Model (BBMM)' AS `descricao`
  UNION ALL
  SELECT 'Dynamic Brownian Bridge Movement Model (dBBMM)' AS `descricao`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `metodo_monitoramento` t
  WHERE t.`descricao` = v.`descricao`
);

-- tipo_medida_corporal_veterinario (bodyMeasurementTypeVeterinarian)
INSERT INTO `tipo_medida_corporal_veterinario` (`descricao`, `unidade`)
SELECT v.`descricao`, v.`unidade`
FROM (
  SELECT 'Comprimento total' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento cabeça-corpo' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento dorsal' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento da cauda vertebral' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento da cabeça' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Largura da cabeça' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Distância entre os olhos' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Circunferência do pescoço' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Circunferência torácica' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Altura na cernelha (ombro frontal)' AS `descricao`, 'cm' AS `unidade`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_medida_corporal_veterinario` t
  WHERE t.`descricao` = v.`descricao`
    AND t.`unidade` = v.`unidade`
);

-- grupo_animal_morto (deadAnimalGroup)
INSERT INTO `grupo_animal_morto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Doméstico' AS `nome`
  UNION ALL
  SELECT 'Silvestre' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `grupo_animal_morto` t
  WHERE t.`nome` = v.`nome`
);

-- enum_origem_animal_morto (enumDeadAnimalOrigin)
INSERT INTO `enum_origem_animal_morto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Atropelamento' AS `nome`
  UNION ALL
  SELECT 'Canil' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_origem_animal_morto` t
  WHERE t.`nome` = v.`nome`
);

-- enum_status_animal_morto (enumDeadAnimalStatus)
INSERT INTO `enum_status_animal_morto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'LEIMa' AS `nome`
  UNION ALL
  SELECT 'PEFBJ' AS `nome`
  UNION ALL
  SELECT 'Necropsia feita' AS `nome`
  UNION ALL
  SELECT 'Em análise' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_status_animal_morto` t
  WHERE t.`nome` = v.`nome`
);

-- responsavel_coleta (collectionResponsible)
INSERT INTO `responsavel_coleta` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'DER' AS `nome`
  UNION ALL
  SELECT 'PEFBJ' AS `nome`
  UNION ALL
  SELECT 'Prefeitura' AS `nome`
  UNION ALL
  SELECT 'Natalie' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `responsavel_coleta` t
  WHERE t.`nome` = v.`nome`
);

-- enum_estado_corporal (enumBodyCondition)
INSERT INTO `enum_estado_corporal` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Íntegro' AS `nome`
  UNION ALL
  SELECT 'Danificado' AS `nome`
  UNION ALL
  SELECT 'Decomposto' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_estado_corporal` t
  WHERE t.`nome` = v.`nome`
);

-- enum_estado_clinico (enumClinicalCondition)
INSERT INTO `enum_estado_clinico` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Bom' AS `nome`
  UNION ALL
  SELECT 'Regular' AS `nome`
  UNION ALL
  SELECT 'Ruim' AS `nome`
  UNION ALL
  SELECT 'Não se aplica' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_estado_clinico` t
  WHERE t.`nome` = v.`nome`
);

-- enum_condicao_reprodutiva (enumReproductiveCondition)
INSERT INTO `enum_condicao_reprodutiva` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Nulípara' AS `nome`
  UNION ALL
  SELECT 'Pré-púbere' AS `nome`
  UNION ALL
  SELECT 'Pós-púbere' AS `nome`
  UNION ALL
  SELECT 'Multípara/provavelmente lactante' AS `nome`
  UNION ALL
  SELECT 'Indeterminada' AS `nome`
  UNION ALL
  SELECT 'Primípara' AS `nome`
  UNION ALL
  SELECT 'Castrada' AS `nome`
  UNION ALL
  SELECT 'Multípara' AS `nome`
  UNION ALL
  SELECT 'Lactante' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_condicao_reprodutiva` t
  WHERE t.`nome` = v.`nome`
);

-- enum_faixa_etaria (enumAge)
INSERT INTO `enum_faixa_etaria` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Jovem' AS `nome`
  UNION ALL
  SELECT 'Adulto' AS `nome`
  UNION ALL
  SELECT 'Idoso' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_faixa_etaria` t
  WHERE t.`nome` = v.`nome`
);

-- especie_helminto (helminthSpecie)
INSERT INTO `especie_helminto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Toxocara cati' AS `nome`
  UNION ALL
  SELECT 'Toxocara canis' AS `nome`
  UNION ALL
  SELECT 'Ancylostoma caninum' AS `nome`
  UNION ALL
  SELECT 'Ancylostoma braziliense' AS `nome`
  UNION ALL
  SELECT 'Uncinaria stenocephala' AS `nome`
  UNION ALL
  SELECT 'Dipylidium caninum' AS `nome`
  UNION ALL
  SELECT 'Trichuris vulpis' AS `nome`
  UNION ALL
  SELECT 'Cystoisospora caninum' AS `nome`
  UNION ALL
  SELECT 'Giardia spp.' AS `nome`
  UNION ALL
  SELECT 'Capillaria spp' AS `nome`
  UNION ALL
  SELECT 'Spirocerca lupi' AS `nome`
  UNION ALL
  SELECT 'Physaloptera spp' AS `nome`
  UNION ALL
  SELECT 'Strongyloides stercoralis' AS `nome`
  UNION ALL
  SELECT 'Taenia spp - Spirometra mansoni' AS `nome`
  UNION ALL
  SELECT 'Dioctophyma renale' AS `nome`
  UNION ALL
  SELECT 'Platynosomum spp' AS `nome`
  UNION ALL
  SELECT 'Echinostoma spp' AS `nome`
  UNION ALL
  SELECT 'Eimeria spp' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `especie_helminto` t
  WHERE t.`nome` = v.`nome`
);

-- localizacao_helminto (helminthLocation)
INSERT INTO `localizacao_helminto` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Traqueia' AS `nome`
  UNION ALL
  SELECT 'Pulmão' AS `nome`
  UNION ALL
  SELECT 'Cavidade Toraxica' AS `nome`
  UNION ALL
  SELECT 'Estomago' AS `nome`
  UNION ALL
  SELECT 'Intestino' AS `nome`
  UNION ALL
  SELECT 'Intestino delgado' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `localizacao_helminto` t
  WHERE t.`nome` = v.`nome`
);

-- enum_status_alocacao_amostra_necropsia (enumNecropsySampleAllocationStatus)
INSERT INTO `enum_status_alocacao_amostra_necropsia` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Aguardando processamento' AS `nome`
  UNION ALL
  SELECT 'Processada' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_status_alocacao_amostra_necropsia` t
  WHERE t.`nome` = v.`nome`
);

-- tipo_amostra_necropsia (necropsySampleType)
INSERT INTO `tipo_amostra_necropsia` (`descricao`)
SELECT v.`descricao`
FROM (
  SELECT 'Pelo' AS `descricao`
  UNION ALL
  SELECT 'Sangue' AS `descricao`
  UNION ALL
  SELECT 'Ectoparasitos' AS `descricao`
  UNION ALL
  SELECT 'Baço congelado' AS `descricao`
  UNION ALL
  SELECT 'Baço em etanol' AS `descricao`
  UNION ALL
  SELECT 'Coração em formol' AS `descricao`
  UNION ALL
  SELECT 'Fígado em formol' AS `descricao`
  UNION ALL
  SELECT 'Fígado em etanol' AS `descricao`
  UNION ALL
  SELECT 'Fígado em RNA Later' AS `descricao`
  UNION ALL
  SELECT 'Pulmão em RNA Later' AS `descricao`
  UNION ALL
  SELECT 'Instestino em RNA Later' AS `descricao`
  UNION ALL
  SELECT 'Cérebro em RNA Later' AS `descricao`
  UNION ALL
  SELECT 'Helmintos' AS `descricao`
  UNION ALL
  SELECT 'Conteúdo Esstomacal' AS `descricao`
  UNION ALL
  SELECT 'Conteúdo Intestinal' AS `descricao`
  UNION ALL
  SELECT 'Pele' AS `descricao`
  UNION ALL
  SELECT 'Crânio' AS `descricao`
  UNION ALL
  SELECT 'Esqueleto' AS `descricao`
  UNION ALL
  SELECT 'Pulmão Congelado' AS `descricao`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_amostra_necropsia` t
  WHERE t.`descricao` = v.`descricao`
);

-- tipo_medida_corporal_necropsia (bodyMeasurementTypeNecropsy)
INSERT INTO `tipo_medida_corporal_necropsia` (`descricao`, `unidade`)
SELECT v.`descricao`, v.`unidade`
FROM (
  SELECT 'Comprimeto do Corpo' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento da cauda' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Altura Escapular' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Circunferência do pescoço' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Circunferencia toraxica' AS `descricao`, 'cm' AS `unidade`
  UNION ALL
  SELECT 'Comprimento da cabeça' AS `descricao`, 'cm' AS `unidade`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_medida_corporal_necropsia` t
  WHERE t.`descricao` = v.`descricao`
    AND t.`unidade` = v.`unidade`
);

-- tipo_amostra_cpcr (cpcrSampleType)
INSERT INTO `tipo_amostra_cpcr` (`descricao`)
SELECT v.`descricao`
FROM (
  SELECT 'Sangue' AS `descricao`
  UNION ALL
  SELECT 'Pulmão' AS `descricao`
  UNION ALL
  SELECT 'Baço' AS `descricao`
  UNION ALL
  SELECT 'Coração' AS `descricao`
  UNION ALL
  SELECT 'Intestino' AS `descricao`
  UNION ALL
  SELECT 'Fígado' AS `descricao`
  UNION ALL
  SELECT 'Cérebro' AS `descricao`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_amostra_cpcr` t
  WHERE t.`descricao` = v.`descricao`
);

-- tipo_amostra_qpcr (qpcrSampleType)
INSERT INTO `tipo_amostra_qpcr` (`descricao`)
SELECT v.`descricao`
FROM (
  SELECT 'Sangue' AS `descricao`
  UNION ALL
  SELECT 'Pulmão' AS `descricao`
  UNION ALL
  SELECT 'Baço' AS `descricao`
  UNION ALL
  SELECT 'Coração' AS `descricao`
  UNION ALL
  SELECT 'Intestino' AS `descricao`
  UNION ALL
  SELECT 'Fígado' AS `descricao`
  UNION ALL
  SELECT 'Cérebro' AS `descricao`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_amostra_qpcr` t
  WHERE t.`descricao` = v.`descricao`
);

-- tipo_extracao (extractionType)
INSERT INTO `tipo_extracao` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'TRIzol®' AS `nome`
  UNION ALL
  SELECT 'fenol-clorofórmio' AS `nome`
  UNION ALL
  SELECT 'DNeasy®' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `tipo_extracao` t
  WHERE t.`nome` = v.`nome`
);

-- agente_suspeito (suspiciousAgent)
INSERT INTO `agente_suspeito` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Anaplasmataceae' AS `nome`
  UNION ALL
  SELECT 'hemoplasmas' AS `nome`
  UNION ALL
  SELECT 'piroplasmídeos' AS `nome`
  UNION ALL
  SELECT 'Hepatozoon' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `agente_suspeito` t
  WHERE t.`nome` = v.`nome`
);

-- enum_metodo_cpcr (enumCpcrMethod)
INSERT INTO `enum_metodo_cpcr` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'cPCR (PCR convencional)' AS `nome`
  UNION ALL
  SELECT 'nPCR (nested PCR)' AS `nome`
  UNION ALL
  SELECT 'cPCR e nPCR' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_metodo_cpcr` t
  WHERE t.`nome` = v.`nome`
);

-- enum_status_cpcr (enumCpcrStatus)
INSERT INTO `enum_status_cpcr` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Positivo' AS `nome`
  UNION ALL
  SELECT 'Negativo' AS `nome`
  UNION ALL
  SELECT 'Inconclusivo' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_status_cpcr` t
  WHERE t.`nome` = v.`nome`
);

-- enum_status_qpcr (enumQpcrStatus)
INSERT INTO `enum_status_qpcr` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Positivo' AS `nome`
  UNION ALL
  SELECT 'Negativo' AS `nome`
  UNION ALL
  SELECT 'Inconclusivo' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_status_qpcr` t
  WHERE t.`nome` = v.`nome`
);

-- destino_amostra (destinationSample)
INSERT INTO `destino_amostra` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Teste sorológico' AS `nome`
  UNION ALL
  SELECT 'Leishmania' AS `nome`
  UNION ALL
  SELECT 'Rosangela' AS `nome`
  UNION ALL
  SELECT 'Reserva' AS `nome`
  UNION ALL
  SELECT 'Teste sorológico + Reserva' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `destino_amostra` t
  WHERE t.`nome` = v.`nome`
);

-- destino_amostra_necropsia (destinationSampleNecropsy)
INSERT INTO `destino_amostra_necropsia` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Teste sorológico' AS `nome`
  UNION ALL
  SELECT 'Leishmania' AS `nome`
  UNION ALL
  SELECT 'Rosangela' AS `nome`
  UNION ALL
  SELECT 'Reserva' AS `nome`
  UNION ALL
  SELECT 'Teste sorológico + Reserva' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `destino_amostra_necropsia` t
  WHERE t.`nome` = v.`nome`
);

-- enum_etapa (enum_stage)
INSERT INTO `enum_etapa` (`nome`)
SELECT v.`nome`
FROM (
  SELECT 'Controle' AS `nome`
  UNION ALL
  SELECT 'Castrado' AS `nome`
  UNION ALL
  SELECT 'Vermifugado' AS `nome`
  UNION ALL
  SELECT 'Castrado + Vermifugado' AS `nome`
) v
WHERE NOT EXISTS (
  SELECT 1 FROM `enum_etapa` t
  WHERE t.`nome` = v.`nome`
);
