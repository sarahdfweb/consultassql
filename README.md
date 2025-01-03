
 
## Consultas SQL E NOSQL

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
Para as consultas SQL  usei as seguintes tecnologias:

- **Docker**: Utilizado para criar e gerenciar containers que facilitam a configuração e execução do ambiente de banco de dados.
- **Extensão MySQL**: Ferramenta utilizada para integração com o banco de dados MySQL diretamente no Visual Studio Code.
- **Repositório Sakila**: Banco de dados de exemplo utilizado para realizar as consultas SQL, fornecendo uma estrutura de dados para filmes, atores, categorias, etc.
- **Visual Studio Code**: Editor de código utilizado para escrever, testar e depurar as consultas SQL de forma eficiente.
  
## Consultas NOSQL

Faça uma busca de quantos livros não estão com o status publicado e pageCount menor que 300 
```
db.biblioteca.countDocuments({
  status: { $ne: "PUBLISH" },
  pageCount: { $lt: 300 }
});
```
![image](https://github.com/user-attachments/assets/1f71a1d8-76f9-433c-a82c-eece4c30de1e)

Faça uma busca de livros que contém as palavras MongoDB e SQL Server no título
```
db.biblioteca.find({
  title: { $regex: "MongoDB", $options: "i" },
  title: { $regex: "SQL Server", $options: "i" }
}).pretty();
```
![image](https://github.com/user-attachments/assets/cde5d9bf-22a9-4305-986b-93de414bb7bf)


Faça uma busca com expressão regular onde ISBN começa com 18
```
db.biblioteca.find({
  isbn: { $regex: "^18", $options: "i" }
}).pretty();
```

![image](https://github.com/user-attachments/assets/ec1f2350-5761-49ba-a44d-d4a519f18997)

Usando Expressão Regular, busque livros que contém a palavra JAVA ou Mobile na descrição do livro (LongDescription), lembrando que deve trazer todas as palavras independente de começa com maiúsculo ou minúsculo


![image](https://github.com/user-attachments/assets/52c9881e-d131-46a7-b253-985afa0db8d5)



1-	Faça uma busca de quantos livros não estão com o status publicado e pageCount menor que 300 traga apenas o número do resultado usando o contador
```
db.biblioteca.countDocuments({
	$and: [
	  { status: { $ne: "PUBLISH"} },
	  { pageCount: { $lt: 300} }
	
	]
});
![image](https://github.com/user-attachments/assets/d1956847-afc9-4e88-90c8-25ff7c4fb7ba)


``` 

2-	Faça uma busca de livros que contém as palavras MongoDB e SQL Server no título e traga apenas o número do resultado usando o contador
```
db.biblioteca.countDocuments({
  title: { $regex: "MongoDB", $options: "i" },
  title: { $regex: "SQL Server", $options: "i" }
});

![image](https://github.com/user-attachments/assets/1d816388-f1dc-4a60-a62a-4aec32af26f3)


 ```
3-	Faça uma busca com expressão regular onde ISBN começa com 18 e traga apenas o número do resultado usando o contador
```
db.biblioteca.countDocuments({
  isbn: { $regex: "^18", $options: "i" }
});

![image](https://github.com/user-attachments/assets/69c52ddf-cff3-4a56-a108-202686bee4d7)



 ```

Usando Expressão Regular, busque livros que contém a palavra JAVA ou Mobile na descrição do livro (LongDescription), lembrando que deve trazer todas as palavras independente de começa com maiúsculo ou minúsculo e traga apenas o número do resultado usando o contador
```
db.biblioteca.countDocuments({
  longDescription: { $regex: "(java|mobile)", $options: "i" }
});
 ```

![image](https://github.com/user-attachments/assets/6d080baa-9d6c-4cd0-8d0e-9b0ac0135d3b)


## Tecnologias Utilizadas
Para as consultas NOSQL  usei as seguintes tecnologias:
- **MongoDB**
- **Docker**








