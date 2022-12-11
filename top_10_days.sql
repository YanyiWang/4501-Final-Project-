
WITH hired_trips AS
(
    SELECT pickup_datetime, distance FROM taxi_trips 
    WHERE pickup_datetime BETWEEN '2009-01-01' AND '2010-01-01'
    UNION ALL
    SELECT pickup_datetime, distance FROM uber_trips
    WHERE pickup_datetime BETWEEN '2009-01-01' AND '2010-01-01'
)
SELECT DATE(pickup_datetime) AS date, COUNT(*) AS number, printf("%.4f",AVG(distance)) AS avg_distance
FROM hired_trips
GROUP BY date
ORDER BY number DESC
LIMIT 10;
