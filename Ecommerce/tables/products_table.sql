USE ecommerce_db;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    seller_id INT NOT NULL,
    category_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    brand VARCHAR(100),
    price DECIMAL(10 , 2 ) NOT NULL,
    status ENUM('Available', 'Out of Stock', 'Discontinued') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_PRODUCTS PRIMARY KEY (product_id),
    CONSTRAINT FK_PRODUCT_SELLER FOREIGN KEY (seller_id)
        REFERENCES sellers (seller_id),
    CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (category_id)
        REFERENCES categories (category_id)
);

INSERT INTO products
(seller_id,category_id,product_name,description,brand,price,status)
VALUES
(1,1,'iPhone 15','Apple Smartphone','Apple',79999,'Available'),
(2,1,'Samsung Galaxy S24','Android Smartphone','Samsung',74999,'Available'),
(3,14,'MacBook Air M3','Lightweight Laptop','Apple',124999,'Available'),
(4,13,'Boat Airdopes 141','Wireless Earbuds','Boat',1499,'Available'),
(5,3,'Nike Air Max','Running Shoes','Nike',5999,'Available'),
(6,3,'Adidas Ultraboost','Sports Shoes','Adidas',7999,'Available'),
(7,3,'Puma RS-X','Casual Shoes','Puma',5499,'Available'),
(8,4,'LG Washing Machine','Front Load Washing Machine','LG',38999,'Available'),
(9,14,'HP Pavilion Laptop','15.6 inch Laptop','HP',65999,'Available'),
(10,14,'Dell Inspiron','Business Laptop','Dell',70999,'Available'),
(11,14,'Lenovo ThinkPad','Professional Laptop','Lenovo',82999,'Available'),
(12,14,'Asus ROG Laptop','Gaming Laptop','Asus',119999,'Available'),
(13,14,'Acer Aspire 7','Performance Laptop','Acer',62999,'Available'),
(14,1,'OnePlus 13','Android Smartphone','OnePlus',54999,'Available'),
(15,1,'Realme GT','Gaming Smartphone','Realme',32999,'Available'),
(16,1,'Oppo Reno','Camera Smartphone','Oppo',28999,'Available'),
(17,1,'Vivo V40','5G Smartphone','Vivo',31999,'Available'),
(18,11,'Noise Smart Watch','Fitness Smartwatch','Noise',3999,'Available'),
(19,13,'JBL Flip 6','Bluetooth Speaker','JBL',9999,'Available'),
(20,1,'Canon EOS 1500D','DSLR Camera','Canon',42999,'Available'),
(1,15,'PlayStation 5','Gaming Console','Sony',54999,'Available'),
(2,1,'Samsung Smart TV','55-inch 4K TV','Samsung',68999,'Available'),
(3,11,'Apple Watch Series 10','Premium Smartwatch','Apple',49999,'Available'),
(4,13,'Boat Rockerz 550','Wireless Headphones','Boat',1999,'Available'),
(5,7,'Nike Football','Professional Football','Nike',1499,'Available');

select * from products;
