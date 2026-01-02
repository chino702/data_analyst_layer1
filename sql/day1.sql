-- sqlite
-- Day 1 Query 1: Daily revenue + order count + aov (average order value)

SELECT

 DATE(order_ts) AS day, -- Converts timestamp to YYYY-MM-DD

 COUNT(*) AS orders,    -- Number of orders that day

 ROUND(SUM(net_revenue), 2) AS revenue,  -- Total revenue that day

 ROUND(AVG(net_revenue), 2) AS aov       -- Average revenue per order that day

 FROM orders

 GROUP BY 1             -- Group results by the first selected column (day)

 ORDER BY 1             -- Sort by day ascending
 
 LIMIT 10;              -- show first 10 days