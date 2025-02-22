SELECT 
    B.FIRST_NAME,
    B.LAST_NAME,
    COUNT(*) as borrow_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS borrower_rank
FROM BORROWERS B
INNER JOIN LOANS L ON B.BORROWERID = L.BORROWERID
GROUP BY 
    B.BORROWERID,
    B.FIRST_NAME,
    B.LAST_NAME;