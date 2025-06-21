INSERT INTO tipo_usuario(rol_usuario) values 
('CLIENTE'), 
('JEFE'), 
('ADMIN');

INSERT INTO public.usuario(correo_usuario, password_usuario, nombre_usuario, id_tipo_usuario) values
('carlossz@gmail.com', 'leclerc','carlossz', 1),
('marta.solis@yahoo.cl', 'Pelusa.2015', 'martit4', 1),
('niko.xd@gmail.com', 'lupepona', 'Nicolas.Admin', 3),
('feliperjas@gmail.com', 'drowssap234', 'Felipe.Rojas', 2),
('Guada.Lupe@gmail.com', 'ricopan7', 'Lupe.R', 1),
('marco.ortz@gmail.com', 'm4rk0.00', 'marcOo', 1),
('sofiaalarcon@gmail.com', '24111988', 'Sofi_A', 1),
('Sebastianpolar@gmail.com', 'colocolo91', 'SebaPolar', 1);


insert into producto (url_producto, stock, descripcion, cantidad_ventas, precio)
values ('https://www.locura.cl/producto/juego-de-cartas/uno', 20, 'Juego familiar donde las cartas son de cierto número y color', 230, 3500),
('https://www.cardcastle.cl/producto/juego-de-cartas/naipe-ingles', 15, 'Mazo de naipe inglés, para jugar poker, carioca y muchos más juegos', 300, 3000),
('https://www.locura.cl/producto/juego-de-cartas/blackjack-21', 30, 'Popular juego de casinos', 120, 5000),
('https://www.cardcastle.cl/producto/juego-de-cartas/yu-gi-oh!', 20, 'Juego de cartas basado en el anime Yu-Gi-Oh!', 100, 4000),
('https://www.buggy.cl/producto/juego-de-mesa/monopoly', 10, 'Juego donde simulas negocios y propiedades', 500, 20000),
('https://www.buggy.cl/producto/juego-de-mesa/catan', 15, 'Juego de estrategia, comercio y civilización', 200, 25000),
('https://www.hasbro.cl/producto/juego-de-mesa/jenga', 14, 'Juego de habilidad física y precisión', 190, 15000),
('https://www.hasbro.cl/producto/juego-de-mesa/ajedrez', 10, 'Juego de estrategia por excelencia', 540, 10000),
('https://www.hasbro.cl/producto/juego-de-mesa/damas', 16, 'Juego de captura y movimiento diagonal', 290, 9000);



INSERT into ranking (fecha_actualizacion, posicion_ranking)
values('2025-06-20 00:00:00', 1),
('2025-06-19 00:00:00', 2),
('2025-06-18 00:00:00', 3),
('2025-06-17 00:00:00', 4),
('2025-06-16 00:00:00', 5);


insert into juego_de_mesa (nombre_juego, cantidad_de_jugadores)
values ('Monopoly', 6),
('Catán', 4),
('Yenga', 4),
('Ajedréz', 2),
('Damas', 2);


insert into valoracion (review, cantidad_estrellas)
values ('Un clásico familiar que nunca falla. Las reglas son fáciles de entender y siempre terminamos riéndonos mucho. Ideal para jugar con niños, aunque los adultos también lo disfrutan. Muy recomendable para tardes de juego en casa.', 5),
('Versátil y atemporal. Esta baraja sirve para jugar cientos de juegos, desde Solitario hasta Póker. Es un infaltable en cualquier hogar. Buena calidad de cartas y resistente al uso continuo', 4),
('Bueno para practicar estrategia y probabilidad. Aunque es un juego de azar, el componente mental lo hace muy entretenido. Ideal para jugar con amigos o en simuladores en línea. No recomendable para menores sin supervisión.', 3),
('Un juego de mesa muy entretenido y competitivo. Puede durar bastante, pero es ideal para tardes largas. Requiere estrategia y un poco de suerte. Las discusiones por propiedades lo hacen aún más divertido', 4),
('Uno de los mejores juegos de estrategia que he probado. Cada partida es distinta, y el factor comercio lo hace muy dinámico. Muy recomendado para quienes disfrutan pensar antes de actuar. Reglas simples pero con mucha profundidad.', 5);

insert into boleta (medio_de_pago, fecha_de_emision)
values ('Tarjeta de crédito', '2025-06-18 15:00:00'),
('Tarjeta de débito', '2025-06-13 13:00:00'),
('Tarjeta de débito', '2025-06-14 11:00:00'),
('Efectivo', '2025-06-15 10:00:00'),
('Tarjeta de crédito', '2025-06-16 13:00:00');

