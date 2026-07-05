USE ecommerce_db;
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT,
    product_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    warehouse_location VARCHAR(100),
    last_updated DATE,
    CONSTRAINT PK_INVENTORY PRIMARY KEY (inventory_id),
    CONSTRAINT FK_INVENTORY_PRODUCT FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
INSERT INTO inventory(product_id,stock_quantity,warehouse_location,last_updated)
VALUES
(1,50,'Chennai Warehouse','2026-07-01'),
(2,40,'Bangalore Warehouse','2026-07-01'),
(3,30,'Hyderabad Warehouse','2026-07-01'),
(4,100,'Chennai Warehouse','2026-07-01'),
(5,60,'Mumbai Warehouse','2026-07-01'),
(6,45,'Delhi Warehouse','2026-07-01'),
(7,55,'Pune Warehouse','2026-07-01'),
(8,25,'Bangalore Warehouse','2026-07-01'),
(9,35,'Hyderabad Warehouse','2026-07-01'),
(10,28,'Delhi Warehouse','2026-07-01'),
(11,22,'Mumbai Warehouse','2026-07-01'),
(12,18,'Chennai Warehouse','2026-07-01'),
(13,33,'Pune Warehouse','2026-07-01'),
(14,42,'Hyderabad Warehouse','2026-07-01'),
(15,39,'Bangalore Warehouse','2026-07-01'),
(16,48,'Delhi Warehouse','2026-07-01'),
(17,27,'Mumbai Warehouse','2026-07-01'),
(18,70,'Chennai Warehouse','2026-07-01'),
(19,52,'Pune Warehouse','2026-07-01'),
(20,16,'Hyderabad Warehouse','2026-07-01'),
(21,24,'Delhi Warehouse','2026-07-01'),
(22,19,'Mumbai Warehouse','2026-07-01'),
(23,31,'Chennai Warehouse','2026-07-01'),
(24,85,'Bangalore Warehouse','2026-07-01'),
(25,95,'Pune Warehouse','2026-07-01');

select * from inventory;