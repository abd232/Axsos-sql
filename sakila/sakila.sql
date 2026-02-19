SHOW TABLES;
DESCRIBE customer;
DESCRIBE address ;

SELECT 
    c.first_name, c.last_name, c.email, a.address
FROM customer c
JOIN address a  ON c.address_id = a.address_id
WHERE a.city_id = 312;

DESCRIBE film;
DESCRIBE film_category;
DESCRIBE category;

SELECT 
    f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS genre
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Comedy';

DESCRIBE actor;
DESCRIBE film_actor;

SELECT 
    a.actor_id, CONCAT(a.first_name,' ',a.last_name) AS actor_name, f.title, f.description, f.release_year
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE a.actor_id = 5;

SELECT 
    c.first_name, c.last_name, c.email, a.address
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE c.store_id = 1
AND a.city_id IN (1,42,312,459);

SELECT 
    f.title, f.description, f.release_year, f.rating, f.special_features
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.rating = 'G'
AND f.special_features LIKE '%Behind the Scenes%'
AND fa.actor_id = 15;

SELECT 
    f.film_id, f.title, a.actor_id, CONCAT(a.first_name,' ',a.last_name) AS actor_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id = 369;

SELECT 
    f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS genre
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Drama'
AND f.rental_rate = 2.99;

SELECT 
    f.title, f.description, f.release_year, f.rating, f.special_features, cat.name AS genre, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE a.first_name = 'SANDRA'
AND a.last_name = 'KILMER'
AND cat.name = 'Action';