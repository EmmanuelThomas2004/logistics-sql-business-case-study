Q1. Find the total number of shipments.
SELECT COUNT(*) AS total_shipments
FROM shipments;
Q2. Find the number of shipments by shipping mode.
SELECT
    shipping_mode,
    COUNT(*) AS shipment_count
FROM shipments
GROUP BY shipping_mode
ORDER BY shipment_count DESC;
Q3. Find the average shipping cost for each shipping mode.
SELECT
    shipping_mode,
    ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost
FROM shipments
GROUP BY shipping_mode
ORDER BY avg_shipping_cost DESC;
Q4. Find shipments that were delivered late.
SELECT
    shipment_id,
    order_id,
    delivery_date,
    scheduled_delivery_date
FROM shipments
WHERE delivery_date > scheduled_delivery_date;
Q5. Calculate the average delivery delay by shipping mode.
SELECT
    shipping_mode,
    ROUND(
        AVG(DATEDIFF(delivery_date, scheduled_delivery_date)), 2
    ) AS avg_delay_days
FROM shipments
WHERE delivery_date > scheduled_delivery_date
GROUP BY shipping_mode
ORDER BY avg_delay_days DESC;
Q6. Find the top 5 destinations with the highest number of shipments.
SELECT
    destination,
    COUNT(*) AS shipment_count
FROM shipments
GROUP BY destination
ORDER BY shipment_count DESC
LIMIT 5;
Q7. Find customers who have made more than 3 shipments.
SELECT
    customer_id,
    COUNT(*) AS shipment_count
FROM shipments
GROUP BY customer_id
HAVING COUNT(*) > 3
ORDER BY shipment_count DESC;
Q8. Find the most expensive shipment for each shipping mode.
SELECT
    shipment_id,
    shipping_mode,
    shipping_cost
FROM (
    SELECT
        shipment_id,
        shipping_mode,
        shipping_cost,
        RANK() OVER (
            PARTITION BY shipping_mode
            ORDER BY shipping_cost DESC
        ) AS rnk
    FROM shipments
) t
WHERE rnk = 1;
Q9. Calculate the percentage of shipments delivered late.
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN delivery_date > scheduled_delivery_date THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS late_delivery_percentage
FROM shipments;
Q10. Find the month with the highest number of shipments.
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS shipment_count
FROM shipments
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY shipment_count DESC
LIMIT 1;
