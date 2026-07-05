USE ecommerce_db;
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    s.company_name,
    i.stock_quantity,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price) AS total_revenue,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
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
        LEFT JOIN
    reviews r ON p.product_id = r.product_id
GROUP BY p.product_id , p.product_name , c.category_name , s.company_name , i.stock_quantity
ORDER BY total_revenue DESC , total_quantity_sold DESC;