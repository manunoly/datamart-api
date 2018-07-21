SELECT
  distinct usuario_login.id_usuario_login as id_negocio, dominio, usuario
FROM usuario_login inner join sesion_login on (usuario_login.id_usuario_login = sesion_login.id_usuario_login)