
SELECT strftime('%H', pickup_datetime) AS time, COUNT(*) AS number
FROM taxi_trips
GROUP BY time
ORDER BY number DESC;
