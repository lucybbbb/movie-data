
use movie_data;
show tables;
SELECT COUNT(*) FROM movies;
SHOW VARIABLES LIKE 'secure_file_priv';

-- repeat for Genre2 if exists

ALTER TABLE movies CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

SELECT COUNT(*) FROM movies;
SELECT * FROM movies LIMIT 10;
SHOW VARIABLES LIKE 'secure_file_priv';

use movie_data;
show tables;


CREATE TABLE movies_staging (
    title VARCHAR(255),
    release_date VARCHAR(50),
    wiki_url VARCHAR(255),
    genre1 VARCHAR(100),
    genre2 VARCHAR(100),
    director1 VARCHAR(100),
    director2 VARCHAR(100),
    cast1 VARCHAR(100),
    cast2 VARCHAR(100),
    cast3 VARCHAR(100),
    cast4 VARCHAR(100),
    cast5 VARCHAR(100),
    budget VARCHAR(50),
    revenue VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Movie-Data-cleaned.csv'
INTO TABLE movies_staging
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, release_date, wiki_url, genre1, genre2, director1, director2,
 cast1, cast2, cast3, cast4, cast5, budget, revenue);
SELECT COUNT(*) FROM movies_staging;

SELECT * FROM movies_staging LIMIT 5;
select * from movies_staging limit 10;

use movie_data;

DROP TABLE IF EXISTS movie_cast;
DROP TABLE IF EXISTS movie_directors;
DROP TABLE IF EXISTS movie_genres;
DROP TABLE IF EXISTS movies;

USE movie_data;

CREATE TABLE  movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    release_date DATE,
    budget DECIMAL(15,2),
    revenue DECIMAL(15,2),
    wiki_url VARCHAR(255)
);

CREATE TABLE movie_genres (
    movie_id INT NOT NULL,
    genre VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE  movie_directors (
    movie_id INT NOT NULL,
    director VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE movie_cast (
    movie_id INT NOT NULL,
    actor VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
show tables;

INSERT INTO movies (title, release_date, wiki_url, budget, revenue)
SELECT 
    title,
    STR_TO_DATE(release_date, '%m/%d/%Y'),
    wiki_url,
    NULLIF(budget, ''),
    NULLIF(revenue, '')
FROM movies_staging;

SELECT COUNT(*) FROM movies;
INSERT INTO movie_genres (movie_id, genre)
SELECT m.movie_id, TRIM(s.genre1)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.genre1 IS NOT NULL AND s.genre1 != '';

INSERT INTO movie_genres (movie_id, genre)
SELECT m.movie_id, TRIM(s.genre2)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.genre2 IS NOT NULL AND s.genre2 != '';

INSERT INTO movie_directors (movie_id, director)
SELECT m.movie_id, TRIM(s.director1)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.director1 IS NOT NULL AND s.director1 != '';

INSERT INTO movie_directors (movie_id, director)
SELECT m.movie_id, TRIM(s.director2)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.director2 IS NOT NULL AND s.director2 != '';


INSERT INTO movie_cast (movie_id, actor)
SELECT m.movie_id, TRIM(s.cast1)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.cast1 IS NOT NULL AND s.cast1 != '';

INSERT INTO movie_cast (movie_id, actor)
SELECT m.movie_id, TRIM(s.cast2)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.cast2 IS NOT NULL AND s.cast2 != '';

INSERT INTO movie_cast (movie_id, actor)
SELECT m.movie_id, TRIM(s.cast3)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.cast3 IS NOT NULL AND s.cast3 != '';

INSERT INTO movie_cast (movie_id, actor)
SELECT m.movie_id, TRIM(s.cast4)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.cast4 IS NOT NULL AND s.cast4 != '';

INSERT INTO movie_cast (movie_id, actor)
SELECT m.movie_id, TRIM(s.cast5)
FROM movies_staging s
JOIN movies m ON m.title = s.title
WHERE s.cast5 IS NOT NULL AND s.cast5 != '';
SELECT COUNT(*) FROM movies;
SELECT COUNT(*) FROM movie_genres;
SELECT COUNT(*) FROM movie_directors;
SELECT COUNT(*) FROM movie_cast;


SELECT * FROM movies LIMIT 5;
SELECT * FROM movie_genres LIMIT 5;
SELECT * FROM movie_directors LIMIT 5;
SELECT * FROM movie_cast LIMIT 5;

