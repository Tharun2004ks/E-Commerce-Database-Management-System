USE ecommerce_db;
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    u.email,
    a.city,
    a.state,
    o.order_id,
    o.order_date,
    o.order_status,
    p.product_name,
    oi.quantity,
    oi.price,
    pay.payment_method,
    pay.payment_status,
    s.shipment_status,
    s.tracking_number,
    o.total_amount
FROM
    users u
        INNER JOIN
    customers c ON u.user_id = c.user_id
        INNER JOIN
    addresses a ON c.customer_id = a.customer_id
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    products p ON oi.product_id = p.product_id
        INNER JOIN
    payments pay ON o.order_id = pay.order_id
        INNER JOIN
    shipments s ON o.order_id = s.order_id
ORDER BY o.order_date DESC;