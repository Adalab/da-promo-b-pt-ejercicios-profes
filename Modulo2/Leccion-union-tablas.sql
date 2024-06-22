-- Joins (Union Tablas)
-- -- CROSS JOIN
-- -- NATURAL JOIN
-- -- INNER JOIN
-- -- LEFT JOIN
-- -- RIGHT JOIN
-- -- FULL JOIN
-- -- SELF JOIN

SELECT * FROM empleadas;
SELECT * FROM empleadasenproyectos;

SELECT 
em.nombre, 
ep.id_proyecto
FROM empleadas as em
CROSS JOIN empleadasenproyectos as ep;

SELECT * FROM empleadas as em 
CROSS JOIN empleadasenproyectos as ep;

SELECT * FROM empleadas as em
CROSS JOIN empleadasenproyectos as ep
WHERE em.id_empleada = ep.id_empleada;

SELECT * FROM empleadas as em
NATURAL JOIN empleadasenproyectos as ep;

SELECT * FROM empleadas as em
INNER JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;


SELECT em.id_empleada, em.nombre, ep.id_proyecto FROM empleadas as em
INNER JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;

SELECT * FROM empleadas as em
LEFT JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;


SELECT * FROM empleadas as em
RIGHT JOIN empleadasenproyectos as ep
ON em.id_empleada = ep.id_empleada;

SELECT nombre, apellido, em.id_empleada FROM empleadasenproyectos as ep
LEFT JOIN empleadas as em
ON em.id_empleada = ep.id_empleada;

SELECT em1.nombre, em2.apellido FROM empleadas as em1, empleadas as em2;


USE tienda;

SELECT * FROM customers LIMIT 20;
SELECT * FROM orders LIMIT 20;

SELECT ct.customer_name, ct.customer_number,ct.city, od.* FROM customers as ct 
NATURAL JOIN orders as od
WHERE od.status <> "Shipped" AND  ct.city = "Madrid"
LIMIT 10;

SELECT ct.customer_name, ct.customer_number,ct.city, od.* FROM customers as ct 
INNER JOIN orders as od
ON ct.customer_number = od.customer_number
WHERE od.status != "Shipped" AND  ct.city = "Madrid"
LIMIT 10;


SELECT * FROM customers as ct 
LEFT JOIN payments as pt
ON ct.customer_number = pt.customer_number
WHERE pt.customer_number IS NULL