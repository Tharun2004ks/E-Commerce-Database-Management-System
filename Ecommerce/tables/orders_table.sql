USE ecommerce_db;
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    coupon_id INT,
    order_date DATE NOT NULL,
    order_status ENUM('Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10 , 2 ) NOT NULL,
    CONSTRAINT PK_ORDERS PRIMARY KEY (order_id)
);
desc customers;
desc coupons;
ALTER TABLE orders
ADD CONSTRAINT FK_ORDERS_CUSTOMERS
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);
ALTER TABLE orders
ADD CONSTRAINT FK_ORDERS_COUPONS
FOREIGN KEY (coupon_id)
REFERENCES coupons(coupon_id);
INSERT INTO orders(customer_id,coupon_id,order_date,order_status,total_amount)
VALUES
(1,1,'2026-07-01','Delivered',81498.00),
(2,2,'2026-07-02','Delivered',8997.00),
(3,3,'2026-07-02','Shipped',128998.00),
(4,4,'2026-07-03','Pending',11998.00),
(5,5,'2026-07-03','Delivered',123998.00),
(6,6,'2026-07-04','Cancelled',113998.00),
(7,7,'2026-07-04','Confirmed',56498.00),
(8,8,'2026-07-05','Delivered',53998.00),
(9,9,'2026-07-05','Shipped',52998.00),
(10,10,'2026-07-06','Pending',46998.00),
(11,11,'2026-07-06','Delivered',60998.00),
(12,12,'2026-07-07','Confirmed',136998.00),
(13,13,'2026-07-07','Delivered',60998.00),
(14,14,'2026-07-08','Pending',82998.00),
(15,15,'2026-07-08','Delivered',86998.00),
(16,16,'2026-07-09','Shipped',57998.00),
(17,17,'2026-07-09','Delivered',6998.00),
(18,18,'2026-07-10','Confirmed',9498.00),
(19,19,'2026-07-10','Pending',13998.00),
(20,20,'2026-07-11','Delivered',49998.00),
(1,NULL,'2026-07-11','Delivered',2499.00),
(2,NULL,'2026-07-12','Confirmed',1499.00),
(3,NULL,'2026-07-12','Shipped',54999.00),
(4,NULL,'2026-07-13','Pending',31999.00),
(5,NULL,'2026-07-13','Delivered',42999.00);
select * from orders;
