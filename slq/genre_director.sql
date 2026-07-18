//* which director-genre combination generated the highets revenue *//

SELECT
    d.director,
    g.genre,
    SUM(m.revenue) AS total_revenue
FROM movies m
JOIN movie_directors d
    ON d.movie_id = m.movie_id
JOIN movie_genres g
    ON g.movie_id = m.movie_id
GROUP BY d.director, g.genre
ORDER BY total_revenue DESC
LIMIT 5; 