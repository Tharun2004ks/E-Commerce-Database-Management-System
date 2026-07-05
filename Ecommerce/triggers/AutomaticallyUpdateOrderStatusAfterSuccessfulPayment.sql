USE ecommerce_db;
DELIMITER $$

CREATE TRIGGER trg_update_order_status

AFTER UPDATE
ON payments

FOR EACH ROW

BEGIN

    IF NEW.payment_status = 'Success' THEN

        UPDATE orders
        SET order_status = 'Confirmed'
        WHERE order_id = NEW.order_id;

    END IF;

END $$

DELIMITER ;

SELECT order_id, order_status
FROM orders
WHERE order_id = 10;

UPDATE payments
SET payment_status = 'Success'
WHERE order_id = 10;

SELECT order_id, order_status
FROM orders
WHERE order_id = 10;