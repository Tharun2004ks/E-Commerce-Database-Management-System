USE ecommerce_db;
CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT PK_WISHLIST PRIMARY KEY (wishlist_id),
    CONSTRAINT FK_WISHLIST_CUSTOMER FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT FK_WISHLIST_PRODUCT FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
INSERT INTO wishlist(customer_id,product_id)
VALUES
(1,5),
(2,8),
(3,2),
(4,15),
(5,6),
(6,20),
(7,18),
(8,10),
(9,23),
(10,1),
(11,9),
(12,14),
(13,17),
(14,22),
(15,3),
(16,12),
(17,24),
(18,11),
(19,19),
(20,7);
select * from wishlist;