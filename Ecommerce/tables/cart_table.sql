USE ecommerce_db;
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT PK_CART PRIMARY KEY (cart_id),
    CONSTRAINT FK_CART_CUSTOMER FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
INSERT INTO cart(customer_id,product_id,quantity)
VALUES
(1,3,1),
(2,5,2),
(3,7,1),
(4,10,1),
(5,12,2),
(6,15,1),
(7,18,3),
(8,20,1),
(9,22,2),
(10,25,1),
(11,1,1),
(12,4,2),
(13,6,1),
(14,8,1),
(15,11,2),
(16,14,1),
(17,17,1),
(18,19,2),
(19,21,1),
(20,24,1);

select * from cart;