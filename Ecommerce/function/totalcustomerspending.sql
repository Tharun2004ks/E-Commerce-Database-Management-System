USE ecommerce_db;
DELIMITER $$

CREATE FUNCTION GetCustomerSpending(p_customer_id INT)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

DECLARE total DECIMAL(10,2);

SELECT SUM(total_amount)

INTO total

FROM orders

WHERE customer_id=p_customer_id;

RETURN IFNULL(total,0);

END $$

DELIMITER ;
SELECT GetCustomerSpending(1);