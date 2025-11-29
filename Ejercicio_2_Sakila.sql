-- 1.- Selecciona todos los nombres de las películas sin que aparezcan duplicados.
select distinct film.title  -- para no duplicados
from film;

-- 2.- Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
select title
from film
where rating = 'PG-13';

-- 3.- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
select title, description
from film
where description like '%amazing%';   -- en cualquier posición

-- 4.- Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
select title
from film
where length > 120;

-- 5.- Recupera los nombres de todos los actores.
select first_name, last_name
from actor;

select concat(first_name, ' ', last_name) as nombre -- para que los de en una sola columna y los ordene alfabéticamente
from actor
order by nombre;

-- 6.- Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
select first_name, last_name
from actor
where last_name like '%Gibson%';  -- REGEXP para patrones más complejos

-- 7.- Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
select first_name
from actor
where actor_id between 10 and 20;  -- limite inferior y superior

select first_name
from actor
where actor_id >= 10 and actor_id <= 20;  -- operadores lógicos llamando a la columna ambas veces

-- 8.- Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
select title
from film
where rating not like 'R' and rating not like 'PG-13';  -- también podría ser con un not in ('R', 'PG-13')

-- 9.- Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
select rating, count(rating) as recuento  -- se podría usar count(*) ya que se cuenta todo, no una columna concreta
from film
group by rating;

-- 10.- Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) as cantidad_alquilada
from customer
left join rental on customer.customer_id = rental.customer_id    -- incluso los que no alquilaron películas
group by customer.customer_id, customer.first_name, customer.last_name
order by cantidad_alquilada;  

select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) as cantidad_alquilada
from customer
inner join rental on customer.customer_id = rental.customer_id  -- excluye a los clientes sin alquileres si los hay
group by customer.customer_id, customer.first_name, customer.last_name
order by cantidad_alquilada;

-- 11.- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
select count(r.rental_id) as recuento, c.name
from category c
inner join film_category fc on c.category_id = fc.category_id  -- relación categoría
inner join film f on f.film_id = fc.film_id  -- relación película y categoría
inner join inventory i on i.film_id = f.film_id -- relación película - inventario
inner join rental r on r.inventory_id = i.inventory_id -- relación inventario - alquiler
group by c.name;

-- 12.- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
select avg(film.length) as promedio, rating
from film
group by rating
order by promedio desc;

-- 13.- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
select a.first_name, a.last_name
from actor a
inner join film_actor fa on fa.actor_id = a.actor_id -- saber en que película sale cada actor
inner join film f on fa.film_id = f.film_id   -- llegar al título
where f.title = 'INDIAN LOVE';

-- 14.- Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
select title
from film
where description regexp 'dog|cat';

-- 15.- Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
select title
from film
where release_year between 2005 and 2010;

