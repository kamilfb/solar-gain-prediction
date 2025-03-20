SELECT	
	sm.statistic_id,
	datetime(s.start_ts, 'unixepoch') AS start_time,
	coalesce(s.state, s.mean) AS value
FROM
	statistics AS s
JOIN
	statistics_meta AS sm ON s.metadata_id = sm.id
WHERE
	sm.statistic_id in ('sensor.solar_gen', 'sensor.domek_solar_percentage')
	AND s.start_ts >= strftime('%s', '2024-01-01 00:00:00')
ORDER BY
	s.start_ts ASC;
