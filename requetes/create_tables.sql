/*==== DROP TOTALE SI NECESSAIRE ====*/
/*
DROP TABLE comment,publication,role_dbuser,dbuser,role; 
*/
/*=============== TABLE USER ==============*/
CREATE TABLE dbuser(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    role_id INT NOT NULL
);

/*=============== TABLE ROLE ==============*/
CREATE TABLE role(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

/*======= TABLE DE JOINTURE ROLE_DBUSER ===*/
CREATE TABLE role_dbuser(
    role_id INT NOT NULL,
    dbuser_id INT NOT NULL,
    CONSTRAINT fk_role
        FOREIGN KEY(role_id)
        REFERENCES role(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_dbuser
        FOREIGN KEY (dbuser_id)
        REFERENCES dbuser(id)
        ON DELETE CASCADE
);

/*======= TABLE PUBLICATION  ===*/
CREATE TABLE publication(
    id SERIAL PRIMARY KEY,
    content VARCHAR(255),
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    owner_id INT NOT NULL,
    liker_id INT,
    follower_id INT,
    CONSTRAINT fk_owner
        FOREIGN KEY (owner_id)
        REFERENCES dbuser(id)
        ON DELETE SET NULL
);

/*======= TABLE DE JOINTURE publi_user_follow ===*/
CREATE TABLE publi_follower(
    follower_id INT,
    user_id INT,
    CONSTRAINT fk_publi_follower
        FOREIGN KEY (follower_id)
        REFERENCES dbuser(id),
    CONSTRAINT fk_user_follower
        FOREIGN KEY(user_id)
        REFERENCES dbuser(id)
);

/*======= TABLE DE JOINTURE publi_user_like ===*/
CREATE TABLE publi_user(
    liker_id INT,
    user_id INT,
    CONSTRAINT fk_publi_liker
        FOREIGN KEY (liker_id)
        REFERENCES dbuser(id),
    CONSTRAINT fk_user_liker
        FOREIGN KEY (user_id)
        REFERENCES 
);

/*======= TABLE COMMENT  ===*/
CREATE TABLE comment(
    id SERIAL PRIMARY KEY,
    text VARCHAR(255),
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    publication_id INT NOT NULL,
    owner_id INT NOT NULL,
    liker_id INT,
    CONSTRAINT fk_publication
        FOREIGN KEY (publication_id)
        REFERENCES publication(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_owner_id
        FOREIGN KEY (owner_id)
        REFERENCES dbuser(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_liker_id
        FOREIGN KEY (liker_id)
        REFERENCES dbuser(id)
        ON DELETE SET NULL
);

/*======= TABLE DE JOINTURE comment_user_owner ===*/
CREATE TABLE comment_user_owner(
    comment_id INT NOT NULL,
    dbuser_id INT NOT NULL,
    CONSTRAINT fk_
)
/*======= TABLE DE JOINTURE comment_user_like ===*/