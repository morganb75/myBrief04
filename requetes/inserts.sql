/*=========== VIDAGE DE TOUTES LES TABLES ========*/
/*DELETE FROM publi_user_like;
DELETE FROM role_user;
DELETE FROM user_follow;
DELETE FROM publication;
DELETE FROM "user";
DELETE FROM role;*/

/*===========  insert users ======================*/

INSERT INTO "user"(name,first_name,email,password)
VALUES
('Desnoyer','Parfait','ParfaitDesnoyer@cuvox.de','pahvuG4h'),
('Lapointe','Tilly','TillyLapointe@fleckens.hu','eigaaGhae6'),
('Perrault','Ninette','NinettePerrault@superrito.com','oQuooph7coh'),
('Arnoux','Mignonette','MignonetteArnoux@dayrep.com','aT9och8Ohw'),
('Gour','Yseult','YseultGour@dayrep.com','WahTh2voh1'),
('Salois','Marie','MarieSalois@superrito.com','aes3Aepu8W'),
('de Chateaub','Caresse','CaressedeChateaub@gustr.com','Shiat2uPh'),
('Beaulieu','Mercer','MercerBeaulieu@cuvox.de','jooriTha9fai'),
('Barrière','Ganelon','GanelonBarriere@cuvox.de','ahfui9ba4B'),
('Simard','Virginie','VirginieSimard@teleworm.us','urooLa3zah');

/*===========  insert roles ======================*/
INSERT INTO role(name) 
VALUES
('admin'),
('moderateur'),
('membre');

/*===========  insert groupes ======================*/
INSERT INTO "group"(name,owner_id,date)
VALUES
('musique',5,'2024-03-12 02:32:14'),
('cinema',1,'2024-03-12 03:32:14'),
('sortie',3,'2024-03-12 04:32:14'),
('covoiturage',3,'2024-03-12 05:32:14');


/*===========  insert publi/com ======================*/
/*=================  PUBLICATIONS ===================================*/
INSERT INTO publication(content,owner_id,date,publication_id,group_id)
VALUES
('une publication  blablablablabla',1,'2024-03-12 14:54:31',NULL,NULL),
('une publication  blablablablabla',2,'2024-03-13 15:30:52',NULL,1),
('une publication  blablablablabla',3,'2024-03-14 21:24:27',NULL,NULL),
('une publication  blablablablabla',4,'2024-03-15 17:27:36',NULL,3),
('une publication  blablablablabla',1,'2024-03-16 20:35:24',NULL,4),
('une publication  blablablablabla',2,'2024-03-17 01:23:59',NULL,NULL),
('une publication  blablablablabla',3,'2024-03-12 14:54:31',NULL,2),
('une publication  blablablablabla',4,'2024-03-13 15:30:52',NULL,4),
('une publication  blablablablabla',5,'2024-03-14 21:24:27',NULL,NULL),
('une publication  blablablablabla',6,'2024-03-15 17:27:36',NULL,1),
('une publication  blablablablabla',7,'2024-03-16 20:35:24',NULL,4),
('une publication  blablablablabla',8,'2024-03-17 01:23:59',NULL,NULL);

/*=================  COMMENTAIRES ===================================*/
INSERT INTO publication(content,owner_id,date,publication_id,group_id)
VALUES
('un commentaire de publication',2,'2024-03-18 15:28:12',1,NULL),
('un commentaire de publication',4,'2024-03-19 17:00:23',3,NULL),
('un commentaire de publication',6,'2024-03-19 17:00:23',2,1),
('un commentaire de publication',8,'2024-03-19 17:00:23',10,1),
('un commentaire de publication',10,'2024-03-18 15:28:12',6,NULL),
('un commentaire de publication',7,'2024-03-19 17:00:23',12,NULL),
('un commentaire de publication',4,'2024-03-19 17:00:23',5,4),
('un commentaire de publication',9,'2024-03-19 17:00:23',8,2);

/*===========  insert user_group ======================*/

INSERT INTO user_group(group_id,user_id,role_id)
VALUES
(1,1,1),
(1,2,3),
(2,3,1),
(2,4,3),
(3,5,1),
(3,6,3),
(4,7,1),
(4,8,2);

/*===========  insert publi_user_like ======================*/
INSERT INTO publi_user_like(user_id,liked_id)
VALUES
(2,1),
(3,1),
(4,1),
(3,4);

/*===========  insert user_follow ======================*/
INSERT INTO user_follow(user_id,followed_id) 
VALUES
(1,2),
(3,2),
(3,4);