insert into tipo_de_juego (nombre_juego)
values ('Monopoly'),
('Catán'),
('Yenga'),
('Ajedréz'),
('Damas');

INSERT INTO cliente(rut_cliente, user_cliente, password_cliente, direccion_cliente, nombre_cliente, apellido_cliente, id_tipo_usuario)
values ('14520364-1', 'carlossz', 'leclerc', 'Avenida Castilla 55', 'Carlos', 'Sainz', 1),
('5123987-0', 'martit4', 'Pelusa.2015', 'Avenida Pdte. Sebastian Piñera 2543', 'Marta', 'Solis', 1),
('20140235-K', 'Lupe.R', 'ricopan7', 'Avenidad SorVicenta 4719', 'Guadalupe', 'Rojas', 1),
('20789133-0', 'marcOo', 'm4rk0.00', 'Pasaje Navidad 1312', 'Marco', 'Ramos', 1),
('15488439-4', 'Sofi_A', '24111988', 'Avenida Providencia 4856', 'Sofia', 'Alarcon', 1),
('22733123-5', 'SebaPolar', 'colocolo91', 'Pasaje Victoria 677', 'Sebastian', 'Polar', 1);

insert into tienda (nombre_tienda, direccion_tienda)
values ('Locura', 'Avenida Balatro 2033'),
('CardCastle', 'Avenida Sanchez 1017'),
('JuegosLocos', 'Pasaje Prat 2405'),
('Buggy', 'Sevilla 5410'),
('XGames', 'Paseo Caracol 77');


INSERT INTO carro_de_compras (rut_cliente)
VALUES
('14520364-1'),
('5123987-0'),
('20140235-K'),
('20789133-0'),
('15488439-4');

INSERT INTO detalle_carro (id_carro, id_producto, cantidad)
VALUES
(1, 2, 1),
(1, 4, 2),
(2, 5, 1),
(3, 4, 1),
(4, 3, 3),
(5, 7, 1);


INSERT INTO lista_deseos (id_producto, rut_cliente) VALUES
(2, '14520364-1'),
(4, '14520364-1'),
(5, '5123987-0'),
(3, '20140235-K'),
(2, '20789133-0'),
(7, '15488439-4'),	
(3, '22733123-5');

INSERT INTO productoXlista_deseos (id_producto, id_lista_deseos)
SELECT id_producto, id_lista_deseos
FROM lista_deseos;

INSERT INTO carta (marca, estado, coleccion, rareza, anio)
VALUES ('Magic: The Gathering', 'Poor', 'Fuego II', 'Común', 2014),
('Yu-Gi-Oh!', 'Good', 'Hechizo', 'Poco común', 2021),
('Pokemon TCG', 'Excellent', 'Agua', 'Rara', 2016),
('Dragon Ball Super Card Game', 'Near Mint', 'Saiyajin Blue', 'Muy rara', 2022),
('Digimon', 'Mint', 'Fuego VI', 'Legendaria', 2010);

insert into detalle_boleta(id_boleta, id_producto, cantidad)
values(1, 2, 1),
(1, 4, 2),
(2, 5, 1),
(3, 4, 1),
(4, 3, 3),
(5, 7, 1);

INSERT INTO tiendaXproducto (id_tienda, id_producto) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 4),
(4, 5),
(4, 6),
(5, 7),
(5, 8),
(5, 9);

INSERT INTO rankingXproducto (id_ranking, id_producto) VALUES
(1, 8),
(2, 5),
(3, 2),
(4, 9),
(5, 1); 

INSERT INTO tipo_de_carta(nombre_tipo_carta, id_carta)
VALUES ('Criatura', 3),
('Recurso', 2),
('Hechizo', 1),
('Personaje', 4),
('Objeto', 5);


INSERT INTO carro_de_comprasXproducto (id_carro, id_producto) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 4),
(4, 6),
(4, 7),
(5, 8);

insert into permiso(tipo_permiso)
values('Subir Productos'),
('Realizar CRUD'),
('Actualizar datos usuarios'),
('Categorizar productos'),
('Actualizar datos productos'),
('Eliminar Productos');

Insert into tipo_usuarioXpermiso(id_tipo_usuario, id_permiso)
values(1, 3),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 2);

INSERT INTO cartaXtipo (id_carta, id_tipo_carta)
VALUES (3, 1),
(2, 2),
(1, 3),
(4, 4),
(5, 5);

INSERT INTO juegoXtipo (codigo_juego, id_tipo_juego)
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5);