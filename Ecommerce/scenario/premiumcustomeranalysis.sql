USE ecommerce_db;
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    u.email,
    a.city,
    a.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_items_purchased,
    SUM(o.total_amount) AS total_spent,
    COUNT(DISTINCT cpn.coupon_id) AS coupons_used,
    CASE
        WHEN SUM(o.total_amount) >= 100000 THEN 'Platinum Customer'
        WHEN SUM(o.total_amount) >= 50000 THEN 'Gold Customer'
        ELSE 'Regular Customer'
    END AS customer_category,
    MAX(pay.payment_method) AS payment_method,
    MAX(pay.payment_status) AS payment_status
FROM
    users u
        INNER JOIN
    customers c ON u.user_id = c.user_id
        INNER JOIN
    addresses a ON c.customer_id = a.customer_id
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    payments pay ON o.order_id = pay.order_id
        LEFT JOIN
    coupons cpn ON o.coupon_id = cpn.coupon_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY u.user_id , customer_name , u.email , a.city , a.state
HAVING SUM(o.total_amount) > 50000
    AND COUNT(DISTINCT o.order_id) >= 2
ORDER BY total_spent DESC , total_orders DESC;