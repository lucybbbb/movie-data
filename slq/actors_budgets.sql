//* actors linked to the highets budgets *//

SELECT 
      c.actor, 
      m.budget
from movies m 
join movie_cast c 
ON
  m.movie_id = c.movie_id
order by budget desc;