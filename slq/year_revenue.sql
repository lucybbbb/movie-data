//* which year generated the most revenue *//

select 
       year(release_date) as release_year, 
       count(movie_id) as total_movies, 
       sum(revenue) as total_revenue, 
       round(avg(revenue), 2) as average_revenue
from movies
group by year(release_date)
order by total_revenue desc;

