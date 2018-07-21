SELECT 
  nom_area.denominacion as area, 
  nom_local.denominacion as local, 
  nom_local.subred, 
  medio_basico.identificador, 
  medio_basico.id_medio_basico as id_negocio, 
  medio_basico.etiqueta as nombre,
  medio_basico.numero_medio_basico,
  nom_tipo_medio_basico.denominacion as tipo_medio
  
FROM 
  public.nom_area, 
  public.nom_local, 
  public.medio_basico,
  nom_tipo_medio_basico
WHERE 
  nom_area.id_area = nom_local.id_area AND
  nom_tipo_medio_basico.id_tipo_medio_basico=medio_basico.id_tipo_medio_basico and
  nom_local.id_local = medio_basico.id_local AND
  medio_basico.identificador != 'no value'
  
  order by medio_basico.id_medio_basico
