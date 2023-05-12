SELECT gid, id, area, location FROM train_station WHERE internet_access = 'yes' LIMIT 5;

SELECT gid, id, area, location, station, subway FROM train_station WHERE name = 'Grand Central Station' LIMIT 5; 	
WITH internet_stations AS (
  SELECT gid, id, area, location, ST_Transform(geom, 26918) AS geom
  FROM train_station
  WHERE internet_access = 'yes'
),
buffers AS (
  SELECT gid, ST_Buffer(geom, 5280) AS geom
  FROM internet_stations
)

SELECT buffers.gid, buffers.geom, ST_Area(buffers.geom) AS area
FROM buffers
LIMIT 1;
ELECT gid, id, area, location, station, subway
FROM train_station
WHERE name = 'Grasmere'
ORDER BY area DESC
LIMIT 10;

EXPLAIN ANALYZE SELECT gid, id, area, location, station, subway FROM train_station WHERE name = 'Grasmere' LIMIT 5;

EXPLAIN ANALYSE WITH internet_stations AS (SELECT gid, id, area, location, ST_Transform(geom, 26918) AS geom
FROM train_station
WHERE internet_access = 'yes'),
buffers AS (SELECT gid, ST_Buffer(geom, 5280) AS geom
FROM internet_stations)
SELECT buffers.gid, buffers.geom, ST_Area(buffers.geom) AS area
FROM buffers
LIMIT 1;

SELECT gid, id, area, location, station, subway
FROM train_station
WHERE name = 'Grasmere'
ORDER BY area DESC
LIMIT 10;


SELECT gid, id, area, location FROM train_station WHERE internet_access = 'yes' ORDER BY id DESC LIMIT 5;

CREATE INDEX idx_train_station_internet_access ON train_station (internet_access);
CREATE INDEX

SELECT gid, id, area, location
FROM train_station
WHERE internet_access = 'yes'
LIMIT 5;

CREATE INDEX idx_train_station_name ON train_station (name);
CREATE INDEX
SELECT gid, id, area, location, station, subway
FROM train_station
WHERE name = 'Grasmere'
LIMIT 5;

CREATE INDEX train_station_geom_idx ON train_station USING GIST (geom);

WITH internet_stations AS (
  SELECT gid, id, area, location, ST_Transform(geom, 3857) AS geom
  FROM train_station
  WHERE internet_access = 'yes'
),
buffers AS (
  SELECT gid, ST_Buffer(geom, 1000) AS geom
  FROM internet_stations
)
SELECT buffers.gid, buffers.geom, ST_Area(buffers.geom) AS area
FROM buffers;

CREATE INDEX new_internet_access_idx ON train_station (internet_access);
SELECT gid, id, area, location
FROM train_station
WHERE internet_access = 'yes'
LIMIT 5;

SELECT gid, id, area, location, station, subway
FROM train_station
WHERE name = 'Grasmere'
LIMIT 5;

CREATE INDEX internet_access_idx ON train_station (internet_access) INCLUDE (geom);
WITH internet_stations AS (
  SELECT gid, id, area, location, ST_Transform(geom, 3857) AS geom
  FROM train_station
  WHERE internet_access = 'yes'
),

buffers AS (
  SELECT gid, ST_Buffer(geom, 1000) AS geom
  FROM internet_stations
)
SELECT buffers.gid, buffers.geom, ST_Area(buffers.geom) AS area
FROM buffers LIMIT 1;

