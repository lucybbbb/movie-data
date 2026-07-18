LOAD DATA INFILE 'Movie-Data.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, release_date, budget, revenue, wiki_url);


SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'Movie-Data_utf8.xlsx'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, release_date, budget, revenue, wiki_url);
