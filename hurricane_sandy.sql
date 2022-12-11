
WITH hired_trips AS
(
    SELECT strftime('%Y-%m-%d %H',pickup_datetime) AS trip_hour FROM taxi_trips
    WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-10-31'
    UNION ALL
    SELECT strftime('%Y-%m-%d %H',pickup_datetime) AS trip_hour FROM uber_trips
    WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-10-31'
),
hurricane_weather AS
(
    SELECT strftime('%Y-%m-%d %H',datetime) AS weather_hour, hourly_precipitation, hourly_wind_speed FROM hourly_weather
    WHERE datetime BETWEEN '2012-10-22' AND '2012-10-31'
)
SELECT weather_hour, COALESCE(COUNT(trip_hour),0) AS number, hourly_precipitation, hourly_wind_speed
FROM hurricane_weather
LEFT JOIN hired_trips
ON trip_hour = weather_hour
GROUP BY weather_hour
