//*which genre porivides the best return of investement roi?*//
select 
       g.genre, 
       m.revenue, 
       m.budget, 
      ((revenue-budget)/budget)*100 as Roi
from movies m
join movie_genres g
     on m.movie_id = g.movie_id
     
order by Roi desc;






