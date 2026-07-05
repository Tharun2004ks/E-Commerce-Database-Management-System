USE ecommerce_db;
SELECT 
    cp.coupon_code,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    c.customer_id
FROM
    coupons cp
        INNER JOIN
    orders o ON cp.coupon_id = o.coupon_id
        INNER JOIN
    customers c ON o.customer_id = c.customer_id
        INNER JOIN
    users u ON c.user_id = u.user_id
GROUP BY cp.coupon_id , cp.coupon_code , customer_name , c.customer_id
HAVING SUM(o.total_amount) > (SELECT 
        AVG(total_amount)
    FROM
        orders)
ORDER BY total_revenue DESC;