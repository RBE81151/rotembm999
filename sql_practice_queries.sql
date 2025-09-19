-- SQL Practice Queries
-- Filtering, grouping, and aggregations

-- 1. Find all customers from New York
SELECT *
FROM customers
WHERE city = 'New York';

-- 2. Count total orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 3. Average order value per customer
SELECT customer_id, AVG(order_amount) AS avg_order
FROM orders
GROUP BY customer_id
HAVING AVG(order_amount) > 100;

-- 4. Join customers with their orders
SELECT c.customer_name, o.order_id, o.order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 5. Window function: rank customers by total spend
SELECT customer_id,
       SUM(order_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(order_amount) DESC) AS rank_spend
FROM orders
GROUP BY customer_id;
