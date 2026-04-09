-- VER TODOS LOS CLIENTES:
SELECT * FROM clientes;

-- VER TODOS LOS TÉCNICOS:
SELECT * FROM tecnicos;

-- VER TODOS LOS EQUIPOS:
SELECT * FROM equipos;

-- VER TODOS LOS SERVICIOS:
SELECT * FROM servicios;

-- VER TODAS LAS ÓRDENES:
SELECT * FROM ordenes;

-- COMPROBAR CUÁNTOS CLIENTES HAY EN LA BASE DE DATOS:
SELECT COUNT(*) AS total_clientes FROM clientes;

-- COMRPROBAR QUÉ ÓRDENES ESTÁN PENDIENTES DE REALIZAR:
SELECT * FROM ordenes
WHERE estado = 'Pendiente';

-- COMPROBAR QUÉ EQUIPOS PERTENECEN A CADA CLIENTE:
SELECT e.tipo, e.marca, e.modelo, c.nombre, c.apellidos
FROM equipos e
JOIN clientes c ON e.id_cliente = c.id_cliente;

-- COMPROBAR QUÉ TÉCNICO SE LE HA ASIGNADO A UNA ORDEN Y A QUÉ CLIENTE CORRESPONDE:
SELECT o.id_orden, c.nombre AS cliente, t.nombre AS tecnico, o.fecha, o.estado
FROM ordenes o
JOIN clientes c ON o.id_cliente = c.id_cliente
LEFT JOIN tecnicos t ON o.id_tecnico = t.id_tecnico;

-- COMPROBAR QUÉ SE HA HECHO EN CADA ORDEN Y MOSTRAR EL PRECIO QUE SE COBRARÁ AL CLIENTE:
SELECT o.id_orden, s.tipo, s.descripcion, ds.precio_final
FROM detalle_servicios ds
JOIN ordenes o ON ds.id_orden = o.id_orden
JOIN servicios s ON ds.id_servicio = s.id_servicio;

-- COMPROBAR CUÁNTO SE HA FACTURADO EN CADA ORDEN:
SELECT ds.id_orden, SUM(ds.precio_final) AS total_orden
FROM detalle_servicios ds
GROUP BY ds.id_orden;

-- COMPROBAR QUÉ SERVICIOS SON MÁS CAROS QUE EL PROMEDIO:
SELECT * FROM servicios
WHERE precio_base > (
    SELECT AVG(precio_base) FROM servicios
);