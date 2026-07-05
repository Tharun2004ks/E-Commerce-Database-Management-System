USE ecommerce_db;
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method ENUM('UPI', 'Credit Card', 'Debit Card', 'Net Banking', 'Cash On Delivery'),
    payment_status ENUM('Pending', 'Success', 'Failed'),
    payment_date DATE,
    amount DECIMAL(10 , 2 ),
    CONSTRAINT PK_PAYMENTS PRIMARY KEY (payment_id)
);
ALTER TABLE payments
ADD CONSTRAINT FK_PAYMENT_ORDER
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

INSERT INTO payments(order_id,payment_method,payment_status,payment_date,amount)
VALUES
(1,'UPI','Success','2026-07-01',81498),
(2,'Credit Card','Success','2026-07-02',8997),
(3,'Debit Card','Success','2026-07-02',128998),
(4,'UPI','Pending','2026-07-03',11998),
(5,'Net Banking','Success','2026-07-03',123998),
(6,'Credit Card','Failed','2026-07-04',113998),
(7,'Cash On Delivery','Pending','2026-07-04',56498),
(8,'UPI','Success','2026-07-05',53998),
(9,'Debit Card','Success','2026-07-05',52998),
(10,'UPI','Pending','2026-07-06',46998),
(11,'Credit Card','Success','2026-07-06',60998),
(12,'Net Banking','Success','2026-07-07',136998),
(13,'UPI','Success','2026-07-07',60998),
(14,'Debit Card','Pending','2026-07-08',82998),
(15,'Credit Card','Success','2026-07-08',86998),
(16,'UPI','Success','2026-07-09',57998),
(17,'Cash On Delivery','Success','2026-07-09',6998),
(18,'UPI','Success','2026-07-10',9498),
(19,'Debit Card','Pending','2026-07-10',13998),
(20,'Credit Card','Success','2026-07-11',49998),
(21,'UPI','Success','2026-07-11',2499),
(22,'Cash On Delivery','Pending','2026-07-12',1499),
(23,'Net Banking','Success','2026-07-12',54999),
(24,'UPI','Pending','2026-07-13',31999),
(25,'Debit Card','Success','2026-07-13',42999);

select * from payments;