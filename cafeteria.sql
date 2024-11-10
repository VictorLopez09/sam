CREATE TABLE CATALOGO_PUESTOS (
    id_puesto VARCHAR(6) PRIMARY KEY,
    nombre_puesto VARCHAR(35)
);

CREATE TABLE ALIMENTOS_BEBIDAS (
    id_alimentos_bebidas VARCHAR(6) PRIMARY KEY,
    categoria VARCHAR(35)
);

CREATE TABLE PRODUCTOS (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    id_alimentos_bebidas VARCHAR(6),
    FOREIGN KEY (id_alimentos_bebidas) REFERENCES ALIMENTOS_BEBIDAS(id_alimentos_bebidas)
);

CREATE TABLE EMPLEADOS (
    id_empleado SERIAL PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    id_puesto VARCHAR(6),
    contrasena VARCHAR(255),
    FOREIGN KEY (id_puesto) REFERENCES CATALOGO_PUESTOS(id_puesto)
);

CREATE TABLE COMANDAS (
    id_comanda SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    monto FLOAT NOT NULL,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADOS(id_empleado)
);

CREATE TABLE DETALLE_COMANDA (
    id_detalle SERIAL PRIMARY KEY,
    id_producto INT,
    id_comanda INT,
    cantidad INT NOT NULL,
    precio_final DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto),
    FOREIGN KEY (id_comanda) REFERENCES COMANDAS(id_comanda)
);

INSERT INTO CATALOGO_PUESTOS (id_puesto, nombre_puesto) VALUES
('1', 'ADMINISTRADOR'),
('2', 'CONTADOR'),
('3', 'CAJERO/A'),
('4', 'ENCARGADO BARRA'),
('5', 'ENCARGADO COCINA'),
('6', 'AUXILIAR BARRA'),
('7', 'AUXILIAR COCINA'),
('8', 'INTENDENCIA'),
('9', 'VIGILANCIA');

INSERT INTO ALIMENTOS_BEBIDAS (id_alimentos_bebidas, categoria) VALUES
('A00001', 'DESAYUNOS'),
('B00001', 'BEBIDAS EMBOTELLADAS'),
('A00002', 'SNACKS'),
('A00003', 'COMIDAS'),
('A00004', 'POSTRES'),
('B00002', 'LACTEOS'),
('B00003', 'AGUAS FRESCAS'),
('B00004', 'CAFÉ Y TÉ'),
('B00005', 'BEBIDAS ENERGIZANTES');

INSERT INTO PRODUCTOS (nombre_producto, precio, id_alimentos_bebidas) VALUES
('Huevos con Jamón', 50.00, 'A00001'), -- Desayunos
('Torta de Pollo', 70.00, 'A00003'),   -- Comidas
('Brownie', 30.00, 'A00004'),          -- Postres
('Coca-Cola 600ml', 20.00, 'B00001'),  -- Bebidas Embotelladas
('Yogurt Natural', 25.00, 'B00002'),   -- Lácteos
('Café Americano', 15.00, 'B00004');   -- Café y Té

INSERT INTO EMPLEADOS (primer_nombre, apellido_paterno, apellido_materno, email, telefono, id_puesto) VALUES
('Laura', 'García', 'López', 'laura.garcia@example.com', '5551239876', '2'),
('Carlos', 'Sánchez', 'Martínez', 'carlos.sanchez@example.com', '5559871234', '4'),
('María', 'Hernández', 'Pérez', 'maria.hernandez@example.com', '5553216549', '7'),
('Luis', 'Ramírez', 'Torres', 'luis.ramirez@example.com', '5558765432', '1'),
('Patricia', 'Gómez', 'Vargas', 'patricia.gomez@example.com', '5555679876', '3'),
('Andrés', 'Castillo', 'Sosa', 'andres.castillo@example.com', '5551122334', '6'),
('Fernanda', 'Flores', 'Ríos', 'fernanda.flores@example.com', '5554433221', '8'),
('Roberto', 'Navarro', 'Ortega', 'roberto.navarro@example.com', '5556549871', '5'),
('Sofía', 'Díaz', 'Serrano', 'sofia.diaz@example.com', '5551234569', '9'),
('Jorge', 'Moreno', 'Espinoza', 'jorge.moreno@example.com', '5557788996', '4'),
('Mónica', 'Rivera', 'Suárez', 'monica.rivera@example.com', '5559988776', '2'),
('Guillermo', 'Ortiz', 'Rivas', 'guillermo.ortiz@example.com', '5553344556', '1'),
('Alejandro', 'Luna', 'Reyes', 'alejandro.luna@example.com', '5552211003', '7'),
('Gabriela', 'Cruz', 'Romero', 'gabriela.cruz@example.com', '5555544333', '6'),
('Ricardo', 'Vega', 'Palacios', 'ricardo.vega@example.com', '5557766554', '5'),
('Elena', 'Núñez', 'Cabrera', 'elena.nunez@example.com', '5558899004', '9'),
('Raúl', 'Cortés', 'López', 'raul.cortes@example.com', '5554432112', '8'),
('Isabel', 'Mendoza', 'Zamora', 'isabel.mendoza@example.com', '5551122773', '3');

INSERT INTO COMANDAS (fecha, hora, monto, id_empleado) VALUES
('2024-09-08', '12:30:00', 100.00, 1),
('2024-09-08', '13:45:00', 150.00, 2);

INSERT INTO DETALLE_COMANDA (id_producto, id_comanda, cantidad, precio_final) VALUES
(1, 1, 2, 50.00 * 2),
(4, 1, 1, 20.00 * 1),
(3, 2, 3, 30.00 * 3);




