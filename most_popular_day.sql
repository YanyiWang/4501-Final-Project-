
SELECT strftime('%w', pickup_datetime) AS day, COUNT(*) AS number
FROM uber_trips
GROUP BY day
ORDER BY number DESC;
