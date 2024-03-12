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
('editeur'),
('visiteur');


/*===========  insert publi/com ======================*/

INSERT INTO publication(content,owner_id,date,publication_id)
VALUES
('une publication  ayant pour id 1 par user id1',1,'2024-03-12 14:54:31',NULL),
('une publication  ayant pour id 2 par user id2',2,'2024-03-13 15:30:52',NULL),
('une publication  ayant pour id 3 par user id3',3,'2024-03-14 21:24:27',NULL),
('une publication  ayant pour id 4 par user id4',4,'2024-03-15 17:27:36',NULL),
('une publication  ayant pour id 5 par user id1',1,'2024-03-16 20:35:24',NULL),
('une publication  ayant pour id 6 par user id2',2,'2024-03-17 01:23:59',NULL),
('un commentaire de la publication id1  ayant pour id 7 par le user id1',1,'2024-03-18 15:28:12',1),
('un commentaire de la publication id1  ayant pour id 8 par le user id2',2,'2024-03-19 17:00:23',1),
('un commentaire de la publication id2  ayant pour id 9 par le user id3',3,'2024-03-19 17:00:23',2),
('un commentaire de la publication id2  ayant pour id 10 par le user id4',4,'2024-03-19 17:00:23',2);

/*===========  insert role_user ======================*/

INSERT INTO role_user(role_id,user_id)
VALUES
(1,1),(1,2),(3,1),(4,2);


/*===========  insert publi_user_like ======================*/
INSERT INTO publi_user_like(user_id,liked_id)
VALUES
(2,1),(3,1),(4,1),(3,4);

/*===========  insert user_follow ======================*/
INSERT INTO user_follow(user_id,followed_id) 
VALUES
(1,2),(3,2),(3,4);