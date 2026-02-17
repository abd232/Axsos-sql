USE `world`;
show tables;
describe countries;
describe languages;
describe cities;

SELECT c.name, l.language, l.percentage 
FROM countries c JOIN languages l ON l.country_id = c.id 
WHERE l.language = 'Slovene';

SELECT c.name as 'country name', count(*) as 'number of cities'
FROM countries c JOIN cities ci ON ci.country_id = c.id 
group by c.name order by count(*) desc;

SELECT name as 'city name', population 
from cities where population > 500000 
AND country_id in (select id from countries where name = 'Mexico') 
order by population desc;

SELECT c.name, l.language 
FROM countries c
JOIN languages l ON l.country_id = c.id WHERE percentage > 89;

SELECT name, surface_area AS 'surface area'
FROM countries WHERE id IN (SELECT country_id FROM cities GROUP BY country_id HAVING sum(population) > 100000) AND surface_area < 501;

SELECT name, government_form, capital, life_expectancy
FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;
  
SELECT c.name AS 'country name', ci.name AS 'city name', ci.district, ci.population
FROM countries c
JOIN cities ci ON c.code = ci.country_code
WHERE c.name = 'Argentina' AND ci.district = 'Buenos Aires' AND ci.population > 500000;

SELECT region, COUNT(*) AS 'number of countries'
FROM countries GROUP BY region
ORDER BY COUNT(*) DESC;