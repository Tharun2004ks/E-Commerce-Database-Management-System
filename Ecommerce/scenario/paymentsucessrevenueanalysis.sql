USE ecommerce_db;
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    a.city,
    o.order_id,
    o.order_date,
    pay.payment_method,
    pay.payment_status,
    s.shipment_status,
    SUM(o.total_amount) AS total_amount,
    CASE
        WHEN pay.payment_status = 'Success' THEN 'Payment Completed'
        WHEN pay.payment_status = 'Pending' THEN 'Awaiting Payment'
        ELSE 'Payment Failed'
    END AS payment_remark
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
    shipments s ON o.order_id = s.order_id
GROUP BY u.user_id , customer_name , a.city , o.order_id , o.order_date , pay.payment_method , pay.payment_status , s.shipment_status
ORDER BY total_amount DESC;