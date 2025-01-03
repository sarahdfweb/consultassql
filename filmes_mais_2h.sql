SELECT 
    a.first_name AS ator,
    a.last_name AS sobrenome,
    COUNT(f.film_id) AS num_filmes
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
WHERE 
    f.length > 120  -- Filmes com mais de 120 minutos
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    num_filmes ASC;  -- Ordena pela quantidade de filmes (de forma crescente)

  
   