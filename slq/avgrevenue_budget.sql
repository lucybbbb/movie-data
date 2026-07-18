//* overall average revenue per budget**//

select 
       title,
       round(avg(budget), 2) as average_budget, 
       round(avg(revenue), 2) as average_revenue
from movies
group by title;
      