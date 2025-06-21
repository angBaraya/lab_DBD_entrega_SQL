CREATE TABLE IF NOT EXISTS tipo_usuario(
  id_tipo_usuario SERIAL,
  rol_usuario VARCHAR(20),
  PRIMARY KEY (id_tipo_usuario)
);


CREATE table if not EXISTS usuario(
  id_usuario SERIAL,
  correo_usuario VARCHAR(100) not NULL UNIQUE,
  password_usuario VARCHAR(60) NOT NULL,
  nombre_usuario VARCHAR(30) UNIQUE,
  id_tipo_usuario INT,
  PRIMARY KEY (id_usuario),
  FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
  );


CREATE TABLE IF NOT EXISTS permiso(
  id_permiso SERIAL,
  tipo_permiso VARCHAR(50),
  PRIMARY KEY (id_permiso)
);


CREATE TABLE IF NOT EXISTS cliente(
  rut_cliente VARCHAR(12), -- formato: 12345678-9
  user_cliente VARCHAR(30) UNIQUE NOT NULL,
  password_cliente VARCHAR(60) NOT NULL,
  direccion_cliente VARCHAR(100),
  nombre_cliente VARCHAR(30) NOT NULL,
  apellido_cliente VARCHAR(30) NOT NULL,
  id_tipo_usuario INT,
  PRIMARY KEY (rut_cliente),
  FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);


CREATE TABLE IF NOT EXISTS tipo_usuarioXpermiso(
	id_tipo_usuario INT,
  	id_permiso INT,
  	PRIMARY KEY (id_tipo_usuario, id_permiso),   
  	FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario),
  	FOREIGN KEY (id_permiso) REFERENCES permiso(id_permiso)
    --agrege esto como FK, no esta en el diagrama, si no ocupamos esto para las consultas lo sacamos,
    --si lo ocupamos lo ponemos en el diagrama
);

CREATE TABLE IF NOT EXISTS tienda(
  id_tienda SERIAL,
  nombre_tienda VARCHAR(30) NOT NULL,
  direccion_tienda VARCHAR(100),
  PRIMARY KEY (id_tienda)
);

CREATE TABLE IF NOT EXISTS producto(
  id_producto SERIAL,
  url_producto VARCHAR(200),
  stock INT NOT NULL CHECK (stock >= 0),
  descripcion TEXT,
  cantidad_ventas INT DEFAULT 0 CHECK (cantidad_ventas >= 0),
  precio INT NOT NULL CHECK (precio >= 0),
  PRIMARY KEY (id_producto)
);

