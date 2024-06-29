USE tienda;


SELECT city, COUNT(customer_number) AS clientasporciudad
FROM customers
GROUP BY city;

/*EJERCICIO 2:
Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.
*/

SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) = 5;

SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL (SELECT COUNT(customer_number) AS clientasporciudad
FROM customers
GROUP BY city);

/*EJERCICIO 3:
Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido
 de las clientas asignadas a la ciudad con mayor numero de clientas.
*/

SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN ("NYC","Madrid");

SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN (SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL (SELECT COUNT(customer_number) AS clientasporciudad
FROM customers
GROUP BY city));

-- resolver el ejercicio de arriba utilizando CTE:

WITH ciudadconmasclientas AS (SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL (SELECT COUNT(customer_number) AS clientasporciudad
FROM customers
GROUP BY city))

SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN (SELECT * FROM ciudadconmasclientas);