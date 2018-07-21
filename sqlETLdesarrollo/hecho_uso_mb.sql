SELECT 
  usuario_login.usuario, 
  sesion_login.fecha_inicio, 
  sesion_login.hora_inicio, 
  sesion_login.dominio, 
  sesion_login.cierre_forzoso, 
  sesion_login.hora_fin, 
  sesion_login.fecha_fin, 
  sesion_login.fecha_creacion, 
  medio_basico.identificador, 
  medio_basico.id_medio_basico
FROM 
  public.usuario_login, 
  public.sesion_login, 
  public.medio_basico
WHERE 
  usuario_login.id_usuario_login = sesion_login.id_usuario_login AND
  medio_basico.id_medio_basico = sesion_login.id_medio_basico;
