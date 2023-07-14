--CREATE OR REPLACE TABLE SoulCode.Estudantes24h as

SELECT


CASE 
     WHEN JSON_EXTRACT_SCALAR(data, '$.id') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.id') = '' THEN 'NÃO INFORMADO'
     ELSE JSON_EXTRACT_SCALAR(data, '$.id')
END AS id,
CASE 
    WHEN UPPER (JSON_EXTRACT_SCALAR(data, '$.nomeCompleto')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.nomeCompleto') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER (JSON_EXTRACT_SCALAR(data, '$.nomeCompleto'))
END AS nome_completo,
CASE 
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.nomeSocial')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.nomeSocial') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER (JSON_EXTRACT_SCALAR(data, '$.nomeSocial'))
END AS nome_social,
CASE 
    WHEN JSON_EXTRACT_SCALAR(data, '$.cpf') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.cpf') = '' THEN 'NÃO INFORMADO'
    ELSE JSON_EXTRACT_SCALAR(data, '$.cpf')
END AS cpf,
CASE 
	WHEN JSON_EXTRACT_SCALAR(data, '$.email') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.email')= '' THEN 'NÃO INFORMADO'
	ELSE JSON_EXTRACT_SCALAR(data, '$.email')
END email,

DATE(TIMESTAMP_MILLIS(SAFE_CAST(JSON_EXTRACT_SCALAR(data, '$.dataNascimento') AS INT64))) AS dataNascimento,

CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.tipoDeficiencia')) IS NULL OR UPPER(JSON_EXTRACT_SCALAR(data, '$.tipoDeficiencia')) = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.tipoDeficiencia'))
END tipoDeficiencia,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.deficiencia')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.deficiencia') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.deficiencia'))
END deficiencia,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.etnia')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.etnia') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.etnia'))
END etnia,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.genero')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.genero') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.genero'))
END genero,

CONCAT('(', LEFT(JSON_EXTRACT_SCALAR(data, '$.telefone'), 2), ')', SUBSTRING(JSON_EXTRACT_SCALAR(data, '$.telefone'), 3)) AS telefone,

CASE
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.rua')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.rua') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.rua'))
END rua,
 CASE
    WHEN JSON_EXTRACT_SCALAR(data, '$.numero') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.numero') = '' THEN 'NÃO INFORMADO'
    ELSE JSON_EXTRACT_SCALAR(data, '$.numero')
  END AS numero,
 CASE
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.bairro')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.bairro') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.bairro'))
  END AS bairro,
CASE
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.complemento')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.complemento') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.complemento'))
END AS complemento,
CASE
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.cidade')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.cidade') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.cidade'))
END AS cidade,

CASE
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.uf')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.uf') = '' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.uf'))
END AS UF,
CASE
    WHEN JSON_EXTRACT_SCALAR(data, '$.estadoCivil') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.estadoCivil') = '' THEN 'NÃO INFORMADO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.estadoCivil')) IN ('CASADO', 'CASADA', 'UNIÃO ESTÁVEL') THEN 'CASADO (A)' 
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.estadoCivil')) IN ('DIVORCIADO','Divorciado', 'Divorciada' ,'DIVORCIADA','Separado', 'SEPARADO', 'Separada','SEPARADA') THEN 'DIVORCIADO (A)' 
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.estadoCivil')) IN ('NÃO INFORMADO') THEN 'NÃO INFORMADO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.estadoCivil')) IN ('SOLTEIRO', 'Solteiro', 'Solteira', 'SOLTEIRA') THEN 'SOLTEIRO (A)'
END AS estadoCivil,
UPPER(JSON_EXTRACT_SCALAR(data, '$.filhos')) AS filhos,

