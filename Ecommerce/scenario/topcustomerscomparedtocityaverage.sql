USE ecommerce_db;
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    a.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM
    users u
        INNER JOIN
    customers c ON u.user_id = c.user_id
        INNER JOIN
    addresses a ON c.customer_id = a.customer_id
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY u.user_id , customer_name , a.city
HAVING SUM(o.total_amount) > (SELECT 
        AVG(o2.total_amount)
    FROM
        orders o2
            INNER JOIN
        customers c2 ON o2.customer_id = c2.customer_id
            INNER JOIN
        addresses a2 ON c2.customer_id = a2.customer_id
    WHERE
        a2.city = a.city)
ORDER BY total_spent DESC;