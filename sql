ALTER TABLE hecho_vuelo ADD CONSTRAINT fecha FOREIGN KEY (fecha) REFERENCES tiempo (fecha)
   ON UPDATE NO ACTION ON DELETE NO ACTION;
CREATE INDEX fki_fecha ON hecho_vuelo(fecha);
delete from contacto 
select "ActualizarContacto"()
update hecho_vuelo  set nombre_contacto= 'IRENE GONZALEZ'  where nombre_contacto like 'IRENE%'