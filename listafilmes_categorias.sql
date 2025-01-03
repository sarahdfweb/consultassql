SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor,
    COUNT(fa.film_id) AS Numero_De_Filmes
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    Numero_De_Filmes DESC;
