1 - Escreva uma query que retorne uma coluna com o nome dos personagens e uma coluna com o nome de sua espécie.
Dica: Quando queremos usar uma palavra reservada do mysql para referenciar a uma tabela, devemos colocar a palavra entre o acento grave. 
Por exemplo, o banco de dados fornecido para os exercícios de fixação possui uma tabela com o nome de Character,
uma palavra reservada, então ao referencia-lá escrevemos: `Character`.

USE final_space_db;

CREATE VIEW personagem_specie AS
SELECT 
    C.Character_id, C.Name, S.Specie_Name
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id;


SELECT * FROM personagem_specie;


2 - Escreva uma querie que retorne uma coluna com os nomes dos personagens e uma coluna com o nome do seu local de origem.

USE final_space_db;
CREATE VIEW personagem_origem AS
SELECT 
    C.Name, L.Location_Name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id;

SELECT * FROM personagem_origem;

3 - Agora, retorne o nome do personagem, sua espécie e o lugar de origem em uma query


USE final_space_db;
CREATE VIEW personagem_origem_specie AS
SELECT 
    C.Name, S.Specie_Name, L.Location_Name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id
        INNER JOIN
        Specie AS S ON C.Specie = S.Specie_id;

SELECT * FROM  personagem_origem_specie;

4 - Escreva uma query que retornará uma coluna com o nome da espécie, nomeie como Especie, e uma coluna com a 
quantidade de personagens daquela espécie, nomeie como Quantidade. Por fim, 
organize a lista de forma ascendente pela quantidade.



USE final_space_db;

CREATE VIEW qtd_specie AS
SELECT 
    S.Specie_Name AS Nome_Especie,
    COUNT(C.Character_ID) AS Quantidade
FROM 
    Specie S
INNER JOIN 
    `Character` C ON S.Specie_id = C.Specie
GROUP BY 
    S.Specie_Name
ORDER BY
    Quantidade;

SELECT * FROM qtd_specie;

5 - Escreva uma query que retorne uma coluna com o nome do Local, nomeie como Local de origem, e uma coluna com quantidade de 
personagens que tenham origem desse local, nomeie como Quantidade. Por fim, organize a lista de forma decrescente pela quantidade.

USE final_space_db;


CREATE VIEW qtdSpecie_localOrigem AS
SELECT 
    L.Location_Name AS LocalDeOrigem,
    COUNT(C.Character_id) AS Quantidade
FROM 
    Location L
INNER JOIN 
    `Character` C ON L.Location_id = C.Origin
GROUP BY 
    L.Location_Name
ORDER BY
    Quantidade Desc;

SELECT * FROM qtdSpecie_localOrigem;


6 - Escreva uma query que retorne os nomes dos 
personagens que tem como local de origem 'Earth'. Por fim, organize os nomes em ordem alfabética.


CREATE VIEW personagens_origemEarth AS
SELECT 
    L.Location_Name AS LocalDeOrigem,
    C.`Name` AS Nomes
FROM 
    Location L
INNER JOIN 
    `Character` C ON L.Location_id = C.Origin
    WHERE L.Location_Name = 'Earth'
    ORDER BY Nomes;

SELECT * FROM personagens_origemEarth;

7 - Escreva uma query que retorne nome e local de origem de todos personagens 
que são de espécie 'Ventrexian'. Por fim, ordene os nome de forma alfabética-invertida.


CREATE VIEW personagens_origemVextrexian AS
SELECT 
    C.`Name` AS Nomes,
    S.Specie_Name AS Especie,
    L.Location_Name AS LocalDeOrigem
FROM 
    Location L
INNER JOIN 
    `Character` C ON L.Location_id = C.Origin
INNER JOIN
    Specie AS S ON S.Specie_id = C.Specie
    WHERE S.Specie_Name = 'Ventrexian'
    ORDER BY Nomes;

    SELECT * FROM personagens_origemVextrexian;


DROP USER analista;
DROP USER gestor;
Drop USER Analista;
DROP USER Gestor;

Drop USER 'Analista'@'127.0.0.1';


CREATE USER Analista IDENTIFIED BY 'rfg@5tk';
CREATE USER Gestor IDENTIFIED BY 'rfg@5ty';
GRANT SELECT ON final_space_db.personagem_specie TO Analista;
GRANT SELECT ON final_space_db.personagem_origem TO Analista;
GRANT SELECT ON final_space_db.personagem_origem_specie TO Analista;
GRANT SELECT ON final_space_db.qtd_specie TO Analista;
GRANT SELECT ON final_space_db.qtdSpecie_localOrigem TO Analista;
GRANT SELECT ON final_space_db.personagens_origemEarth TO Analista;
GRANT SELECT ON final_space_db.personagens_origemVextrexian TO Analista;

SHOW GRANTS FOR Analista;

GRANT SELECT, INSERT, UPDATE ON final_space_db.* TO Gestor;

SHOW GRANTS FOR Gestor;





















Righ e LeftJoin
1 - Escreva uma query que exiba os nomes de todos os personagens e sua espécie. Observação: O nome de todos os personagens deve aparecer, inclusive os que não tem uma espécie definida.










2 - Escreva uma query que exiba os nomes de todos os personagens e seu local de origem. Observação: O nome de todos os personagens deve aparecer, inclusive os que não tem um local de origem definido.





3 - Escreva uma query que mostre nome do personagem e nome de todas as espécies, mesmo as que não possuem personagem com aquela espécie.





4 - Escreva uma query que retorne nome do personagem e nome de todos locais de origem, inclusive os personagens sem origem desse local.






5 - Escreva uma query que exiba nomes de todos os personagens e sua espécie. Se o personagem não tiver espécie definida, o campo da espécie deverá mostrar 'Unknown'. Por fim, nomeie a coluna espécie de 'Specie' e a coluna nomes dos personagens de 'Character'.





6 - Escreva uma query que retorne nome do personagem e nome de todos locais de origem. Nomeie coluna nome do personagem de 'Character' e coluna do local de 'Local'. Caso não houver personagem com origem do local, o campo que apresentaria no nome do personagem deve mostrar 'Unknown'.