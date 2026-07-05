USE ecommerce_db;
SELECT 
    s.seller_id,
    s.company_name,
    CONCAT(u.first_name, ' ', u.last_name) AS seller_name,
    COUNT(DISTINCT p.product_id) AS total_products,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_items_sold,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM
    sellers s
        INNER JOIN
    users u ON s.user_id = u.user_id
        INNER JOIN
    products p ON s.seller_id = p.seller_id
        INNER JOIN
    order_items oi ON p.product_id = oi.product_id
        INNER JOIN
    orders o ON oi.order_id = o.order_id
GROUP BY s.seller_id , s.company_name , seller_name
ORDER BY total_revenue DESC;
