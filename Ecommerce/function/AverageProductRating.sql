USE ecommerce_db;
DELIMITER $$

CREATE FUNCTION GetAverageRating(p_product_id INT)

RETURNS DECIMAL(3,2)

DETERMINISTIC

BEGIN

DECLARE avg_rating DECIMAL(3,2);

SELECT AVG(rating)

INTO avg_rating

FROM reviews

WHERE product_id=p_product_id;

RETURN IFNULL(avg_rating,0);

END $$

DELIMITER ;

SELECT GetAverageRating(1);
