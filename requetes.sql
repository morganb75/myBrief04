/*============ LECTURE DES DETAILS USER  =============*/
SELECT * FROM "user" u WHERE u.name = 'picot';

/*============ INSERTION D'UN USER   =============*/


/*============ INFOS TOTALES TABLES  =============*/
SELECT p.content,p.id AS publi_Id,u.name AS publie_par 
FROM publication p
    INNER JOIN "user" u
    ON u.id = p.owner_id;



