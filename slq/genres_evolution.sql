//*how have genres evolved over time: most popular genres, movies per genre, genre tren *//

select 
      g.genre,
      count(m.movie_id) as total_movies,
      year(m.release_date) as year
from movies m
join movie_genres g
     on 
     g.movie_id = m.movie_id 
group by genre, year
order by year, total_movies desc;



