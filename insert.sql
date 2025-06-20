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
