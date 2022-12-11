
WITH hired_trips AS
(
    SELECT DATE(pickup_datetime) AS date FROM taxi_trips
    WHERE date BETWEEN '2014-01-01' AND '2015-01-01'
    UNION ALL
    SELECT DATE(pickup_datetime) AS date FROM uber_trips
    WHERE date BETWEEN '2014-01-01' AND '2015-01-01'
)
SELECT hired_trips.date as date, printf("%.4f",daily_wind_speed), COUNT(*) AS number
FROM hired_trips
JOIN daily_weather ON hired_trips.date = DATE(daily_weather.date)
GROUP BY hired_trips.date
ORDER BY daily_wind_speed DESC
LIMIT 10
