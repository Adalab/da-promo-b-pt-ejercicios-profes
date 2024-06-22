-- Queries avanzados
-- funciones agregadas para resumir datos (MIN,MAX,SUM,AVG,COUNT)
-- organizar resultados (GROUP BY)
-- aplicar filtros a grupos (HAVING)
-- realizar transformaciones condicionales (CASE)

USE Clase;
SELECT * FROM empleadas;

SELECT MIN(id_empleada) as min_id
FROM empleadas;

SELECT MAX(id_empleada) as max_id
FROM empleadas;

SELECT MIN(nombre) as min_nombre
FROM empleadas;

SELECT salario
FROM empleadas;

SELECT SUM(salario) as suma_salarios
FROM empleadas;

SELECT AVG(salario) as promedio_salarios
FROM empleadas;

SELECT COUNT(nombre)
FROM empleadas;
-- 
SELECT COUNT(*)
FROM empleadas;
-- 
SELECT * FROM empleadas;

SELECT pais, AVG(salario) as promedio_salario
FROM empleadas
GROUP BY pais;

SELECT pais, AVG(salario) as promedio_salario
FROM empleadas
GROUP BY pais
HAVING COUNT(*) > 2;

SELECT salario,
CASE
    WHEN salario < 2000 THEN "Bajo"
    WHEN salario > 3000 THEN "Alto"
    ELSE "Medio"
    END as RangoSlario
FROM empleadas;

SELECT salario,
CASE
   WHEN salario < 2000 THEN "Bajo"
   ELSE
       CASE WHEN salario > 3000 THEN "Altp"
       ELSE "Medio"
         END
	END RangoSlario
FROM empleadas;

SELECT *
FROM empleadas
WHERE salario > 
  (SELECT CASE
		      WHEN pais = "España" THEN 1000
              WHEN pais = "Francia" THEN 2000
              ELSE 1500
              END);