 -- ¿Cuántas películas tienen una duración superior a 120 minutos?
 select count(*) as 'mas de 120 min'
 from peliculas
 where duracion > 120;
 
 -- ¿Cuántas películas incluyen subtítulos en español? -- NO ESTABAN INCLUIDOS LOS SUBTÍTULOS EN LA TABLA PRIMERA // ALTER TABLE DESDE PYTHON PRIMERO
 select count(*) as pelis_subtitulos_es
 from peliculas
 where subtitulos_es = 1;
 
SELECT titulo, año, subtitulos  -- para ver cúales son
FROM peliculas
WHERE subtitulos_es = 1;
  
 -- ¿Cuántas películas tienen contenido adulto?
select count(*) as Adultos
from peliculas
where adultos = 1;

-- ¿Cuál es la película más antigua registrada en la base de datos?
select titulo, año 
from peliculas
order by año
limit 1;

-- Muestra el promedio de duración de las películas agrupado por género.
select genero, round(avg(duracion), 2) as promedio -- redondeo de 2 decimales
from peliculas
group by genero
order by promedio;

-- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.
select año, count(*) as pelis_año
from peliculas
where año is not null
group by año
order by pelis_año desc, año desc;

-- ¿Cuál es el año con más películas en la base de datos
select año, count(*) as año_más_peliculas
from peliculas
group by año
having count(*) = (    -- año con más películas extraída del contador
	select max(contador)  
    from (
		select count(*) as contador  -- subconsulta que cuenta las peliculas por año
        from peliculas
        group by año
	) as recuento_por_año
);

SELECT año, COUNT(*) AS total_peliculas  -- con order by
FROM peliculas
GROUP BY año
ORDER BY total_peliculas DESC
LIMIT 1;

-- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.
select genero, count(*) as cantidad
from peliculas
group by genero
order by cantidad desc;

-- Muestra todas las películas cuyo título contenga la palabra "Godfather" (puedes usar cualquier palabra).
select titulo
from peliculas
where lower(titulo) like '%Godfather%';  -- sin distinción mayúsculas o minúsculas