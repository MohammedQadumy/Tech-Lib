
--the most popular genre for a given month.

WITH GenrePopularity AS (
    SELECT 
        BK.Genre,
        COUNT(*) as borrow_count,
        DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) as genre_rank,
        FORMAT(L.Date_Borrowed, 'MMMM yyyy') as borrow_period
    FROM LOANS L
    INNER JOIN BOOKS BK ON L.BOOKID = BK.BOOKID
    WHERE MONTH(L.Date_Borrowed) = 9  -- For SEPTEMBER
    AND YEAR(L.Date_Borrowed) = 2024   -- For 2024
    GROUP BY 
        BK.Genre,
        FORMAT(L.Date_Borrowed, 'MMMM yyyy')
)
SELECT *
FROM GenrePopularity
ORDER BY genre_rank;