-- slite

-- Day 2: JOINs (orders ↔ users ↔ order_items ↔ products)

-- Goal: answer real analyst questions with correct joins + correct grain.

---------------------------------------------------------------------------------------

-- Query 1: Revenue by acquisition channel

-- Teaches : joining orders ( 1 row/order ) to users ( 1 row/user )

-- Grain: 1 row per acquasition_channel

---------------------------------------------------------------------------------------

SELECT 
    u.acquisition_channel,                     -- user attribute: where they came from

    COUNT(DISTINCT o.order_id) AS orders,      -- count orders (distinct just to be safe)

    COUNT(DISTINCT o.user_id) AS customers,    -- number of unique purchasers

    ROUND(SUM(o.net_revenue), 2) AS revenue,   -- order-level revenue

    ROUND(AVG(o.net_revenue), 2) AS aov        -- avg order value by channel

FROM orders o 

JOIN users u 

    ON u.user_id = o.user_id                  -- join key: orders.user_id → users.user_id

GROUP BY 1

ORDER BY revenue DESC;


----------------------------------------------------------------------------------------------------

-- Query 2: Top 10 customers by lifetime revenue

-- Teaches: Grouping at the customer grain

----------------------------------------------------------------------------------------------------

SELECT

  o.user_id,

  ROUND(SUM(o.net_revenue), 2) AS lifetime_revenue,

  COUNT(*) AS orders,

  ROUND(AVG(o.net_revenue), 2) AS aov,

  MIN(o.order_ts) AS first_order_ts,  -- earliest order timestamp
  
  MAX(o.order_ts) AS last_order_ts    -- most recent order timestamp

FROM orders o
GROUP BY o.user_id

ORDER BY lifetime_revenue DESC

LIMIT 10;


--------------------------------------------------------------------------------------------

-- Query 3: Top 10 products by revenue

-- Teaches: joining order_items (line-item grain) to products

-- Why not use orders? Because product revenue lives at the line-item grain. 

--------------------------------------------------------------------------------------------


SELECT
    p.product_id,

    p.category,

    p.brand,

    ROUND(SUM(oi.line_revenue), 2) AS revenue,        -- line-item revenue

    ROUND(SUM(oi.line_cost), 2) AS cogs,              -- cost of goods sold

    ROUND(SUM(oi.line_revenue) - SUM(oi.line_cost), 2) AS gross_margin,

    SUM(oi.quantity) AS units

FROM order_items oi

JOIN products p

    ON p.product_id = oi.product_id

GROUP BY 1,2,3

ORDER BY revenue DESC

LIMIT 10;



-----------------------------------------------------------------

-- Query 4: Revenue by category WITH rank inside each category

-- Teaches: window functions = ranking after aggregation

------------------------------------------------------------------


WITH product_rollup AS (

  SELECT

    p.category,

    p.product_id,

    SUM(oi.line_revenue) AS revenue

  FROM order_items oi

  JOIN products p

    ON p.product_id = oi.product_id

  GROUP BY p.category, p.product_id

),

ranked AS (
  
  SELECT

    category,

    product_id,

    ROUND(revenue, 2) AS revenue,
    
    RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rk
  
  FROM product_rollup

)

SELECT

  category,

  product_id,

  revenue,

  rk AS revenue_rank_in_category

FROM ranked

WHERE rk <= 5

ORDER BY category, rk;