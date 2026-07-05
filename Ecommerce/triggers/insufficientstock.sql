USE ecommerce_db;
DELIMITER $$

CREATE TRIGGER trg_check_stock

BEFORE INSERT

ON order_items

FOR EACH ROW

BEGIN

DECLARE available_stock INT;

SELECT stock_quantity

INTO available_stock

FROM inventory

WHERE product_id=NEW.product_id;

IF NEW.quantity > available_stock THEN

SIGNAL SQLSTATE '45000'

SET MESSAGE_TEXT='Insufficient Stock';

END IF;

END $$

DELIMITER ;
INSERT INTO order_items(order_id,product_id,quantity,price)
VALUES(1,1,500,79999);