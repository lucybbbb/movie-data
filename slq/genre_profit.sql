//* which genre has the highest profit margin *//


SELECT
    g.genre,
    SUM(m.revenue - m.budget) AS total_profit
FROM movies m
JOIN movie_genres g
    ON m.movie_id = g.movie_id
GROUP BY g.genre
ORDER BY total_profit DESC;

//* total profit by genre *//

select g.genre,
       sum(m.revenue) as total_revenue, 
       sum(m.budget) as total_budget, 
       sum(m.revenue - m.budget) as total_profit, 
       round(
          (sum(m.revenue - m.budget)/ sum(m.budget)) *100, 2
       ) as profit_margin
from movies m
join movie_genres g
on m.movie_id = g.movie_id
group by g.genre 
order by profit_margin desc; 