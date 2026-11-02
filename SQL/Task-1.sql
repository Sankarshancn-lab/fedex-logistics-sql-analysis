CREATE DATABASE fedex_logistics;
USE fedex_logistics;


SELECT * FROM fedex_orders LIMIT 5;

SELECT Order_ID, COUNT(*)
FROM fedex_orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

DELETE o1 FROM fedex_orders o1
JOIN fedex_orders o2
ON o1.Order_ID = o2.Order_ID
AND o1.Customer_ID > o2.Customer_ID;

SELECT Shipment_ID, COUNT(*)
FROM fedex_shipments
GROUP BY Shipment_ID
HAVING COUNT(*) > 1;

UPDATE fedex_shipments s
JOIN (
    SELECT Route_ID, AVG(Delay_Hours) AS avg_delay
    FROM fedex_shipments
    WHERE Delay_Hours IS NOT NULL
    GROUP BY Route_ID
) r 
ON s.Route_ID = r.Route_ID
SET s.Delay_Hours = r.avg_delay
WHERE s.Delay_Hours IS NULL;


UPDATE fedex_orders
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d %H:%i:%s')
WHERE Order_ID IS NOT NULL;

UPDATE fedex_shipments
SET Pickup_Date = STR_TO_DATE(Pickup_Date, '%Y-%m-%d %H:%i:%s'),
    Delivery_Date = STR_TO_DATE(Delivery_Date, '%Y-%m-%d %H:%i:%s')
WHERE Shipment_ID IS NOT NULL;


SELECT *
FROM fedex_shipments
WHERE Delivery_Date < Pickup_Date;

SELECT o.Route_ID
FROM fedex_orders o
LEFT JOIN fedex_routes r ON o.Route_ID = r.Route_ID
WHERE r.Route_ID IS NULL;

