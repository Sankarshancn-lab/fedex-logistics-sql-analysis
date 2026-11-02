# Warehouse Performance

SELECT Warehouse_ID, AVG(Delay_Hours) AS Avg_Delay
FROM fedex_shipments
GROUP BY Warehouse_ID
ORDER BY Avg_Delay DESC
LIMIT 3;

SELECT Warehouse_ID,
       COUNT(*) AS Total_Shipments,
       SUM(CASE WHEN Delay_Hours > 0 THEN 1 ELSE 0 END) AS Delayed_Shipments
FROM fedex_shipments
GROUP BY Warehouse_ID;

