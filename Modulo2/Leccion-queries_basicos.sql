SELECT nombre
FROM alumnas;

SELECT nombre, apellido
FROM alumnas;

SELECT *
FROM alumnas;  --  o Clase.alumna

SELECT nombre, apellido, pais
FROM alumnas
WHERE pais = "Francia";

SELECT nombre, apellido
FROM alumnas
WHERE pais = "España"
AND nombre = "Ana";

SELECT nombre, apellido, ciudad
FROM alumnas
WHERE ciudad = "Barcelona"
OR ciudad = "Valencia";

SELECT nombre, apellido, ciudad
FROM alumnas
WHERE NOT ciudad = "Barcelona";

-- > < >= <= = <>

SELECT ciudad, pais
FROM alumnas
WHERE telefono <> 6047687;

SELECT nombre, apellido, email
FROM alumnas
WHERE ciudad IS NULL;

SELECT *
FROM alumnas
WHERE pais IS NULL;

SELECT *
FROM alumnas
WHERE pais IS NOT NULL;

SELECT * 
FROM alumnas
ORDER BY nombre;

SELECT nombre, pais
FROM alumnas
WHERE pais = "España"
ORDER BY nombre DESC ;

SELECT DISTINCT pais
FROM alumnas;

SELECT * 
FROM alumnas
ORDER BY nombre
LIMIT 3;

SELECT * 
FROM alumnas
LIMIT 3
OFFSET 2;

SELECT nombre, apellido, ciudad
FROM alumnas
WHERE ciudad IN ("Barcelona","Valencia");

SELECT nombre, apellido, ciudad
FROM alumnas
WHERE ciudad NOT IN ("Barcelona","Valencia");

SELECT id_alumna, nombre, ciudad
FROM alumnas
WHERE id_alumna BETWEEN 3 AND 5;

SELECT nombre AS nom, apellido AS ape
FROM alumnas;

SELECT nombre, apellido
FROM alumna as a
