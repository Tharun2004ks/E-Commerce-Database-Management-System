USE ecommerce_db;
CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    delivery_agent VARCHAR(100),
    tracking_number VARCHAR(50),
    shipment_status ENUM('Packed', 'Shipped', 'Out For Delivery', 'Delivered'),
    delivery_date DATE,
    CONSTRAINT PK_SHIPMENTS PRIMARY KEY (shipment_id)
);
ALTER TABLE shipments
ADD CONSTRAINT FK_SHIPMENT_ORDER
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

INSERT INTO shipments(order_id,delivery_agent,tracking_number,shipment_status,delivery_date)
VALUES
(1,'Ravi','TRK1001','Delivered','2026-07-03'),
(2,'Suresh','TRK1002','Delivered','2026-07-04'),
(3,'Ganesh','TRK1003','Shipped','2026-07-05'),
(4,'Manoj','TRK1004','Packed',NULL),
(5,'Ravi','TRK1005','Delivered','2026-07-05'),
(6,'Suresh','TRK1006','Packed',NULL),
(7,'Ganesh','TRK1007','Shipped','2026-07-06'),
(8,'Manoj','TRK1008','Delivered','2026-07-07'),
(9,'Ravi','TRK1009','Out For Delivery',NULL),
(10,'Suresh','TRK1010','Packed',NULL),
(11,'Ganesh','TRK1011','Delivered','2026-07-08'),
(12,'Manoj','TRK1012','Shipped','2026-07-09'),
(13,'Ravi','TRK1013','Delivered','2026-07-09'),
(14,'Suresh','TRK1014','Packed',NULL),
(15,'Ganesh','TRK1015','Delivered','2026-07-10'),
(16,'Manoj','TRK1016','Out For Delivery',NULL),
(17,'Ravi','TRK1017','Delivered','2026-07-10'),
(18,'Suresh','TRK1018','Delivered','2026-07-11'),
(19,'Ganesh','TRK1019','Packed',NULL),
(20,'Manoj','TRK1020','Delivered','2026-07-12'),
(21,'Ravi','TRK1021','Delivered','2026-07-12'),
(22,'Suresh','TRK1022','Packed',NULL),
(23,'Ganesh','TRK1023','Delivered','2026-07-13'),
(24,'Manoj','TRK1024','Out For Delivery',NULL),
(25,'Ravi','TRK1025','Delivered','2026-07-14');

select * from shipments ;
