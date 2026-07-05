USE ecommerce_db;
SELECT 
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    a.city,
    p.product_name,
    c.category_name,
    s.company_name,
    oi.quantity,
    oi.price,
    o.total_amount,
    pay.payment_method,
    pay.payment_status,
    ship.shipment_status,
    IFNULL(cp.coupon_code, 'No Coupon') AS coupon_used,
    CASE
        WHEN
            pay.payment_status = 'Success'
                AND ship.shipment_status = 'Delivered'
        THEN
            'Order Completed'
        WHEN pay.payment_status = 'Pending' THEN 'Payment Pending'
        WHEN ship.shipment_status = 'Packed' THEN 'Ready For Dispatch'
        ELSE 'Processing'
    END AS order_remark
FROM
    users u
        INNER JOIN
    customers cu ON u.user_id = cu.user_id
        INNER JOIN
    addresses a ON cu.customer_id = a.customer_id
        INNER JOIN
    orders o ON cu.customer_id = o.customer_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    products p ON oi.product_id = p.product_id
        INNER JOIN
    sellers s ON p.seller_id = s.seller_id
        INNER JOIN
    categories c ON p.category_id = c.category_id
        INNER JOIN
    payments pay ON o.order_id = pay.order_id
        INNER JOIN
    shipments ship ON o.order_id = ship.order_id
        LEFT JOIN
    coupons cp ON o.coupon_id = cp.coupon_id
ORDER BY o.order_date DESC , o.total_amount DESC;