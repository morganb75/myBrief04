/*==== DROP TOTALE SI NECESSAIRE ====*/
/*
 DROP TABLE IF EXISTS publi_user_like,
 user_group,user_follow,
 publication,"user",role,"group",attachment; 
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

/*======= TABLE GROUP ===*/
CREATE TABLE "group"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    owner_id INT NOT NULL
    visibilty BOOLEAN NOT NULL DEFAULT TRUE
);

/*======= TABLE PUBLICATION  ===*/
CREATE TABLE publication(
    id SERIAL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    owner_id INT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    publication_id INT REFERENCES publication(id) ON DELETE SET NULL,
    group_id INT REFERENCES "group"(id) ON DELETE SET NULL
);

/*======= TABLE ATTACHMENT  ===*/
CREATE TABLE attachment(
    id SERIAL PRIMARY KEY,
    url VARCHAR(255),
    url_img VARCHAR(255),
    url_vid VARCHAR(255),
    publication_id INT REFERENCES publication(id) ON DELETE CASCADE
);

/*======= TABLE SESSION  ===*/
CREATE TABLE session(
    id SERIAL PRIMARY KEY,
    date_start TIMESTAMP NOT NULL,
    date_end TIMESTAMP,
    user_id INT REFERENCES "user"(id) ON DELETE CASCADE
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
    notification BOOLEAN NOT NULL DEFAULT true,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES "user"(id),
    CONSTRAINT fk_followed
        FOREIGN KEY (followed_id)
        REFERENCES "user"(id)
);

/*======= TABLE DE JOINTURE user_group ===*/
CREATE TABLE user_group(
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    CONSTRAINT fk_group
        FOREIGN KEY (group_id)
        REFERENCES "group"(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES "user"(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_role
        FOREIGN KEY (role_id)
        REFERENCES role(id)
        ON DELETE CASCADE
);
