--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      uci
-- Project :      api_analisis_estadistico.DM1
-- Author :       manuel
--
-- Date Created : Friday, May 11, 2012 11:31:57
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: analisis 
--

CREATE TABLE analisis(
    id             varchar(5)      NOT NULL,
    codigo         varchar(3),
    descripcion    varchar(255),
    lunes          char(1),
    martes         char(1),
    miercoles      char(1),
    jueves         char(1),
    viernes        char(1),
    sabado         char(1),
    domingo        char(1),
    hora           char(1),
    semana         char(2),
    CONSTRAINT "PK1" PRIMARY KEY (id)
)
;



