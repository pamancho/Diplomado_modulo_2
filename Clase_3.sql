use jarvis;

-- INNER JOIN PARA UNIR LOS ELEMENTOS QUE ESTAN EN AMBAS TABLAS
SELECT * 
FROM PRODUCTOS AS PROD
INNER JOIN TIPO_PRODUCTO AS TPR ON PROD.TIPO_PRODUCTO_ID  =TPR.ID;

-- CONTAR LOS CLIENTES REPETIDOS
SELECT *
FROM (SELECT NOMBRE, COUNT(*) as CONTEO
FROM CLIENTES
GROUP BY NOMBRE) as C
WHERE C.CONTEO >1;

-- CONTANDO CLIENTES
SELECT COUNT(*) as CUENTA
FROM CLIENTES;

-- CONTANDO CLIENTES UNICOS
SELECT COUNT(DISTINCT(NOMBRE)) as CUENTA
FROM CLIENTES; 

-- LEFT JOIN PARA UNIR ELEMENTOS QUE ESTAN EN LA TABLA A Y RELLENAR CON NULL AQUELLOS QUE NO TIENEN VALOR EN LA TABLA B
-- EN ESTE CASO PARA VER TODOS LOS CLIENTES, INCLUYENDO LOS QUE NO TIENEN COMPRAS
SELECT *
FROM CLIENTES as CLI
LEFT JOIN COMPRAS as COM ON CLI.ID =COM.CLIENTE_ID;

-- AHORA SOLO QUIERO QUE MUESTRE LOS QUE NO HAN COMPRADO NADA
SELECT *
FROM CLIENTES as CLI
LEFT JOIN COMPRAS as COM ON CLI.ID =COM.CLIENTE_ID
WHERE COM.ID IS NULL;

-- AHORA SOLO QUIERO QUE MUESTRE LOS QUE HAN COMPRADO 
-- ESTO ES LO MISMO QUE HACER UN INNER JOIN
SELECT *
FROM CLIENTES as CLI
LEFT JOIN COMPRAS as COM ON CLI.ID =COM.CLIENTE_ID
WHERE COM.ID IS NOT NULL;

-- FULL OUTER JOIN, UNIR TODO TODILLO
SELECT *
FROM CLIENTES as CLI
LEFT JOIN COMPRAS as COM ON CLI.ID = COM.CLIENTE_ID 
LEFT JOIN DETALLE_COMPRA as DC ON COM.ID = DC.COMPRA_ID 
LEFT JOIN PRODUCTOS as PRO ON DC.PRODUCTO_ID = PRO.ID 
UNION ALL 
SELECT *
FROM CLIENTES as C
INNER JOIN COMPRAS as CO ON C.ID =CO.CLIENTE_ID 
INNER JOIN DETALLE_COMPRA as DC2 ON CO.ID = DC2.COMPRA_ID 
RIGHT JOIN PRODUCTOS as P ON DC2.PRODUCTO_ID = P.ID;

-- GROUP BY
SELECT COUNT(*) AS Q_PAISES, PAIS
FROM CLIENTES
GROUP BY PAIS 
ORDER BY Q_PAISES DESC;

-- CREAR UNA TABLA DESDE UNA QUERY
CREATE TABLE jarvis.FVB
AS (
SELECT COUNT(*) AS Q_PAISES, PAIS
FROM CLIENTES
GROUP BY PAIS 
ORDER BY Q_PAISES DESC
);