CASE 
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel') = '' THEN 'NÃO INFORMADO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('EDUCAÇÃO SUPERIOR COMPLETO', 'SUPERIOR COMPLETO') THEN 'SUP.COMPLETO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('EDUCAÇÃO SUPERIOR INCOMPLETO', 'SUPERIOR INCOMPLETO') THEN 'SUP.IMCOMPLETO'
	WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('POS-GRADUACAO COMPLETO', 'POS-GRADUACAO INCOMPLETO', 'ESCIALISTA', 'ESPECIALIZAÇÃO') THEN 'ESPECIALIZAÇÃO'
	WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('MESTRADO COMPLETO', 'MESTRADO', 'MESTRADO INCOMPLETO') THEN 'MESTRADO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('DOUTORADO', 'DOUTORADO INCOMPLETO') THEN 'DOUTORADO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('CURSO TÉCNICO') THEN 'CURSO TÉCNICO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) IN ('MÉDIO COMPLETO', 'MÉDIO INCOMPLETO', 'ENSINO MÉDIO','MEDIO COMPLETO', 'MEDIO INCOMPLETO', 'ENSINO MEDIO') THEN 'ENSINO MÉDIO'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) = 'ENSINO FUNDAMENTAL' THEN 'OUTROS'
    WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel')) = 'NÃO INFORMADO' THEN 'NÃO INFORMADO'
    ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.escolaridadeNivel'))
END AS escolaridadeNivel,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.inglesInicial')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.inglesInicial') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.inglesInicial'))
END AS inglesInicial,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.nivelIngles')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.nivelIngles') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.nivelIngles'))
END AS nivelIngles,

CASE
  WHEN JSON_EXTRACT_SCALAR(data, '$.parceiroAssociado') IS NULL OR JSON_EXTRACT_SCALAR(data, '$.parceiroAssociado') = '' THEN'NÃO INFORMADO'
  ELSE JSON_EXTRACT_SCALAR(data, '$.parceiroAssociado')
END AS teste,

  JSON_QUERY(data, '$.parceiroAssociado') Parceiro_Antigo,
   REPLACE(REPLACE(REPLACE(JSON_QUERY(data, '$.parceiroAssociado'), '[', ''), ']', ''), '"', '') AS parceiro,

JSON_EXTRACT_SCALAR(data, '$.bootcampCodigo') AS bootcamp_codigo,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampTipo')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.bootcampTipo') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.bootcampTipo'))
END AS bootcamp_tipo,

CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.statusEmpregabilidade')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.statusEmpregabilidade') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.statusEmpregabilidade'))
END AS statusEmpregabilidade,
UPPER(JSON_EXTRACT_SCALAR(data, '$.mediafinal')) AS mediafinal,
CASE
   WHEN UPPER(JSON_EXTRACT_SCALAR(data, '$.statusNoBootcamp')) IS NULL OR JSON_EXTRACT_SCALAR(data, '$.statusNoBootcamp') = '' THEN 'NÃO INFORMADO'
   ELSE UPPER(JSON_EXTRACT_SCALAR(data, '$.statusNoBootcamp'))
END AS statusNoBootcamp,

PARSE_DATE('%Y-%m-%d', SUBSTR(JSON_EXTRACT_SCALAR(data, '$.dataDoBatch'), 1, 10)) AS data_do_batch,

safe_cast(concat(
SUBSTR(JSON_EXTRACT(data, '$.empregabilidadeLastUpdate'), 13, 4), '-',
SUBSTR(JSON_EXTRACT(data, '$.empregabilidadeLastUpdate'), 6, 3), '-',
SUBSTR(JSON_EXTRACT(data, '$.empregabilidadeLastUpdate'), 10, 2)) as date format 'YYYY-MON-DD') AltempregabilidadeLastUpdate,

JSON_EXTRACT_SCALAR(data, '$.empregabilidadeUpdateBy.type') AS empregabilidadeUpdateByType,
JSON_EXTRACT_SCALAR(data, '$.empregabilidadeUpdateBy.uid') AS empregabilidadeUpdateByUid

FROM `dashboards-b2b-ad1.SoulCode.Estudantes_raw_latest`