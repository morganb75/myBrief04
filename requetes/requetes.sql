/*============ INSERTION D'UN USER   ==========================*/

INSERT INTO "user"(name, first_name,email,password)
VALUES
('Bleunven', 'Elisa','elisa.bleunven@mail.com','lapetitenenette'),
('Bleunven', 'Raphael','raphael.bleunven@mail.com','petitchat'),
('Bleunven', 'Clement','clement.bleunven@mail.com','petitlapin')
RETURNING id;

/*=============================================================*/

/*============ LECTURE DES DETAILS USER PAR SON NOM=============*/

SELECT * FROM "user" u WHERE u.name = 'Bleunven';

/*==============================================================*/

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
/*SELECT liked_id,p.content, COUNT(user_id)
FROM publi_user_like pul
INNER JOIN publication p
ON p.id=pul.liked_id
GROUP BY liked_id,p.content;*/

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
/*========= RECHERCHE PAR MOT CLE DANS USER ET PUBLICATIONS ========*/
/* le mot clef est le suivant dans la requete: '%motclef%' */

SELECT u.name||' '||u.first_name AS User, u.email AS Mail
FROM "user" u
WHERE u.email LIKE'%cuvox%';

SELECT p.id, p.content
FROM publication p
WHERE p.publication_id IS NULL AND p.content LIKE '%bla%';

/*========= FONCTIONS DE FILTRAGE PUBLIS PAR Date, Auteur, Popularité...  ========*/

SELECT p.id AS ID,p.content AS publication, p.date
FROM publication p
ORDER BY p.date DESC;

SELECT u.name, p.id AS ID, p.content AS publication, p.date
FROM publication p
    INNER JOIN "user" u
    ON u.id=p.owner_id
WHERE u.name LIKE 'Desnoyer'
ORDER BY p.date DESC;


SELECT liked_id AS ID,
p.content AS publication,
p.date,
COUNT(pul.user_id) AS like,
STRING_AGG(u.name, ', ') AS likers
FROM publi_user_like pul
INNER JOIN publication p
ON pul.liked_id = p.id
INNER JOIN "user" u
ON pul.user_id=u.id
GROUP BY liked_id, p.content, p.date
ORDER BY COUNT(pul.user_id) DESC;


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





