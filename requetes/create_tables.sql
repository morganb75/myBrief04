/*==== DROP TOTALE SI NECESSAIRE ====*/
/*
 DROP TABLE comment_user_like,
 publi_follower,publi_liker,role_user,comment,
 publication,user,role; 
*/
/*=============== TABLE USER ==============*/
CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

/*=============== TABLE ROLE ==============*/
CREATE TABLE role(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

/*======= TABLE DE JOINTURE ROLE_USER ===*/
CREATE TABLE role_user(
    role_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT fk_role
        FOREIGN KEY(role_id)
        REFERENCES role(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES "user"(id)
        ON DELETE CASCADE
);

/*======= TABLE PUBLICATION  ===*/
CREATE TABLE publication(
    id SERIAL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    owner_id INT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    publication_id INT REFERENCES publication(id) ON DELETE SET NULL
);

/*======= TABLE DE JOINTURE publi_user_like ====*/
CREATE TABLE publi_user_like(
    user_id INT,
    liked_id INT,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES "user"(id),
    CONSTRAINT fk_liked
        FOREIGN KEY (liked_id)
        REFERENCES publication(id)
);

/*======= TABLE DE JOINTURE user_follow ===*/
CREATE TABLE user_follow(
    user_id INT,
    followed_id INT,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES "user"(id),
    CONSTRAINT fk_followed
        FOREIGN KEY (followed_id)
        REFERENCES "user"(id)
);