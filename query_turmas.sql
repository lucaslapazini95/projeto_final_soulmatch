--CREATE OR REPLACE TABLE SoulCode.Turmas24h as
SELECT 
  CAST(JSON_EXTRACT_SCALAR(data, '$.extensao') AS FLOAT64) AS extensao,
  CAST(JSON_EXTRACT_SCALAR(data, '$.disponiveis') AS FLOAT64) AS disponiveis,
  CAST(JSON_EXTRACT_SCALAR(data, '$.desistentes') AS FLOAT64) as desistentes,
  CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.ativo')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.ativo') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.ativo'))
END AS ativo,
  CAST(JSON_EXTRACT_SCALAR(data, '$.naoEmpregaveis') AS FLOAT64) as naoEmpregaveis,
  PARSE_DATE('%Y-%m-%d', JSON_EXTRACT_SCALAR(data, '$.dataTermino')) AS dataTermino,
  CAST(JSON_EXTRACT_SCALAR(data, '$.empregados') AS FLOAT64) as empregados,
  PARSE_DATE('%Y-%m-%d',JSON_EXTRACT_SCALAR(data, '$.fimContrato')) as fimContrato,
  CAST(JSON_EXTRACT_SCALAR(data, '$.recuperacao') AS FLOAT64) as recuperacao,
  PARSE_DATE('%Y-%m-%d', JSON_EXTRACT_SCALAR(data, '$.dataInicio')) as dataInicio,
  CAST(JSON_EXTRACT_SCALAR(data, '$.mediaTurma') AS FLOAT64) as mediaTurma,
  CAST(JSON_EXTRACT_SCALAR(data, '$.quantidadeAlunos') AS FLOAT64) as quantidadeAlunos,
  CAST(JSON_EXTRACT_SCALAR(data, '$.concluiram') AS FLOAT64) as concluiram,
CASE 
     WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampTipo')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.bootcampTipo') = '' THEN 'NÃO INFORMADO'
     ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampTipo'))
END AS bootcampTipo,
  JSON_EXTRACT_SCALAR(data, '$.bootcampCodigo') as bootcampCodigo,
  CAST(JSON_EXTRACT_SCALAR(data, '$.cluster') AS FLOAT64) as cluster,
 CASE 
     WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampStatus')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.bootcampStatus') = '' THEN 'NÃO INFORMADO'
     ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampStatus'))
END AS bootcampStatus,
  CAST(JSON_EXTRACT_SCALAR(data, '$.reciclagem') AS FLOAT64) as reciclagem,
  JSON_EXTRACT_SCALAR(data, '$.professorUmId') as professorUmId,
  CAST(JSON_EXTRACT_SCALAR(data, '$.porcentagemIndicacao') AS FLOAT64) as porcentagemIndicacao,
  CAST(JSON_EXTRACT_SCALAR(data, '$.formados') AS FLOAT64) as formados,
  CAST(JSON_EXTRACT_SCALAR(data, '$.porcentagemEmpregados') AS FLOAT64) as porcentagemEmpregados
  

FROM `dashboards-b2b-ad1.SoulCode.Turmas_raw_latest`