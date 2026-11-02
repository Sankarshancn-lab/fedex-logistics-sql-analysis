# Delivery Agent Performance

SELECT 
    s.Route_ID,
    s.Agent_ID,
    SUM(CASE WHEN s.Delay_Hours <= 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS OnTime_Percent,
    RANK() OVER (
        PARTITION BY s.Route_ID 
        ORDER BY SUM(CASE WHEN s.Delay_Hours <= 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) DESC
    ) AS Agent_Rank_On_Route
FROM fedex_shipments s
GROUP BY s.Route_ID, s.Agent_ID;

# Agents with on-time % below 85%

SELECT 
    s.Agent_ID,
    SUM(CASE WHEN s.Delay_Hours <= 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS OnTime_Percent
FROM fedex_shipments s
GROUP BY s.Agent_ID
HAVING OnTime_Percent < 85;

# Compare top 5 vs bottom 5 agents

WITH Agent_Performance AS (
    SELECT 
        s.Agent_ID,
        SUM(CASE WHEN s.Delay_Hours <= 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS OnTime_Percent
    FROM fedex_shipments s
    GROUP BY s.Agent_ID
),

Top_Agents AS (
    SELECT Agent_ID
    FROM Agent_Performance
    ORDER BY OnTime_Percent DESC
    LIMIT 5
),

Bottom_Agents AS (
    SELECT Agent_ID
    FROM Agent_Performance
    ORDER BY OnTime_Percent ASC
    LIMIT 5
)

SELECT 
    'Top 5 Agents' AS Category,
    AVG(a.Avg_Rating) AS Avg_Rating,
    AVG(a.Experience_Years) AS Avg_Experience
FROM fedex_delivery_agents a
JOIN Top_Agents t ON a.Agent_ID = t.Agent_ID

UNION ALL

SELECT 
    'Bottom 5 Agents',
    AVG(a.Avg_Rating),
    AVG(a.Experience_Years)
FROM fedex_delivery_agents a
JOIN Bottom_Agents b ON a.Agent_ID = b.Agent_ID;


