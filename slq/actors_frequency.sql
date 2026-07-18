//*which actors appeared most frequently in movies ? --> number of appearences, avg revenue, total revenue generated *//

select c.actor, 
       count(m.movie_id) as number_of_appearences,
       avg(m.revenue) as average_revenue,
       sum(m.revenue) as total_revenue
from movies m
join movie_cast c
     on m.movie_id = c.movie_id 
group by c.actor
order by number_of_appearences desc, total_revenue desc;
