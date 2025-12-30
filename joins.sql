SELECT c.name AS category_name, COUNT(f.film_id) AS film_count
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;


SELECT s.store_id, ci.city, co.country
FROM store s
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
ORDER BY s.store_id;

SELECT 
    s.store_id,
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM store s
INNER JOIN staff st   ON s.store_id = st.store_id
INNER JOIN rental r   ON st.staff_id = r.staff_id
INNER JOIN payment p  ON r.rental_id = p.rental_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;


SELECT c.name AS category_name, ROUND(AVG(f.length), 2) AS avg_runtimemins
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name;

SELECT c.name AS category_name, ROUND(AVG(f.length), 2) AS avg_runtimemins
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY avg_runtimemins DESC;

SELECT f.title As film_title,
COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY times_rented DESC
LIMIT 10;

SELECT i.inventory_id, f.title, i.store_id
FROM film f
JOIN inventory i ON i.film_id = f.film_id
WHERE f.title = "Academy Dinosaur"
	AND i.store_id = 1;
    
SELECT f.title AS film_title,
	CASE
		WHEN COUNT(i.inventory_id) > 0 THEN "Aailable"
        ELSE "Not available"
	END AS availability_status
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY f.title;