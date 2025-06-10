-- codigo de ejemplo

CREATE TABLE IF NOT EXISTS mascotas (
    id_mascota INTEGER PRIMARY KEY,
    nombre VARCHAR(15),
    especie CHAR(1),
    sexo CHAR(1),
    ubicacion VARCHAR(10),
    estado CHAR(1)
);
