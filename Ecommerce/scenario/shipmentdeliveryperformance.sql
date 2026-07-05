USE ecommerce_db;
SELECT 
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    s.tracking_number,
    s.shipment_status,
    s.delivery_date,
    pay.payment_status,
    CASE
        WHEN s.shipment_status = 'Delivered' THEN 'Completed'
        WHEN s.shipment_status = 'Out For Delivery' THEN 'Deliver Today'
        WHEN s.shipment_status = 'Shipped' THEN 'In Transit'
        ELSE 'Processing'
    END AS delivery_remark
FROM
    users u
        INNER JOIN
    customers c ON u.user_id = c.user_id
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    products p ON oi.product_id = p.product_id
        INNER JOIN
    shipments s ON o.order_id = s.order_id
        LEFT JOIN
    payments pay ON o.order_id = pay.order_id
GROUP BY o.order_id , customer_name , p.product_name , oi.quantity , s.tracking_number , s.shipment_status , s.delivery_date , pay.payment_status
ORDER BY s.delivery_date DESC , o.order_id;