CREATE TABLE tiendaXproducto(
	id_tienda INT,
    id_producto INT,
    PRIMARY KEY (id_tienda, id_producto),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS carro_de_compras(
  id_carro SERIAL,
  rut_cliente VARCHAR(12),
  PRIMARY KEY (id_carro),
  FOREIGN KEY (rut_cliente) REFERENCES cliente(rut_cliente)
);

CREATE TABLE IF NOT EXISTS carro_de_comprasXproducto(
  id_carro INT,
  id_producto INT,
  PRIMARY KEY (id_carro, id_producto),
  FOREIGN KEY (id_carro) REFERENCES carro_de_compras(id_carro),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
  -- lo mismo de antes, agregue las FK, de ahi vemos si son utiles o no
);

CREATE TABLE IF NOT EXISTS lista_deseos(
  id_lista_deseos SERIAL,
  id_producto INT,
  rut_cliente VARCHAR(12),
  PRIMARY KEY (id_lista_deseos),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (rut_cliente) REFERENCES cliente(rut_cliente),
  UNIQUE (id_producto, rut_cliente) -- esto evita que el cliente agregue dos veces la misma cosa a su lista
);

CREATE TABLE IF NOT EXISTS productoXlista_deseos(
  id_producto INT,
  id_lista_deseos INT,
  PRIMARY KEY (id_producto, id_lista_deseos),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (id_lista_deseos) REFERENCES lista_deseos(id_lista_deseos)
);

CREATE TABLE IF NOT EXISTS boleta(
  id_boleta SERIAL,
  medio_de_pago VARCHAR(20) not NULL,
  fecha_de_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_carro INT,
  PRIMARY KEY (id_boleta),
  FOREIGN KEY (id_carro) REFERENCES carro_de_compras(id_carro)
);



CREATE TABLE IF NOT EXISTS valoracion(
  id_valoracion SERIAL,
  review TEXT,
  cantidad_estrellas INT CHECK (cantidad_estrellas BETWEEN 1 AND 5),
  rut_cliente VARCHAR(12),
  id_producto INT,
  PRIMARY KEY (id_valoracion),
  FOREIGN KEY (rut_cliente) REFERENCES cliente(rut_cliente),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  UNIQUE (rut_cliente, id_producto) -- esto evita que el cliente valore 2 veces el producto
);

CREATE TABLE IF NOT EXISTS ranking(
  id_ranking SERIAL,
  fecha_actualizacion DATE,
  posicion_ranking INT NOT NULL CHECK (posicion_ranking > 0),
  PRIMARY KEY (id_ranking)
);

CREATE TABLE IF NOT EXISTS rankingXproducto(
  id_ranking INT,
  id_producto INT,
  PRIMARY KEY (id_ranking, id_producto),
  FOREIGN KEY (id_ranking) REFERENCES ranking(id_ranking),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
  -- agregadas como FK
);

CREATE TABLE IF NOT EXISTS juego_de_mesa(
  codigo_juego SERIAL,
  nombre_juego VARCHAR(30) NOT NULL,
  cantidad_de_jugadores INT CHECK (cantidad_de_jugadores > 0),
  id_producto INT,
  PRIMARY KEY (codigo_juego),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS tipo_de_juego(
  id_tipo_juego SERIAL,
  nombre_juego VARCHAR(30),
  codigo_juego INT,
  PRIMARY KEY (id_tipo_juego),
  FOREIGN KEY (codigo_juego) REFERENCES juego_de_mesa(codigo_juego)
);

CREATE TABLE IF NOT EXISTS carta(
  id_carta SERIAL,
  marca VARCHAR(30) NOT NULL,
  estado VARCHAR(20),
  coleccion VARCHAR(50),
  rareza VARCHAR(20),
  anio INT,
  id_producto INT,
  PRIMARY KEY (id_carta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS tipo_de_carta(
  id_tipo_carta SERIAL,
  nombre_tipo_carta VARCHAR(30),
  id_carta INT,
  PRIMARY KEY (id_tipo_carta),
  FOREIGN KEY (id_carta) REFERENCES carta(id_carta)
);

CREATE TABLE IF NOT EXISTS juegoXtipo (
  codigo_juego INT,
  id_tipo_juego INT,
  PRIMARY KEY (codigo_juego, id_tipo_juego),
  FOREIGN KEY (codigo_juego) REFERENCES juego_de_mesa(codigo_juego),
  FOREIGN KEY (id_tipo_juego) REFERENCES tipo_de_juego(id_tipo_juego)
);

CREATE TABLE IF NOT EXISTS cartaXtipo (
  id_carta INT,
  id_tipo_carta INT,
  PRIMARY KEY (id_carta, id_tipo_carta),
  FOREIGN KEY (id_carta) REFERENCES carta(id_carta),
  FOREIGN KEY (id_tipo_carta) REFERENCES tipo_de_carta(id_tipo_carta)
);


CREATE TABLE IF NOT EXISTS detalle_carro (
  id_detalle_carro SERIAL,
  id_carro INT,
  id_producto INT,
  cantidad INT CHECK (cantidad > 0),
  PRIMARY KEY (id_detalle_carro),
  FOREIGN KEY (id_carro) REFERENCES carro_de_compras(id_carro),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  UNIQUE (id_carro, id_producto)
);

CREATE TABLE IF NOT EXISTS detalle_boleta (
  id_detalle_boleta SERIAL,
  id_boleta INT,
  id_producto INT,
  cantidad INT CHECK (cantidad > 0),
  PRIMARY KEY (id_detalle_boleta),
  FOREIGN KEY (id_boleta) REFERENCES boleta(id_boleta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
