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

INSERT INTO publication(content,owner_id)
SELECT
    'requete insertion de publication par nom prenom de user: Bleunven Raphael',
    u.id
FROM 
    "user" u
WHERE 
    u.name = 'Bleunven' AND u.first_name = 'Raphael'
RETURNING id;

/*===================================================*/

/*============ AFFICHAGE D'UN POST ET NBRE DE LIKE   =================*/
/*SELECT liked_id, COUNT(user_id)
FROM publi_user_like
GROUP BY liked_id;*/

SELECT p.id AS IdPubli,p.content AS Publi, COUNT(pul.user_id) AS Like
FROM publi_user_like pul
RIGHT JOIN publication p
ON pul.liked_id = p.id
GROUP BY p.id,p.content;

/*============ AFFICHAGE DES COMMENTAIRES D'UN POST  =================*/

SELECT p.publication_id AS idPubli, p.id AS idCommentaire,p.content AS Content
FROM publication p
WHERE p.publication_id =1;

/*=====================================================================*/
/*========= FONCTIONS DE FILTRAGE  ========*/


/*========= GROUPES ========*/
/*========= AFFICHAGE GROUPE ET SES USERS  ========*/
/*========= AFFICHAGE TOUS LES GROUPE ET LES USERS ASSOCIES  ========*/
SELECT g.name AS Groupe,
r.name AS Role,
u.name AS Nom,
u.first_name AS Prenom
FROM user_group ug
    INNER JOIN "group" g
    ON g.id = ug.group_id
    INNER JOIN role r
    ON r.id = ug.role_id
    INNER JOIN "user" u
    ON u.id = ug.user_id;

/*========= AFFICHAGE D'UN GROUPE ET DES USERS ASSOCIES  ========*/
SELECT 
r.name AS Role,
u.name AS Nom,
u.first_name AS Prenom
FROM user_group ug
    INNER JOIN "group" g
    ON g.id = ug.group_id
    INNER JOIN role r
    ON r.id = ug.role_id
    INNER JOIN "user" u
    ON u.id = ug.user_id
WHERE g.name = 'covoiturage' OR g.id;





