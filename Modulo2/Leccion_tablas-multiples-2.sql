-- UNION: Juntar queries - Extraer las filas de tablas sumada- Sin duplicados
-- UNION ALL: Extraer todas las filas (como un DISTINCT)
-- IN: Incluir valores dentro un WHERE
-- NOT IN
-- LIKE: Buscar patrones (regex simplificado
-- NOT LIKE
-- REGEXP
-- CONCAT

USE northwind;

SELECT * FROM customers;
SELECT city FROM customers;

SELECT * FROM employees;
SELECT city FROM employees;



SELECT city FROM customers
UNION
SELECT city FROM employees;

SELECT city FROM customers
UNION ALL
SELECT city FROM employees;

SELECT customer_id FROM customers
UNION ALL
SELECT city FROM employees; -- una union sin sentido!

SELECT contact_name FROM customers;
-- SELECT * FROM employees;

SELECT first_name, last_name FROM employees;

SELECT contact_name FROM customers
UNION
SELECT CONCAT(first_name ," ",last_name) FROM employees;

SELECT * FROM products;
SELECT * FROM categories;

SELECT * FROM products
INNER JOIN categories
ON products.category_id = categories.category_id;

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id;

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name = "Condiments";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name IN ("Condiments","Beverages");

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name NOT IN ("Condiments","Beverages");

-- LIKE
SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "S%";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "%y";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "%y%";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "D______________%";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "S";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name LIKE "S%";

SELECT p.category_id, p.product_name, p.unit_price, c.category_name 
FROM products AS p
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE c.category_name REGEXP "S";


