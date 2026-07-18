//* identify failures: reveneue < budget *//

select 
       movie_id, 
       title,
       revenue,
       budget, 
       (revenue-budget) as profit
from movies
where revenue <  budget
order by profit asc; 



