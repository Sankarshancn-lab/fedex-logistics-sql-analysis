# Latest status of each shipment

SELECT 
    Shipment_ID,
    Delivery_Status,
    Delivery_Date
FROM fedex_shipments;

# Routes where MOST shipments are still “In Transit” or “Returned

SELECT 
    Route_ID,
    SUM(CASE WHEN Delivery_Status IN ('In Transit', 'Returned') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Problematic_Percent
FROM fedex_shipments
GROUP BY Route_ID
HAVING Problematic_Percent > 50;

# Most frequent delay patterns

SELECT 
    CASE 
        WHEN Delay_Hours BETWEEN 1 AND 24 THEN 'Minor Delay'
        WHEN Delay_Hours BETWEEN 25 AND 72 THEN 'Moderate Delay'
        WHEN Delay_Hours > 72 THEN 'Severe Delay'
        ELSE 'On Time'
    END AS Delay_Category,
    COUNT(*) AS Count
FROM fedex_shipments
GROUP BY Delay_Category;

# Shipments with extreme delay

SELECT 
    Shipment_ID,
    Route_ID,
    Warehouse_ID,
    Delay_Hours
FROM fedex_shipments
WHERE Delay_Hours > 120;



