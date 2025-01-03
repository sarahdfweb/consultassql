SELECT 
    COUNT(*) AS Total_Registros
FROM (
    SELECT 
        a.first_name AS ator,
        a.last_name AS sobrenome,
        f.title AS filme,
        f.length AS duracao,
        COUNT(f.film_id) OVER (PARTITION BY a.actor_id) AS num_filmes
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    JOIN 
        film f ON fa.film_id = f.film_id
    WHERE 
        f.length > 120  -- Filmes com mais de 120 minutos
    ORDER BY 
        num_filmes ASC
) AS Subconsulta;



