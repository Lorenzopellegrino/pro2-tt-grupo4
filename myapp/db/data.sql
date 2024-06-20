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
VALUES (DEFAULT, 5, 'camiseta1', 'camiseta1', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'camiseta2', 'camiseta2', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'camiseta3', 'camiseta3', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'camiseta4', 'camiseta4', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'camiseta5', 'camiseta5', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'camiseta6', 'camiseta6', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'camiseta7', 'camiseta7', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'camiseta8', 'camiseta8', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'camiseta9', 'camiseta9', 'descripcion del producto');
INSERT INTO productos (id, usuariosId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 5, 'camiseta10', 'camiseta10', 'descripcion del producto');

/*SQL COMENTARIOS*/

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 3, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 1, 4, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 1, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 4, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 2, 4, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 3, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 1, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 3, 5, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 1, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 1, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 4, 2, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 3, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 5, 3, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 2, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 2, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 6, 3, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 4, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 1, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 7, 1, "comentario");

INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 2, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 2, "comentario");
INSERT INTO comentarios (id, productoId, usuariosId, comentario)
VALUES (DEFAULT, 8, 5, "comentario");

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









