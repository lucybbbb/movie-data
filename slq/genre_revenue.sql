//*which genre returns the highest revenue? *//

select g.genre, 
       sum(m.revenue) as total_revenue
from movies m
join movie_genres g
     on m.movie_id = g.movie_id
group by g.genre 
order by total_revenue desc;

       