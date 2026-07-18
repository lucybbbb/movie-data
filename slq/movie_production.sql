//* how has movie production changed over time? --> movies released per year, growth trend  *// 

select year(release_date),
       sum(revenue) as total_revenue,
       count(movie_id) as total_movies
from movies
group by year(release_date)
order by  total_movies desc, total_revenue desc;