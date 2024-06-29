-- CTE: una tabla que creamos para usar solo en la consulta que estamos escribiendo.(tabla temporal)

USE tienda;
-- Sintasis CTE
WITH clientas AS (SELECT * FROM customers)
SELECT * FROM clientas AS c;

SELECT * FROM clientas; -- da error porque no conoce la tabla clientas en esta consulta

WITH clientas AS (SELECT customer_number, customer_name FROM customers)
SELECT * FROM clientas;

-- --- -- Ejemplo CTE

select * , 'muchos' as cantidad from products
inner join product_lines
using (product_line)
where quantity_in_stock > 5000

union all 

select * , 'pocos' as cantidad from products
inner join product_lines
using (product_line)
where quantity_in_stock <= 5000;

-- Hacer lo mismo de arriba utilizando CTE

WITH productjoin AS (SELECT * FROM products INNER JOIN product_lines USING(product_line))

SELECT *, 'pocos' as cantidad FROM productjoin WHERE quantity_in_stock <= 5000
UNION ALL
SELECT *, 'muchos' as cantidad FROM productjoin WHERE quantity_in_stock > 5000;


