# Average Delivery Delay per Source Country

SELECT 
    r.Source_Country,
    AVG(s.Delay_Hours) AS Avg_Delay
FROM fedex_shipments s
JOIN fedex_routes r ON s.Route_ID = r.Route_ID
GROUP BY r.Source_Country;

# On-Time Delivery %

SELECT 
    SUM(CASE WHEN Delay_Hours <= 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS OnTime_Percent
FROM fedex_shipments;

# Average Delay per Route

SELECT 
    Route_ID,
    AVG(Delay_Hours) AS Avg_Delay
FROM fedex_shipments
GROUP BY Route_ID;

# Warehouse Utilization
SELECT 
    w.Warehouse_ID,
    COUNT(s.Shipment_ID) * 100.0 / w.Capacity_per_day AS Utilization_Percent
FROM fedex_warehouses w
LEFT JOIN fedex_shipments s 
    ON w.Warehouse_ID = s.Warehouse_ID
GROUP BY w.Warehouse_ID, w.Capacity_per_day;


