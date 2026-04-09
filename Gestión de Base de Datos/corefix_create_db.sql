-- CREAR BASE DE DATOS:
CREATE DATABASE corefix_solutions;
USE corefix_solutions;

-- TABLA CLIENTES:
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

-- TABLA TÉCNICOS:
CREATE TABLE tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15)
);

-- TABLA EQUIPOS:
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- TABLA SERVICIOS:
CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL
);

-- TABLA ÓRDENES:
CREATE TABLE ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tecnico INT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(50),

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- TABLA INTERMEDIA (N:M):
CREATE TABLE detalle_servicios (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    id_servicio INT NOT NULL,
    precio_final DECIMAL(10,2),

    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);