
select * from cleaned_movie_data;
describe movies;



//* select db, show tables and understand tables *//

select database();
show tables;
describe movie_cast;
describe movie_directors;
describe movie_genres;
describe movies;
describe movies_staging;

//* understand table size *//
select count(*) from movies; 
select count(*) from movie_cast;
select count(*) from movie_directors;
select count(*) from movie_genres;
select count(*) from movies_staging;

//* highest revenue *//

select 
       title, 
       revenue
from movies
order by revenue desc;