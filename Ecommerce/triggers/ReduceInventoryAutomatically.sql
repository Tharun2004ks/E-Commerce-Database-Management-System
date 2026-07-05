USE ecommerce_db;

DELIMITER $$

CREATE TRIGGER trg_reduce_inventory

AFTER INSERT

ON order_items

FOR EACH ROW

BEGIN

UPDATE inventory

SET stock_quantity = stock_quantity - NEW.quantity

WHERE product_id = NEW.product_id;

END $$

DELIMITER ;
INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES(1,1,2,79999);