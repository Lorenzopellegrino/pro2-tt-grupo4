CREATE SCHEMA myapp;

USE myapp;

CREATE TABLE usuarios (
id 				INT UNSIGNED 		PRIMARY KEY AUTO_INCREMENT,
email 			VARCHAR(300) 		NOT NULL UNIQUE,
usuario          VARCHAR(300)        NOT NULL,
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
usuarioId 			    INT UNSIGNED		NOT NULL,
imagenProducto 		    VARCHAR(300)		NOT NULL,
nombreProducto 		    VARCHAR(300)		NOT NULL,
descripcionProducto 	VARCHAR(300)		NOT NULL,
createdAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
updatedAt 				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 				TIMESTAMP 			NULL,

FOREIGN KEY (usuarioId) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
id 			INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT,
productoId  INT UNSIGNED 	NOT NULL,
usuarioId  INT UNSIGNED	NOT NULL,
comentario 	VARCHAR(300) 	NOT NULL,
createdAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
updatedAt 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt 	TIMESTAMP 		NULL,

FOREIGN KEY (productoId) REFERENCES productos(id),
FOREIGN KEY (usuarioId) REFERENCES usuarios(id)
);

/*SQL USUARIOS*/

INSERT INTO usuarios (id, email, usuario, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'joacopro@gmail.com', "joaco", '1234', '2004-12-16', '46293228', 'usuario1foto' );
INSERT INTO usuarios (id, email, usuario, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'delfi@gmail.com', "delfi", '1234', '2003-02-12', '41233248', 'usuario2foto' );
INSERT INTO usuarios (id, email, usuario, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'javi12@gmail.com', "javi", '1234', '2002-10-04', '34293448', 'usuario3foto' );
INSERT INTO usuarios (id, email, usuario, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'santiperez@gmail.com', "santi", '1234', '2006-03-16', '46293228', 'usuario4foto');
INSERT INTO usuarios (id, email, usuario, contrasenia, fecha, dni, fotoperfil)
VALUES (DEFAULT, 'sofia19@gmail.com', "sofia", '1234', '2004-12-16', '46293228', 'usuario5foto');

/*SQL PRODUCTOS*/

INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 5, 'https://marcadegol.com/fotos//2014/05/Arsenal-Nike-2002_03.gif', 'Arsenal Local - 2005', 'Camiseta historica del conjunto Gunner, muchos se acordaran de Hienry al verla');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRLRCn6OEpQSZ9-C7knTh9oUv3KDo1M2qRTw&s', 'Barcelona Alternativa - 2009', 'Iconica remera donde el conjunto dirigido por Pep Guardiola logro el primer sextete de la historia del futbol');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'https://acdn.mitiendanube.com/stores/004/407/775/products/2-7f0ab4fbcafc6e997417149614782058-1024-1024.png', 'Manchester United Local - 2008', 'Muchos recordaran a un joven Ronaldo volando por los aires en su primera final de champions');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'https://www.digitalsport.com.ar/files/products/642e6c44ba55a-572261-500x500.jpg', 'Manchester City Local - 2023', 'Remera que logro la primera champions en la historia del City, de la mano de Pep Guardiola');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQtkPeqD39LWrSAdxNV9lDXa2pVWHdh0ctrw&s', 'Argentina Local - 1986', 'Gloriosa remera Argentina que en Mexico logro dar la vuelta y convertirse por segunda vez en campeon mundial ');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 1, 'https://www.thesoccerpark.com/cdn/shop/products/MILANUCLFINAL06-07.jpg?v=1663163599', 'Milan Visitante - 2007', 'El conjunto Italiano logro una champions con esta remera, donde un joven jugador brasileño logro dejarla marcada en la historia ¿Sabes quien es? Comentalo!');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 2, 'https://acdn.mitiendanube.com/stores/002/042/897/products/e-real-17-181-b7a8ae019952e960d116776411982552-640-0.jpg', 'Real Madrid Alternativa - 2018', 'CR7 logro hacer el mejor gol de su carrera con esta remera');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 3, 'https://soccershopuy.net/cdn/shop/products/liverpool_2005_480x480_6c919ef0-4a7c-4dcc-b603-1637649ebd33_480x480.jpg?v=1642281061', 'Liverpool Local - 2005', 'Remera que dio al mejor partido de futbol para muchos, imposible no recordarse de esa iconica remontada al Milan para lograr ganar la Final');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 4, 'https://acdn.mitiendanube.com/stores/002/292/348/products/2641e0101-24a7d3e0d6191d241c16726911392167-240-0.jpg', 'Camiseta Barcelona 2012', 'Camiseta historica de Barcelona');
INSERT INTO productos (id, usuarioId, imagenProducto, nombreProducto, descripcionProducto)
VALUES (DEFAULT, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvw9d6hUfmiya245r-WaLBcWNkqZP9r_wf4A&s', 'Camiseta Juventus', 'Historica camiseta de Juventus');

/*SQL COMENTARIOS*/

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 1, 5, "Hermosa");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 1, 3, "Muy Buena");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 1, 4, "Que linda");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 2, 1, "Que recuerdos");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 2, 4, "La QUIEROOO");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 2, 4, "Recomendada");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 3, 3, "La compre y es la mejor");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 3, 1, "Perfecta");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 3, 5, "Linda");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 4, 1, "Hermosa");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 4, 1, "10/10");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 4, 2, "Puffff");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 5, 5, "Sin palabras");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 5, 3, "Que detalles!!");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 5, 3, "Muy buena");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 6, 2, "Que mas decir");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 6, 2, "Iconica");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 6, 3, "comentario");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 7, 4, "Perfecta");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 7, 1, "Hermosa");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 7, 1, "Linda");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 8, 2, "Ese color!");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 8, 2, "recomendable");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 8, 5, "sin duda la mejor");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 9, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 9, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 9, 1, "comentario");

INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 10, 5, "comentario");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 10, 3, "comentario");
INSERT INTO comentarios (id, productoId, usuarioId, comentario)
VALUES (DEFAULT, 10, 4, "comentario");









