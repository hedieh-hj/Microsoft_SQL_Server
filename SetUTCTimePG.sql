SHOW timezone;
SELECT * FROM current_setting('TIMEZONE')

SET timezone = 'UTC';


select (to_timestamp(1723542674893 / 1000) AT TIME ZONE 'Asia/Tehran')
