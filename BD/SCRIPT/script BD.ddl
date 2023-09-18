-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-09-12 10:40:38 COT
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    documento        NUMBER(10) NOT NULL,
    nombre           VARCHAR2(60 CHAR) NOT NULL,
    apellido         VARCHAR2(60 CHAR) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero           VARCHAR2(10 CHAR) NOT NULL,
    direccion        VARCHAR2(60 CHAR) NOT NULL,
    telefono         NUMBER(10) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( documento ); --esto nos dice cual es la clave primaria de la tabla y con cual se relaciona
--puedo poner los constraints donde quiera

CREATE TABLE producto (
    codigo_producto NUMBER(10) NOT NULL,
    nombre_producto VARCHAR2(60 CHAR) NOT NULL,
    descripcion     VARCHAR2(150 CHAR) NOT NULL,
    precio_producto NUMBER(9) NOT NULL,
    stock           NUMBER(7) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( codigo_producto );

CREATE TABLE relation_2 (
    venta_codigo_venta       NUMBER(10) NOT NULL,
    venta_cliente_documento  NUMBER(10) NOT NULL,
    producto_codigo_producto NUMBER(10) NOT NULL
);

ALTER TABLE relation_2
    ADD CONSTRAINT relation_2_pk PRIMARY KEY ( venta_codigo_venta,
                                               venta_cliente_documento,
                                               producto_codigo_producto );

CREATE TABLE venta (
    codigo_venta      NUMBER(10) NOT NULL,
    fecha             DATE NOT NULL,
    total             NUMBER(9) NOT NULL,
    cliente_documento NUMBER(10) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( codigo_venta,
                                                        cliente_documento );

ALTER TABLE relation_2
    ADD CONSTRAINT relation_2_producto_fk FOREIGN KEY ( producto_codigo_producto )
        REFERENCES producto ( codigo_producto );

ALTER TABLE relation_2
    ADD CONSTRAINT relation_2_venta_fk FOREIGN KEY ( venta_codigo_venta,
                                                     venta_cliente_documento )
        REFERENCES venta ( codigo_venta,
                           cliente_documento );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_documento )
        REFERENCES cliente ( documento );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
