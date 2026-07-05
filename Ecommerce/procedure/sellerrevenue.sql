USE ecommerce_db;
DELIMITER $$

CREATE PROCEDURE GetSellerRevenue(IN p_seller_id INT)

BEGIN

SELECT

    s.company_name,

    COUNT(DISTINCT o.order_id) AS total_orders,

    SUM(oi.quantity) AS total_items_sold,

    SUM(oi.quantity*oi.price) AS total_revenue

FROM sellers s

INNER JOIN products p
ON s.seller_id=p.seller_id

INNER JOIN order_items oi
ON p.product_id=oi.product_id

INNER JOIN orders o
ON oi.order_id=o.order_id

WHERE s.seller_id=p_seller_id

GROUP BY
s.company_name;

END $$

DELIMITER ;
CALL GetSellerRevenue(1);