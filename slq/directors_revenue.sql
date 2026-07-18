//*which directors will have the highets revenue? *//
select 
      d.director,
      m.revenue
from movies m 
join movie_directors d 
     on m.movie_id = d.movie_id
order by revenue desc; 


//*director with the bigger numer of movies? *//
select d.director, 
       count(m.movie_id) as total_movies
from movies m
join movie_directors d
     on 
        m.movie_id = d.movie_id 
group by d.director
order by total_movies desc;


//*directors with avg revenue *//

select 
      d.director,
      avg(m.revenue) as average_revenue
from movies m 
join movie_directors d 
     on m.movie_id = d.movie_id
group by d.director     
order by average_revenue desc
limit 5; 

//*total revenue: first five directors *//

select 
      d.director,
      sum(m.revenue) as sum_revenue
from movies m 
join movie_directors d 
     on m.movie_id = d.movie_id
group by d.director     
order by sum_revenue desc
limit 5; 

//* top 10 directors with an average profit *//
select 
      d.director,
      avg(m.revenue - m.budget) as profit
from movies m 
join movie_directors d 
     on m.movie_id = d.movie_id
group by d.director     
order by profit desc
limit 10;
