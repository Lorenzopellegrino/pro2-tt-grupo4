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

/*SQL USUARIOS*/

INSERT INTO usuarios (id, email, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'joacopro@gmail.com', '1234', '2004-12-16', '46293228', 'usuario1foto', DEFAULT, DEFAULT )
INSERT INTO usuarios (id, email, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'delfi@gmail.com', '1234', '2003-02-12', '41233248', 'usuario2foto', DEFAULT, DEFAULT )
INSERT INTO usuarios (id, email, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'javi12@gmail.com', '1234', '2002-10-04', '34293448', 'usuario3foto', DEFAULT, DEFAULT )
INSERT INTO usuarios (id, email, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'santiperez@gmail.com', '1234', '2006-03-16', '46293228', 'usuario4foto', DEFAULT, DEFAULT )
INSERT INTO usuarios (id, email, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'sofia19@gmail.com', '1234', '2004-12-16', '46293228', 'usuario5foto', DEFAULT, DEFAULT )

/*SQL PRODUCTOS*/

INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 5, '', 'camiseta1', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 1, '', 'camiseta2', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 2, '', 'camiseta3', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 3, '', 'camiseta4', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 4, '', 'camiseta5', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 1, '', 'camiseta6', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 2, '', 'camiseta7', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 3, '', 'camiseta8', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 4, '', 'camiseta9', 'descripcion del producto')
INSERT INTO productos (id, usuarios_id, imagen_producto, descripcion_producto)
VALUES (DEFAULT, 5, '', 'camiseta10', 'descripcion del producto')

/*SQL COMENTARIOS*/

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 1, 5, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 1, 3, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 1, 4, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 2, 1, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 2, 4, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 2, 4, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 3, 3, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 3, 1, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 3, 5, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 4, 1, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 4, 1, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 4, 2, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 5, 5, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 5, 3, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 5, 3, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 6, 2, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 6, 2, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 6, 3, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 7, 4, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 7, 1, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 7, 1, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 8, 2, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 8, 2, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 8, 5, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 9, 5, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 9, 5, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 9, 1, "comentario")

INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 10, 5, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 10, 3, "comentario")
INSERT INTO comentarios (id, producto_id, usuarios_id, comentario)
VALUES (DEFAULT, 10, 4, "comentario")









