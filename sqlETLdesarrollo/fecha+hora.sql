(SELECT 
  sesion_login.fecha_inicio as fecha,
  sesion_login.hora_inicio as hora
FROM 
  public.sesion_login)
union
(SELECT 
  software_use.fecha_inicio as fecha, 
  software_use.hora_inicio as hora
FROM 
  public.software_use)
  union 
  (SELECT 
  sesion_login.fecha_fin as fecha,
  sesion_login.hora_fin as hora
FROM 
  public.sesion_login)