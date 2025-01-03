SELECT 
    f.title AS Filme,
    c.name AS Categoria,
    COUNT(*) OVER () AS total_registros
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
ORDER BY 
    f.title, c.name;



