-- Crear primero la tabla 'tipo_entradas'
CREATE TABLE IF NOT EXISTS tipo_entradas (
    id VARCHAR(36) NOT NULL,
    tipo VARCHAR(30),
    precio DECIMAL(10, 2),
    PRIMARY KEY (id)
);
 
-- Luego, crear la tabla 'entradas'
CREATE TABLE IF NOT EXISTS entradas (
    id VARCHAR(36) NOT NULL,
    fecha DATE,
    nombre VARCHAR(15),
    apellidos VARCHAR(30),
    telefono VARCHAR(9),
    tipo_entrada VARCHAR(36),
    cantidad INT,
    precio DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_entrada) REFERENCES tipo_entradas(id)
);
 
-- Insertar datos en 'tipo_entradas'
INSERT INTO tipo_entradas (id, tipo, precio) VALUES
(UUID(), 'Menor', 10),
(UUID(), 'Adulto', 5),
(UUID(), 'Jubilado', 7);