CREATE SCHEMA myapp;

USE myapp;

CREATE TABLE usuarios (
id 				INT UNSIGNED 		PRIMARY KEY AUTO_INCREMENT,
email 			VARCHAR(300) 		NOT NULL UNIQUE,
contrasenia 	VARCHAR(300) 		NOT NULL,
fecha 			DATE 				NOT NULL,
dni 			INT 				NOT NULL,
fotoperfil 		VARCHAR(300) 		NOT NULL,
createdAt 		TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
updatedAt 		TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 		TIMESTAMP 			NULL
);

CREATE TABLE productos (
id 						INT UNSIGNED 		PRIMARY KEY AUTO_INCREMENT,
usuarios_id 			INT UNSIGNED		NOT NULL,
imagen_producto 		VARCHAR(300)		NOT NULL,
nombre_producto 		VARCHAR(300)		NOT NULL,
descripcion_producto 	VARCHAR(300)		NOT NULL,
createdAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
updatedAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 				TIMESTAMP 			NULL,

FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
id 			INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT,
producto_id INT UNSIGNED 	NOT NULL,
usuarios_id INT UNSIGNED	NOT NULL,
comentario 	VARCHAR(300) 	NOT NULL,
createdAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
updatedAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 	TIMESTAMP 		NULL,

FOREIGN KEY (producto_id) REFERENCES productos(id),
FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

INSERT INTO usuarios 
VALUES (DEFAULT, 'joacopro@gmail.com', '1234', '2004-12-16', '46293228', 'linkfotoperfil', DEFAULT, DEFAULT )
INSERT INTO usuarios 
VALUES (DEFAULT, 'delfi@gmail.com', '1234', '2003-02-12', '41233248', 'linkfotoperfil', DEFAULT, DEFAULT )
INSERT INTO usuarios 
VALUES (DEFAULT, 'javi12@gmail.com', '1234', '2002-10-04', '34293448', 'linkfotoperfil', DEFAULT, DEFAULT )
INSERT INTO usuarios 
VALUES (DEFAULT, 'santiperez@gmail.com', '1234', '2006-03-16', '46293228', 'linkfotoperfil', DEFAULT, DEFAULT )
INSERT INTO usuarios 
VALUES (DEFAULT, 'sofia19@gmail.com', '1234', '2004-12-16', '46293228', 'linkfotoperfil', DEFAULT, DEFAULT )


















