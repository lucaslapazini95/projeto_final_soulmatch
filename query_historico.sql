SELECT
CASE 
     WHEN JSON_EXTRACT_SCALAR(data, '$.id') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.id') = '' THEN 'NÃO INFORMADO'
     ELSE JSON_EXTRACT_SCALAR(data, '$.id')
END AS id,
CASE 
    WHEN UPPER (JSON_EXTRACT_SCALAR(data, '$.nomeCompleto')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.nomeCompleto') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER (JSON_EXTRACT_SCALAR(data, '$.nomeCompleto'))
END AS nome_completo,
SUBSTR(JSON_EXTRACT(historico, '$.empregabilidadeUpdateBy'), 9,28) as uid,
   safe_cast(concat(
SUBSTR(JSON_EXTRACT(historico, '$.novaData'), 13, 4), '-',
SUBSTR(JSON_EXTRACT(historico, '$.novaData'), 6, 3), '-',
SUBSTR(JSON_EXTRACT(historico, '$.novaData'), 10, 2)) as date format 'YYYY-MON-DD') novaData,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(historico, '$.parceiro[0]')) IS NULL OR JSON_EXTRACT_SCALAR(historico, '$.parceiro[0]') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(historico, '$.parceiro[0]'))
END AS parceiro,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(historico, '$.status')) IS NULL OR JSON_EXTRACT_SCALAR(historico, '$.status') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(historico, '$.status'))
END AS status,
FROM `dashboards-b2b-ad1.SoulCode.Estudantes_raw_latest`, UNNEST(JSON_EXTRACT_ARRAY(data, '$.historico')) AS historico