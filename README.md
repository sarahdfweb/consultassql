
 
## Consultas SQL

1-	Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes.
```
SELECT 
    f.title AS Filme,
    c.name AS Categoria
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
ORDER BY 
    f.title, c.name; 
```
<details>
  <summary>Resultado da Consulta</summary>
 
  ![image](https://github.com/user-attachments/assets/5a0b84f9-32b0-46cf-9f9b-279c5314d33a).
  
</details>



2-	Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. Ordene a lista pelo número de filmes, iniciando pelos atores que mais atuaram.
```
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS Ator,
    COUNT(fa.film_id) AS Numero_De_Filmes
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    Numero_De_Filmes DESC;
```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/340b12b6-55c4-4309-854c-dfee9dfb81ff)

</details>

Filmes com mais de 120 minutos de duração
```
SELECT 
    title, 
    length
FROM 
    film
WHERE 
    length > 120;
```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/85555e47-7706-4666-b143-d2439563a404)

</details>

3-	Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). Ordene a lista pelo número de filmes que cada ator participou.
```
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

    num_filmes ASC;  
```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/e48b8a37-6894-4c49-b57b-e8b3ad156052)

</details>
1.2 -  A seguir as consultas dos exercícios anteriores que retorne o número de registros encontrados pela busca.
```
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
```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/4bc21fa9-b9ca-4766-b0b2-1e83a8f57acb)

</details>

2.1- 
```
COUNT(*) AS Total_Registros
FROM (
    SELECT  
        CONCAT(a.first_name, ' ', a.last_name) AS Ator,
        COUNT(fa.film_id) AS Numero_De_Filmes
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
    ORDER BY 
        Numero_De_Filmes DESC
) AS Subconsulta;

```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/37ba6727-8937-4e18-bbde-665afeeaed5b)
</details>

3.1
```
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
```
<details>
  <summary>Resultado da Consulta</summary>
 
![image](https://github.com/user-attachments/assets/94626db4-4b5b-4887-ab67-70633d6777c0)

 </details>
 
## Tecnologias Utilizadas

Este repositório foi desenvolvido utilizando as seguintes tecnologias:

- **Docker**: Utilizado para criar e gerenciar containers que facilitam a configuração e execução do ambiente de banco de dados.
- **Extensão MySQL**: Ferramenta utilizada para integração com o banco de dados MySQL diretamente no Visual Studio Code.
- **Repositório Sakila**: Banco de dados de exemplo utilizado para realizar as consultas SQL, fornecendo uma estrutura de dados para filmes, atores, categorias, etc.
- **Visual Studio Code**: Editor de código utilizado para escrever, testar e depurar as consultas SQL de forma eficiente.
