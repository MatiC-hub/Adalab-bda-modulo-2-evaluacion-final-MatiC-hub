 -- ¿Cuántas películas tienen una duración superior a 120 minutos?
 select count(*) as 'mas de 120 min'
 from peliculas
 where duracion > 120;
 
 -- ¿Cuántas películas incluyen subtítulos en español? -- NO ESTÁN INCLUIDOS LOS SUBTÍTULOS EN LA TABLA
 
 
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


-- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.


-- ¿Cuál es el año con más películas en la base de datos


-- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.


-- Muestra todas las películas cuyo título contenga la palabra "Godfather" (puedes usar cualquier palabra).