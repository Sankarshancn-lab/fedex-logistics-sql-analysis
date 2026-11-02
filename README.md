\# FedEx Logistics SQL Analysis



\## Project Overview



A SQL-based logistics analytics project focused on analyzing shipment operations, delivery performance, transportation efficiency, warehouse utilization and delivery agent productivity.



The project uses MySQL to transform logistics data into meaningful operational insights through data cleaning, analytical queries, aggregations, joins, Common Table Expressions (CTEs) and window functions.



Developed as part of practical Data Science training.



\## Business Objectives



\* Evaluate shipment and delivery performance.

\* Identify routes experiencing frequent delivery delays.

\* Measure warehouse operational performance.

\* Analyze delivery agent productivity.

\* Calculate on-time delivery percentages.

\* Identify extreme shipment delays.

\* Evaluate warehouse utilization.

\* Support logistics decision-making through SQL analytics.



\## Technology Stack



\* MySQL

\* MySQL Workbench

\* SQL

\* Relational Database Management



\## SQL Concepts Implemented



\* Database creation and management

\* SELECT, WHERE, ORDER BY and LIMIT

\* GROUP BY and HAVING

\* Aggregate functions: COUNT, SUM and AVG

\* INNER JOIN and LEFT JOIN

\* Subqueries and derived tables

\* Common Table Expressions (CTEs)

\* Window functions using RANK()

\* Conditional logic using CASE WHEN

\* Date functions: STR\_TO\_DATE() and TIMESTAMPDIFF()

\* Set operations using UNION ALL

\* Data cleaning and duplicate removal



\## Project Structure



```text

fedex-logistics-sql-analysis/

│

├── SQL/

│   ├── Task-1.sql

│   ├── Task-2.sql

│   ├── Task-3.sql

│   ├── Task-4.sql

│   ├── Task-5.sql

│   ├── Task-6.sql

│   └── Task-7.sql

│

├── Documentation/

│   ├── Project\_Presentation.pptx

│   └── All\_Tasks\_SQL.txt

│

├── screenshots/

│

├── README.md

└── .gitignore

```



\## Analytical Modules



\### 1. Data Cleaning and Validation



\* Duplicate order identification and removal.

\* Missing delay value treatment.

\* Date format conversion.

\* Shipment date validation.

\* Referential integrity checks.



\### 2. Shipment Performance Analysis



\* Actual transit time calculation.

\* Average shipment delay by route.

\* On-time versus delayed shipment classification.

\* Delivery type performance comparison.

\* Shipment delay ranking by warehouse.



\### 3. Route Efficiency Analysis



\* Average transit time by route.

\* Distance-to-time efficiency calculations.

\* Identification of underperforming routes.

\* Routes with more than 20% delayed shipments.



\### 4. Warehouse Performance



\* Average warehouse delivery delays.

\* Shipment volume analysis.

\* Delayed shipment counts.

\* Warehouse operational performance.



\### 5. Delivery Agent Performance



\* On-time delivery percentage by agent.

\* Agent ranking within individual routes.

\* Identification of agents below 85% on-time performance.

\* Comparison of top-performing and bottom-performing agents.



\### 6. Shipment Status and Delay Analysis



\* Shipment delivery status examination.

\* Identification of problematic routes.

\* Minor, moderate and severe delay categorization.

\* Detection of shipments delayed by more than 120 hours.



\### 7. Business KPI Analysis



\* Average delivery delay by source country.

\* Overall on-time delivery percentage.

\* Average delay by route.

\* Warehouse utilization percentage.



\## Key Performance Indicators



| KPI                   | Description                                 |

| --------------------- | ------------------------------------------- |

| On-Time Delivery %    | Percentage of shipments delivered on time   |

| Average Delay         | Average shipment delay in hours             |

| Transit Time          | Actual time between pickup and delivery     |

| Route Efficiency      | Distance travelled relative to transit time |

| Agent Performance     | On-time delivery percentage by agent        |

| Warehouse Utilization | Shipment volume relative to daily capacity  |



\## Project Deliverables



\* Seven SQL task scripts.

\* Consolidated SQL reference document.

\* Project presentation.



\## Learning Outcomes



\* Writing complex analytical SQL queries.

\* Performing data cleaning using SQL.

\* Working with relational datasets.

\* Applying CTEs and window functions.

\* Developing business-oriented KPIs.

\* Translating logistics problems into SQL-based analysis.



\## Disclaimer



This is an educational project. It is not an official FedEx project and does not represent FedEx's internal operational data or proprietary analytics.



\## Author



\*\*Sankarshan CN\*\*



M.Tech Data Science Student



\[GitHub Profile](https://github.com/Sankarshancn-lab)



