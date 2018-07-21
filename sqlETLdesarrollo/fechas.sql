SELECT 
  extract('DAY'  from sesion_login.fecha_inicio) as fecha
FROM 
  public.sesion_login

select to_char(now(), 'TMMonth')
 set lc_time to 'es_CL'; 
SELECT 
  to_char(sesion_login.fecha_inicio, 'Day') as fecha
FROM 
  public.sesion_login

  SELECT  cast_to_varchar2(EXTRACT(DOW FROM sesion_login.fecha_inicio), 0, 'Domingo', 1, 'Lunes', 2, 'Martes', 3, 'Miércoles', 4, 'Jueves', 5, 'Viernes', 6, 'Sábado')
FROM public.sesion_login

  
  select ((date_trunc('week',current_date)::date) + (i+6)) as week_date 
  from generate_Series(0,6) i

  select to_char((date_trunc('week',current_date)::date) + i,'Day') as wkday from generate_series(0,6) i

  SELECT TO_CHAR (timestamp(current_date),'dd-Mon-yyyy hh:mi:ss PM');