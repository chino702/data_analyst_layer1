-- sqlite

-- New vs Returning customers by month

-- Teaches: cohort logic + grouping at the correct grain

WITH first_order AS (

  SELECT

    user_id,

    MIN(order_ts) AS first_order_ts               -- first purchase timestamp per user
  
  FROM orders
  GROUP BY user_id

),

orders_with_cohort AS (
  
  SELECT
    o.order_id,

    o.user_id,

    o.order_ts,

    o.net_revenue,

    STRFTIME('%Y-%m', o.order_ts) AS order_month,  -- order month (YYYY-MM)
    
    STRFTIME('%Y-%m', f.first_order_ts) AS cohort_month
 
  FROM orders o
  
  JOIN first_order f
    
    ON f.user_id = o.user_id
)

SELECT
  order_month,

  SUM(CASE WHEN order_month = cohort_month THEN 1 ELSE 0 END) AS new_orders,
  
  SUM(CASE WHEN order_month != cohort_month THEN 1 ELSE 0 END) AS returning_orders,
  
  COUNT(DISTINCT CASE WHEN order_month = cohort_month THEN user_id END) AS new_customers,
  
  COUNT(DISTINCT CASE WHEN order_month != cohort_month THEN user_id END) AS returning_customers,
  
  ROUND(SUM(net_revenue), 2) AS revenue
FROM orders_with_cohort

GROUP BY order_month

ORDER BY order_month;