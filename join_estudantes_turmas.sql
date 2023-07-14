CREATE OR REPLACE TABLE SoulCode.EstudantesTurmas24h as

SELECT * EXCEPT(bootcampCodigo) FROM SoulCode.Estudantes24h as e 
LEFT JOIN SoulCode.Turmas24h as t
ON e.bootcamp_codigo = t.bootcampCodigo 