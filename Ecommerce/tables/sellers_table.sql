USE ecommerce_db;
CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    gst_number VARCHAR(20) NOT NULL,
    rating DECIMAL(2 , 1 ) DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_SELLERS PRIMARY KEY (seller_id),
    CONSTRAINT FK_SELLERS_USERS FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    CONSTRAINT UQ_GST UNIQUE (gst_number)
);
INSERT INTO sellers(user_id, company_name, gst_number, rating)
VALUES
(22,'Sony Electronics','GST10001',4.8),
(23,'Samsung Store','GST10002',4.7),
(24,'Apple India','GST10003',4.9),
(25,'Boat Official','GST10004',4.6),
(26,'Nike Sports','GST10005',4.8),
(27,'Adidas Store','GST10006',4.7),
(28,'Puma Sports','GST10007',4.5),
(29,'LG Electronics','GST10008',4.6),
(30,'HP World','GST10009',4.4),
(31,'Dell Exclusive','GST10010',4.7),
(32,'Lenovo Hub','GST10011',4.6),
(33,'Asus Store','GST10012',4.5),
(34,'Acer Plaza','GST10013',4.4),
(35,'OnePlus Hub','GST10014',4.7),
(36,'Realme Store','GST10015',4.5),
(37,'Oppo Mobiles','GST10016',4.3),
(38,'Vivo World','GST10017',4.4),
(39,'Noise Official','GST10018',4.6),
(40,'JBL Audio','GST10019',4.8),
(41,'Canon Camera Store','GST10020',4.7);

select * from sellers;