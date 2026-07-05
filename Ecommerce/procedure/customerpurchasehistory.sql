USE ecommerce_db;
DELIMITER $$

CREATE PROCEDURE GetCustomerPurchaseHistory(IN p_customer_id INT)

BEGIN

SELECT

    CONCAT(u.first_name,' ',u.last_name) AS customer_name,

    o.order_id,

    o.order_date,

    p.product_name,

    oi.quantity,

    oi.price,

    pay.payment_status,

    ship.shipment_status

FROM customers c

INNER JOIN users u
ON c.user_id=u.user_id

INNER JOIN orders o
ON c.customer_id=o.customer_id

INNER JOIN order_items oi
ON o.order_id=oi.order_id

INNER JOIN products p
ON oi.product_id=p.product_id

INNER JOIN payments pay
ON o.order_id=pay.order_id

INNER JOIN shipments ship
ON o.order_id=ship.order_id

WHERE c.customer_id=p_customer_id

ORDER BY o.order_date DESC;

END $$

DELIMITER ;
CALL GetCustomerPurchaseHistory(1);