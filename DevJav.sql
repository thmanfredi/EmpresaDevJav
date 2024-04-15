create database EmpresaDevJav;
use EmpresaDevJav;

/*Creando tablas*/
create table departamento(
	codDpto INT NOT NULL,
    nombreDpto VARCHAR(40) NOT NULL,
    ciudad VARCHAR(30),
    director INT,
    PRIMARY KEY (codDpto)
);

create table empleado(
	nDIEmp VARCHAR(20) NOT NULL,
    nomEmp VARCHAR(30) NOT NULL,
    sexEmp CHAR(1),
    fecNac DATE,
    fecIncorporacion DATE,
    salEmp DOUBLE,
    comis DOUBLE,
    cargo VARCHAR(40),
    nroDepto INT,
    PRIMARY KEY (nDIEmp),
    FOREIGN KEY (nroDepto) REFERENCES departamento(codDpto)
);

show tables;
INSERT INTO departamento (codDpto, nombreDpto, ciudad, director)
VALUES
    (1000, 'Gerencia', 'Buenos Aires', 31840269),
    (1001, 'Marketing', 'Santa Fe', 30860201),
    (1002, 'Producción', 'Rosario', 25654203),
    (1003, 'Finanzas', 'Cordoba', 27897200),
    (1004, 'Recursos Humanos', 'Santiago Del Estero', 26895650);
INSERT INTO empleado (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comis, cargo, nroDepto)
VALUES
    ('311178144', 'Rosa Angulo', 'F', '1957-03-15', '2022-08-16', 725000, 40000, 'Jefe de ventas', 1000),
    ('219874563', 'Marcelo Gimenez', 'M', '1985-07-22', '2010-12-05', 650000, 35000, 'Programador Backend', 1003),
    ('456789123', 'María Gómez', 'F', '1990-05-10', '2015-01-20', 600000, 25000, 'Programador Frontend', 1002),
    ('987654321', 'Alfredo Montes', 'M', '1980-12-03', '2005-09-10', 800000, 50000, 'Director', 1001),
    ('654321987', 'Analia Gonzalez', 'F', '1988-09-28', '2018-06-15', 700000, 30000, 'Gerente', 1000);

#Obtener los nombres de los empleados
SELECT nomEmp FROM empleado;

#Mostrar los datos completos de los departamentos
SELECT * FROM departamento;

#Obtener los datos de empleados con cargo Programador Backend
SELECT * FROM empleado WHERE cargo = 'Programador Backend';

#Mostrar la cantidad de empleados registrados
SELECT COUNT(*) AS cantidad_empleados FROM empleado;

#Sacar un promedio de salarios de empleados
SELECT AVG(salEmp) AS promedio_salarios FROM empleado;

#Muestra un listado de salarios y comisiones de los empleados del departamento Gerencia y Produccion
SELECT salEmp, comis FROM empleado WHERE nroDepto IN (1000, 1002);

#Calcular el valor a pagar a cada empleado si se realiza un incremento del 25% en su salario más una bonificacion de $20000, muestre una columna con el salario actual, otra con el incremento y otra con la suma de todo
SELECT salEmp AS salario_actual,
       salEmp * 0.25 AS incremento,
       salEmp * 1.25 + 20000 AS total_a_pagar
FROM empleado;

#Editar el salario realizando el incremento del punto anterior

SELECT nDIEmp,
       salEmp * 1.25 + 20000 AS nuevo_salario
FROM empleado;

UPDATE empleado
JOIN (
    SELECT nDIEmp,
           salEmp * 1.25 + 20000 AS nuevo_salario
    FROM empleado
) AS nuevos_salarios ON empleado.nDIEmp = nuevos_salarios.nDIEmp
SET empleado.salEmp = nuevos_salarios.nuevo_salario;

SELECT nDIEmp, nomEmp, salEmp FROM empleado;

#Modificar la ciudad "Buenos Aires" a la nueva ciudad "La Plata"
UPDATE departamento SET ciudad = 'La Plata' WHERE ciudad = 'Buenos Aires';
SELECT * FROM departamento WHERE ciudad = 'La Plata';

#Hallar el salario del empleado con identificaciom "219874563" y "311178144"
SELECT nDIEmp, salEmp FROM empleado WHERE nDIEmp IN ('219874563', '311178144');

#Muestre empleados donde el nombre empiece con la letra "A"
SELECT * FROM empleado WHERE nomEmp LIKE 'A%';



