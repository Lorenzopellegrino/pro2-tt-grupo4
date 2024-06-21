CREATE SCHEMA myapp;

USE myapp;

CREATE TABLE usuarios (
id 				INT UNSIGNED 		PRIMARY KEY AUTO_INCREMENT,
email 			VARCHAR(300) 		NOT NULL UNIQUE,
nombre          VARCHAR(300)        NOT NULL,
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
usuariosId 			    INT UNSIGNED		NOT NULL,
imagenProducto 		    VARCHAR(300)		NOT NULL,
nombreProducto 		    VARCHAR(300)		NOT NULL,
descripcionProducto 	VARCHAR(300)		NOT NULL,
createdAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
updatedAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 				TIMESTAMP 			NULL,

FOREIGN KEY (usuariosId) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
id 			INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT,
productoId  INT UNSIGNED 	NOT NULL,
usuariosId  INT UNSIGNED	NOT NULL,
comentario 	VARCHAR(300) 	NOT NULL,
createdAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
updatedAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 	TIMESTAMP 		NULL,

FOREIGN KEY (productoId) REFERENCES productos(id),
FOREIGN KEY (usuariosId) REFERENCES usuarios(id)
);

/*SQL USUARIOS*/

INSERT INTO usuarios (id, email, nombre, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'joacopro@gmail.com', "joaco", '1234', '2004-12-16', '46293228', 'usuario1foto' );
INSERT INTO usuarios (id, email, nombre, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'delfi@gmail.com', "delfi", '1234', '2003-02-12', '41233248', 'usuario2foto' );
INSERT INTO usuarios (id, email, nombre, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'javi12@gmail.com', "javi", '1234', '2002-10-04', '34293448', 'usuario3foto' );
INSERT INTO usuarios (id, email, nombre, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'santiperez@gmail.com', "santi", '1234', '2006-03-16', '46293228', 'usuario4foto');
INSERT INTO usuarios (id, email, nombre, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'sofia19@gmail.com', "sofia", '1234', '2004-12-16', '46293228', 'usuario5foto');

/*SQL PRODUCTOS*/

INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 5, 'https://acortar.link/gmdmNN', 'Arsenal Local - 2005', 'Camiseta historica del conjunto Gunner, muchos se acordaran de Hienry al verla');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'https://acortar.link/tHnnMq', 'Barcelona Alternativa - 2009', 'Iconica remera donde el conjunto dirigido por Pep Guardiola logro el primer sextete de la historia del futbol');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'https://acortar.link/syFPJL', 'Manchester United Local - 2008', 'Muchos recordaran a un joven Ronaldo volando por los aires en su primera final de champions');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'https://acortar.link/fREUVq', 'Manchester City Local - 2023', 'Remera que logro la primera champions en la historia del City, de la mano de Pep Guardiola');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'https://acortar.link/x51vQR', 'Argentina Local - 1986', 'Gloriosa remera Argentina que en Mexico logro dar la vuelta y convertirse por segunda vez en campeon mundial ');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'https://acortar.link/tjxFqp', 'Milan Visitante - 2007', 'El conjunto Italiano logro una champions con esta remera, donde un joven jugador brasileño logro dejarla marcada en la historia ¿Sabes quien es? Comentalo!');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'https://acortar.link/ZapqIH', 'Real Madrid Alternativa - 2018', 'CR7 logro hacer el mejor gol de su carrera con esta remera');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'https://acortar.link/RijfLh', 'Liverpool Local - 2005', 'Remera que dio al mejor partido de futbol para muchos, imposible no recordarse de esa iconica remontada al Milan para lograr ganar la Final');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'camiseta9', 'camiseta9', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 5, 'camiseta10', 'camiseta10', 'descripcion del producto');

/*SQL COMENTARIOS*/

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 5, "Hermosa");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 3, "Muy Buena");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 4, "Que linda");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 1, "Que recuerdos");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 4, "La QUIEROOO");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 4, "Recomendada");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 3, "La compre y es la mejor");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 1, "Perfecta");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 5, "Linda");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 1, "Hermosa");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 1, "10/10");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 2, "Puffff");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 5, "Sin palabras");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 3, "Que detalles!!");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 3, "Muy buena");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 2, "Que mas decir");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 2, "Iconica");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 3, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 4, "Perfecta");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 1, "Hermosa");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 1, "Linda");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 2, "Ese color!");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 2, "recomendable");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 5, "sin duda la mejor");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 9, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 9, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 9, 1, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 10, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 10, 3, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 10, 4, "comentario");









