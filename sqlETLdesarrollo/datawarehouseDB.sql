--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      uci
-- Project :      almacen v1.dm1
-- Author :       manuel
--
-- Date Created : Tuesday, May 13, 2014 11:31:20
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: alertas 
--

CREATE TABLE alertas(
    id_alertas          serial    NOT NULL,
    id_tipos_alertas    int4    NOT NULL,
    id_medio            int4    NOT NULL,
    id_tiempo           int4    NOT NULL,
    CONSTRAINT "PK14" PRIMARY KEY (id_alertas)
)
;



-- 
-- TABLE: cierre_medio 
--

CREATE TABLE cierre_medio(
    id_cierre_medio    serial           NOT NULL,
    tipo_cierre        varchar(10)    NOT NULL,
    forzoso               boolean,
    CONSTRAINT "PK6" PRIMARY KEY (id_cierre_medio)
)
;



-- 
-- TABLE: medio 
--

CREATE TABLE medio(
    id_medio             serial             NOT NULL,
    nombre_medio         varchar(40),
    mac                  varchar(40),
    numero_medio         varchar(40),
    local                varchar(100),
    subred               varchar(15),
    ubicacion_gps        varchar(10),
    ram                  numeric(4, 0),
    modelo               varchar(100),
    procesador           varchar(50),
    datos_generales      varchar(1000),
    so                   varchar(100),
    estado               varchar(30),
    id_medio_anterior    integer          NOT NULL,
    id_medio_negocio     int4,
    CONSTRAINT "PK1" PRIMARY KEY (id_medio)
)
;



-- 
-- TABLE: moviemiento 
--

CREATE TABLE moviemiento(
    id_movimiento    char(10)    NOT NULL,
    id_medio         int4        NOT NULL,
    id_tiempo        int4        NOT NULL,
    CONSTRAINT "PK12" PRIMARY KEY (id_movimiento)
)
;



-- 
-- TABLE: periodo 
--

CREATE TABLE periodo(
    id_periodo    serial            NOT NULL,
    periodo       varchar(100),
    CONSTRAINT "PK11" PRIMARY KEY (id_periodo)
)
;



-- 
-- TABLE: piezas 
--

CREATE TABLE piezas(
    id_piezas     serial           NOT NULL,
    pieza         varchar(50),
    id_negocio    int4,
    CONSTRAINT "PK8" PRIMARY KEY (id_piezas)
)
;



-- 
-- TABLE: "piezas reparacion" 
--

CREATE TABLE "piezas reparacion"(
    id_piezas        int4    NOT NULL,
    id_reparacion    int4    NOT NULL,
    CONSTRAINT "PK18" PRIMARY KEY (id_piezas, id_reparacion)
)
;



-- 
-- TABLE: reparacion 
--

CREATE TABLE reparacion(
    id_reparacion    int4    NOT NULL,
    id_medio         int4    NOT NULL,
    CONSTRAINT "PK17" PRIMARY KEY (id_reparacion)
)
;



-- 
-- TABLE: sesion_trabajo 
--

CREATE TABLE sesion_trabajo(
    id_sesion_trabajo    serial           NOT NULL,
    sesion               varchar(30)    NOT NULL,
    horario              varchar(15),
    CONSTRAINT "PK7" PRIMARY KEY (id_sesion_trabajo)
)
;



-- 
-- TABLE: software 
--

CREATE TABLE software(
    id_software    serial            NOT NULL,
    software       varchar(100)    NOT NULL,
    CONSTRAINT "PK9" PRIMARY KEY (id_software)
)
;



-- 
-- TABLE: tiempo 
--

CREATE TABLE tiempo(
    id_tiempo           serial             NOT NULL,
    anno                numeric(4, 0),
    semestre_escolar    numeric(2, 0),
    mes                 varchar(2),
    semana              varchar(2),
    dia_semana          varchar(15),
    fecha               date,
    CONSTRAINT "PK2" PRIMARY KEY (id_tiempo)
)
;



-- 
-- TABLE: tipos_alertas 
--

CREATE TABLE tipos_alertas(
    id_tipos_alertas    serial           NOT NULL,
    alerta              varchar(50),
    id_negocio          int4,
    CONSTRAINT "PK4" PRIMARY KEY (id_tipos_alertas)
)
;



-- 
-- TABLE: uso_medios 
--

CREATE TABLE uso_medios(
    id_uso_medios        serial    NOT NULL,
    id_medio             int4    NOT NULL,
    id_sesion_trabajo    int4    NOT NULL,
    id_tiempo            int4    NOT NULL,
    id_cierre_medio      int4    NOT NULL,
    id_periodo           int4    NOT NULL,
    id_usuario           int4    NOT NULL,
    CONSTRAINT "PK10" PRIMARY KEY (id_uso_medios)
)
;



