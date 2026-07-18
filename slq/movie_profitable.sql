//*the msot profitable movie*//

select title,
       revenue, 
       budget,
       (revenue - budget) as profit
from movies
order by profit desc; 
