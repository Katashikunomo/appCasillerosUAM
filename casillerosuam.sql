create database casillerosuam;
use casillerosuam;

CREATE TABLE division (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_division_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuario (
    id BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    rol ENUM('ALUMNO','ADMIN') NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE casillero (
    id BIGINT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    division_id BIGINT NOT NULL,
    estado ENUM('LIBRE','OCUPADO') NOT NULL DEFAULT 'LIBRE',
    PRIMARY KEY (id),
    CONSTRAINT fk_casillero_division
        FOREIGN KEY (division_id)
        REFERENCES division(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE asignacion (
    id BIGINT NOT NULL AUTO_INCREMENT,
    usuario_id BIGINT NOT NULL,
    casillero_id BIGINT NOT NULL,
    fecha_solicitud DATETIME NOT NULL,
    fecha_asignacion DATETIME NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_asignacion_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_asignacion_casillero
        FOREIGN KEY (casillero_id)
        REFERENCES casillero(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

