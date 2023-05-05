create database modulo3_5; 

USE modulo3_5;

CREATE TABLE usuarios ( 
id_usuario INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(50) NOT NULL, 
apellido VARCHAR(50) NOT NULL, 
contraseña VARCHAR(50) NOT NULL, 
zona_horaria VARCHAR(50) DEFAULT 'UTC-3', 
genero VARCHAR(10) NOT NULL, 
telefono VARCHAR(20) NOT NULL, 
PRIMARY KEY (id_usuario)); 

 CREATE TABLE ingresos ( 
  id_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  id_usuario INT NOT NULL, 
  fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP, 
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 

); 

ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2'; 

INSERT INTO usuarios (nombre, apellido, contraseña, genero, telefono) VALUE 
('Tom', 'Hanks', '123456', 'Masculino', '+56912345678'), 
('Meryl', 'Streep', 'abcdef', 'Femenino', '+56923456789'), 
('Denzel', 'Washington', 'ghijkl', 'Masculino', '+56934567890'), 
('Julia', 'Roberts', 'mnopqr', 'Femenino', '+56945678901'), 
('Brad', 'Pitt', 'stuvwx', 'Masculino', '+56956789012'), 
('Emma', 'Stone', 'yzabcd', 'Femenino', '+56967890123'), 
('Leonardo', 'DiCaprio', 'efghij', 'Masculino', '+56978901234'), 
('Jennifer', 'Lawrence', 'klmnop', 'Femenino', '+56989012345'); 

INSERT INTO ingresos (id_usuario) VALUE 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

ALTER TABLE usuarios DROP COLUMN telefono; 

CREATE TABLE Contactos ( 
  id_contacto INT NOT NULL AUTO_INCREMENT, 
  id_usuario INT NOT NULL, 
  telefono VARCHAR(20) NOT NULL, 
  correo_electronico VARCHAR(50) NOT NULL, 
  PRIMARY KEY (id_contacto), 
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 
); 

/*
id_usuario se utiliza como clave primaria y es de tipo INT, no se puede dejar en blanco y se autoincrementa
 es un identificador único de cada usuario y no se espera que tenga valores negativos o decimales. 
 
nombre y apellido=nombre y apellido son de tipo VARCHAR(50) porque se espera que los nombres y apellidos no 
tengan una longitud mayor a 50 caracteres y pueden incluir letras, números y caracteres especiales. 

contraseña=es de tipo VARCHAR(50) porque se espera que la contraseña no tenga una longitud mayor a 50
caracteres para permitir contraseñas seguras con caracteres especiales.

zona_horaria=es de tipo VARCHAR(50) porque se espera que la zona horaria sea una cadena de texto de hasta
50 caracteres que represente la diferencia de horas entre la hora local y UTC, por ejemplo "-03:00". 

genero=es de tipo CHAR(10) porque se espera que tenga un valor de (masculino, femenino, otro) y no se espera 
que tenga valores nulos.

telefono=es de tipo VARCHAR(20) porque se espera que el número de teléfono pueda incluir caracteres especiales 
como paréntesis, guiones y espacios, y no se espera que tenga una longitud mayor a 20 caracteres. 

id_ingreso=se utiliza como clave primaria y es de tipo INT porque es un identificador único de cada ingreso y no se espera que 
tenga valores negativos o decimales. 

id_usuario=es de tipo INT y se utiliza como clave foránea que hace referencia al campo id_usuario en la tabla Usuarios.

fecha_hora_ingreso=el tipo de datos más adecuado es TIMESTAMP o DATETIME, ya que permite almacenar fechas y horas de forma 
precisa y permite realizar operaciones matemáticas y de comparación con facilidad.

correo_electronico=el tipo de datos más adecuado es VARCHAR o TEXT, ya que los correos electrónicos son cadenas de texto que 
pueden tener una longitud variable. Además, los correos electrónicos pueden incluir caracteres especiales como '@' y '.' que son 
importantes para el reconocimiento del correo electrónico, y que se pueden almacenar correctamente en campos de texto.
*/