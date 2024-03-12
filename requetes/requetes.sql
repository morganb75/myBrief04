/*============ LECTURE DES DETAILS USER PAR SON NOM=============*/

SELECT * FROM "user" u WHERE u.name = 'Bleunven';

/*==============================================================*/


/*============ INSERTION D'UN USER   ==========================*/

INSERT INTO "user"(name, first_name,email,password)
VALUES
('Bleunven', 'Elisa','elisa.bleunven@mail.com','lapetitenenette'),
('Bleunven', 'Raphael','raphael.bleunven@mail.com','petitchat'),
('Bleunven', 'Clement','clement.bleunven@mail.com','petitlapin')
RETURNING id;

/*=============================================================*/


/*============ MODIFICATION D'UN USER   =============*/

UPDATE "user"
SET email = 'virginie.simard@gmail.com'
WHERE name ='Simard' AND first_name ='Virginie';

/*===================================================*/

/*============ CREATION D'UN POST   =================*/

INSERT INTO publication(content,owner_id,date)
SELECT
    'requete insertion de publication par nom prenom de user: Bleunven Raphaël',
    u.id,
    '2024-03-12 22:37:28'
FROM 
    "user" u
WHERE 
    u.name = 'Bleunven' AND u.first_name = 'Raphaël'
RETURNING id;

/*===================================================*/

/*============ AFFICHAGE D'UN POST ET NBRE DE LIKE   =================*/
SELECT liked_id, COUNT(user_id)
FROM publi_user_like
GROUP BY liked_id;





/*============ INFOS TOTALES TABLES  =============*/
SELECT p.content,p.id AS publi_Id,u.name||' '||u.first_name AS publie_par 
FROM publication p
    INNER JOIN "user" u
    ON u.id = p.owner_id;



