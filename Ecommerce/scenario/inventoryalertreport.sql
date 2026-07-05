USE ecommerce_db;
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    s.company_name,
    i.stock_quantity,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price) AS total_revenue,
    CASE
        WHEN i.stock_quantity < 20 THEN 'Restock Immediately'
        WHEN i.stock_quantity BETWEEN 20 AND 50 THEN 'Low Stock'
        ELSE 'Stock Available'
    END AS stock_status
FROM
    products p
        INNER JOIN
    categories c ON p.category_id = c.category_id
        INNER JOIN
    sellers s ON p.seller_id = s.seller_id
        INNER JOIN
    inventory i ON p.product_id = i.product_id
        INNER JOIN
    order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id , p.product_name , c.category_name , s.company_name , i.stock_quantity
HAVING SUM(oi.quantity) >= 2
ORDER BY i.stock_quantity ASC , total_quantity_sold DESC;