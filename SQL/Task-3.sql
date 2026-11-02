#Avg Transit Time per Route

SELECT Route_ID,
       AVG(TIMESTAMPDIFF(HOUR, Pickup_Date, Delivery_Date)) AS Avg_Transit_Time
FROM fedex_shipments
GROUP BY Route_ID;

# Avg Delay per Route

SELECT Route_ID, AVG(Delay_Hours) AS Avg_Delay
FROM fedex_shipments
GROUP BY Route_ID;

# Distance-to-Time Efficiency Ratio

SELECT r.Route_ID,
       r.Distance_KM / r.Avg_Transit_Time_Hours AS Efficiency_Ratio
FROM fedex_routes r;

# Worst 3 Routes

SELECT Route_ID,
       Distance_KM / Avg_Transit_Time_Hours AS Efficiency_Ratio
FROM fedex_routes
ORDER BY Efficiency_Ratio ASC
LIMIT 3;

# Routes with >20% delayed shipments

SELECT Route_ID,
       SUM(CASE WHEN Delay_Hours > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Delay_Percent
FROM fedex_shipments
GROUP BY Route_ID
HAVING Delay_Percent > 20;




