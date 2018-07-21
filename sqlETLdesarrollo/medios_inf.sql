SELECT 
  medio_informatico.etiqueta AS nombre, 
  medio_informatico.identificador AS mac, 
  medio_informatico.numero_medio_basico, 
  nom_area_responsabilidad.denominacion AS area, 
  nom_estado.denominacion AS estado, 
  nom_subred.denominacion AS subred, 
  medio_informatico.id_medio_informatico AS id_negocio
FROM 
  public.medio_informatico, 
  public.nom_area_responsabilidad, 
  public.nom_estado, 
  public.area_responsabilidad_subred, 
  public.nom_subred
WHERE 
  nom_area_responsabilidad.id_area_responsabilidad = medio_informatico.id_area_responsabilidad AND
  nom_estado.id_estado = medio_informatico.id_estado AND
  area_responsabilidad_subred.id_area_responsabilidad = nom_area_responsabilidad.id_area_responsabilidad AND
  nom_subred.id_subred = area_responsabilidad_subred.id_subred AND
  medio_informatico.id_tipo_medio_informatico = 1 AND 
  medio_informatico.identificador != '';