-- 
-- TABLE: uso_software 
--

CREATE TABLE uso_software(
    id_uso_software      serial             NOT NULL,
    tiempo               numeric(6, 0),
    id_software          int4             NOT NULL,
    id_medio             int4             NOT NULL,
    id_tiempo            int4             NOT NULL,
    id_sesion_trabajo    int4             NOT NULL,
    id_periodo           int4             NOT NULL,
    CONSTRAINT "PK16" PRIMARY KEY (id_uso_software)
)
;



-- 
-- TABLE: usuario 
--

CREATE TABLE usuario(
    id_usuario    serial           NOT NULL,
    usuario       varchar(30),
    dominio       varchar(20),
    id_negocio    int4,
    CONSTRAINT "PK3" PRIMARY KEY (id_usuario)
)
;



-- 
-- TABLE: alertas 
--

ALTER TABLE alertas ADD CONSTRAINT "Reftiempo20" 
    FOREIGN KEY (id_tiempo)
    REFERENCES tiempo(id_tiempo)
;

ALTER TABLE alertas ADD CONSTRAINT "Reftipos_alertas11" 
    FOREIGN KEY (id_tipos_alertas)
    REFERENCES tipos_alertas(id_tipos_alertas)
;

ALTER TABLE alertas ADD CONSTRAINT "Refmedio12" 
    FOREIGN KEY (id_medio)
    REFERENCES medio(id_medio)
;


-- 
-- TABLE: moviemiento 
--

ALTER TABLE moviemiento ADD CONSTRAINT "Reftiempo21" 
    FOREIGN KEY (id_tiempo)
    REFERENCES tiempo(id_tiempo)
;

ALTER TABLE moviemiento ADD CONSTRAINT "Refmedio8" 
    FOREIGN KEY (id_medio)
    REFERENCES medio(id_medio)
;


-- 
-- TABLE: "piezas reparacion" 
--

ALTER TABLE "piezas reparacion" ADD CONSTRAINT "Refpiezas16" 
    FOREIGN KEY (id_piezas)
    REFERENCES piezas(id_piezas)
;

ALTER TABLE "piezas reparacion" ADD CONSTRAINT "Refreparacion17" 
    FOREIGN KEY (id_reparacion)
    REFERENCES reparacion(id_reparacion)
;


-- 
-- TABLE: reparacion 
--

ALTER TABLE reparacion ADD CONSTRAINT "Refmedio18" 
    FOREIGN KEY (id_medio)
    REFERENCES medio(id_medio)
;


-- 
-- TABLE: uso_medios 
--

ALTER TABLE uso_medios ADD CONSTRAINT "Refmedio2" 
    FOREIGN KEY (id_medio)
    REFERENCES medio(id_medio)
;

ALTER TABLE uso_medios ADD CONSTRAINT "Refsesion_trabajo3" 
    FOREIGN KEY (id_sesion_trabajo)
    REFERENCES sesion_trabajo(id_sesion_trabajo)
;

ALTER TABLE uso_medios ADD CONSTRAINT "Reftiempo4" 
    FOREIGN KEY (id_tiempo)
    REFERENCES tiempo(id_tiempo)
;

ALTER TABLE uso_medios ADD CONSTRAINT "Refcierre_medio5" 
    FOREIGN KEY (id_cierre_medio)
    REFERENCES cierre_medio(id_cierre_medio)
;

ALTER TABLE uso_medios ADD CONSTRAINT "Refperiodo6" 
    FOREIGN KEY (id_periodo)
    REFERENCES periodo(id_periodo)
;

ALTER TABLE uso_medios ADD CONSTRAINT "Refusuario7" 
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
;


-- 
-- TABLE: uso_software 
--

ALTER TABLE uso_software ADD CONSTRAINT "Refsesion_trabajo22" 
    FOREIGN KEY (id_sesion_trabajo)
    REFERENCES sesion_trabajo(id_sesion_trabajo)
;

ALTER TABLE uso_software ADD CONSTRAINT "Refperiodo23" 
    FOREIGN KEY (id_periodo)
    REFERENCES periodo(id_periodo)
;

ALTER TABLE uso_software ADD CONSTRAINT "Refsoftware13" 
    FOREIGN KEY (id_software)
    REFERENCES software(id_software)
;

ALTER TABLE uso_software ADD CONSTRAINT "Refmedio14" 
    FOREIGN KEY (id_medio)
    REFERENCES medio(id_medio)
;

ALTER TABLE uso_software ADD CONSTRAINT "Reftiempo19" 
    FOREIGN KEY (id_tiempo)
    REFERENCES tiempo(id_tiempo)
;



