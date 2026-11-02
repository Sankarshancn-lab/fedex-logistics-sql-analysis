SELECT Shipment_ID,
       TIMESTAMPDIFF(HOUR, Pickup_Date, Delivery_Date) AS Transit_Hours
FROM fedex_shipments;  #Actual Transit Time


#This shows how long delivery actually took.

SELECT Route_ID, AVG(Delay_Hours) AS Avg_Delay
FROM fedex_shipments
GROUP BY Route_ID
ORDER BY Avg_Delay DESC
LIMIT 10;


#Shows worst shipments handled by each warehouse.

SELECT Shipment_ID, Warehouse_ID, Delay_Hours,
       RANK() OVER (PARTITION BY Warehouse_ID ORDER BY Delay_Hours DESC) AS Delay_Rank
FROM fedex_shipments;

#Avg Delay by Delivery Type

SELECT o.Delivery_Type, AVG(s.Delay_Hours) AS Avg_Delay
FROM fedex_shipments s
JOIN fedex_orders o ON s.Order_ID = o.Order_ID
GROUP BY o.Delivery_Type;

# On-Time vs Delayed

SELECT CASE WHEN Delay_Hours <= 0 THEN 'On-Time' ELSE 'Delayed' END AS Status,
       COUNT(*) AS Shipments
FROM fedex_shipments
GROUP BY CASE WHEN Delay_Hours <= 0 THEN 'On-Time' ELSE 'Delayed' END;





