# Database-Managment-Systems
<B>Step 1: Install Postgis and Enable it on Postgres</B><br><br>
To download OSM data in the desired format from Overpass Turbo:<br><br>
Visit https://overpass-turbo.eu/<br><br>
Click the "Wizard" button.<br><br>
Enter a search query (e.g., "amenity=Metro") to filter the data.<br><br>
Click "Build and Run Query."<br><br>
Adjust the map view as needed.<br><br>
Click "Export" in the top right corner.<br><br>
Choose GeoJSON or KML format.<br><br>
Click "download."<br><br>
That's it! You can now download the GeoJSON data for Metro stations in the United States of America.<br><br>
<B>Step 2: Get the Data from an online source.</B><br><br>
Then we imported the data using the following command:<br><br>
ogr2ogr -f "PostgreSQL" PG:"dbname=gis_analysis user=postgres
host=/var/run/postgresql port=5432" "/home/ubuntu/export.geojson"
-nln public.geo_features -lco GEOMETRY_NAME=geom -lco FID=gid -lco
PRECISION=NO -nlt PROMOTE_TO_MULTI -a_srs EPSG:4326<br><br>
<B>Goal 1: Retrieve Locations of Specific Features</B><br><br>
This query retrieves the unique identifier, ID, area, and location of the first 5 train stations that have internet access from the "train_station" table.<br><br>
<B>Goal 2: Retrieve Locations of Specific Features</B><br><br>
This query retrieves the gid, id, area, location, station, and subway information of the train stations that have the name 'Grand Central Station' and limits the result to 5 rows. It is used to retrieve specific information about the train stations with a specific name.<br><br>
<B>Goal 3: Calculate Areas of Interest (Specific to Each Group)</B><br><br>
This query calculates the buffer of 1 mile around the train stations that have internet access, by creating two CTEs: internet_stations and buffers. The first one selects the relevant stations and transforms the geometry to a projected coordinate system. The second one calculates the buffer around the transformed geometries. Finally, the main query selects the resulting buffer geometries and calculates their area, returning the geometry and area of the first buffer in the result set with a limit of 1.<br><br>
The query will retrieve the area of a buffer of 1 mile (5280 feet) around the train stations that have internet access. The output will include the buffer geometry and its corresponding area. The LIMIT clause limits the output to only one record.Subsequently, the query calculates the area of the resultant polygon in square meters.<br><br>
<B>Goal 4: Query Analysis</B><br><br>
Analyzing queries is crucial for understanding the efficiency and effectiveness of your queries. In PostgreSQL, you have the option to employ the EXPLAIN or EXPLAIN ANALYZE command to delve into your queries. The EXPLAIN command furnishes a query execution plan, while the EXPLAIN ANALYZE command executes the query and provides additional details, such as actual execution times and the count of returned rows.<br><br>
<B>Goal 5: Sorting and Limit Executions</B><br><br>
Sorting and limiting query results can help optimize queries by reducing the amount of data that needs to be processed and returned. By limiting the number of rows returned and ordering them according to specific criteria, the database can process the query more efficiently, improving its performance and reducing the amount of time it takes to execute. This can be particularly useful for queries that return large amounts of data or are executed frequently.<br><br>
<B>Goal 6: Query Optimization for Improved Execution Time</B><br><br>
To enhance the execution time of queries, optimizing techniques such as index utilization, simplifying calculations, and reducing the number of scanned rows can be employed. Here are some optimization techniques applied to the previously used queries:<br><br>
Index utilization: Utilizing indexes efficiently helps accelerate query performance. By creating and properly utilizing indexes on frequently queried columns, database systems can quickly locate the required data.<br><br>
Simplifying calculations: Simplifying complex calculations within queries can lead to faster execution times. This can involve reducing the number of mathematical operations or utilizing simpler logic to achieve the desired results.<br><br>
Reducing the number of scanned rows: Employing appropriate filtering conditions, such as utilizing WHERE clauses, can minimize the number of rows scanned by the database engine. This can significantly improve query performance, especially when dealing with large datasets.<br><br>
In summary, optimizing queries involves leveraging indexes, simplifying calculations, and reducing the number of scanned rows to enhance execution time and overall query performance.<br><br>
<B>Optimization of Goal 1:</B><br><br>
This query is trying to find the first 5 rows in the `train_station` table where the value of the `internet_access` column is "yes". To improve the performance of this query, an index has been created on the `internet_access` column. The `explain` command can be used to see how the database is executing the query and which indexes are being used.<br><br>
<B>Optimization of Goal 2:</B><br><br>
We can create a spatial index on the geom column to speed up spatial operations:<br><br>
<B>Optimization of Goal 3:</B><br><br>
To optimize the execution of this query, we can leverage the existing spatial index created on the geom column. By utilizing this spatial index, we can enhance the efficiency of spatial operations performed within the query, leading to faster processing and improved overall performance.<br><br>
These optimizations aim to enhance query performance by utilizing indexes for filtering and spatial operations. It is important to note that creating indexes can result in increased storage space and potential impacts on the performance of data modifications (such as insert, update, and delete operations). Therefore, it is crucial to strike a balance between the improved query performance and the associated costs of storage and modifications.<br><br>
<B>Goal 7: N-Optimization of Queries</B><br><br>
N-optimization involves optimizing queries to ensure their efficiency even when the number of rows in the database significantly increases. This can be accomplished by implementing various techniques such as index utilization, limiting the amount of processed data, and selecting only the required columns. Here are the N-optimizations for the queries used:<br><br>
<B>Optimization of Goal 1:</B><br><br>
To achieve N-optimization for this query, we can enhance its performance by creating an index on the cuisine column. This index will assist in efficiently filtering rows as the size of the database expands, ensuring that the query remains fast and scalable.<br><br>
<B>N-Optimization of Goal 2:</B><br><br>
To achieve N-optimization for this query, we previously implemented a spatial index on the geom column. By utilizing this spatial index, the database can perform spatial operations more efficiently, ensuring faster query execution, even when the number of rows in the database experiences significant growth.<br><br>
However, the ST_Distance function may not be efficient with a large number of rows. To improve
the performance, we can use the ST_DWithin function to filter only the cafes within a certain
distance of the specific point, and then calculate the exact distance:<br><br>
<B>N-Optimization of Goal 3:</B><br><br>
For N-optimization of this query, we can leverage the previously created spatial index on the geom column. This spatial index significantly enhances the performance of spatial operations involved in the query, enabling efficient filtering of cafes within a 5000-meter radius of the specified point. As a result, the query execution remains fast and scalable, even as the size of the database grows.<br><br>
These optimizations ensure efficient query execution, even as the database experiences significant growth in the number of rows. By implementing these optimizations, the queries will maintain their performance and scalability, handling larger datasets without compromising efficiency.<br><br>
<B>Goal 8: Presentation and Posting to Individual GitHub</B><br><br>
Here are the github links for all the 3 group members:<br><br>
Brinda Patel<br><br>
Avadhi Shah<br><br>
Mudra Koradia<br><br>
<B>Goal 9: Code functionality, documentation and proper output provided</B><br><br>
This document already contains all the details<br><br>












