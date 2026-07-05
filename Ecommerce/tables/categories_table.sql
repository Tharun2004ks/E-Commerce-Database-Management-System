USE ecommerce_db;
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    category_description VARCHAR(255),
    CONSTRAINT PK_CATEGORIES PRIMARY KEY (category_id),
    CONSTRAINT UQ_CATEGORY_NAME UNIQUE (category_name)
);
INSERT INTO categories(category_name,category_description)
VALUES
('Electronics','Electronic gadgets and accessories'),
('Fashion','Clothing and apparel'),
('Footwear','Shoes and sandals'),
('Home Appliances','Kitchen and home appliances'),
('Furniture','Home and office furniture'),
('Books','Educational and story books'),
('Sports','Sports equipment'),
('Beauty','Beauty and skincare products'),
('Groceries','Daily grocery items'),
('Toys','Kids toys'),
('Watches','Smart and analog watches'),
('Jewellery','Gold and silver jewellery'),
('Mobile Accessories','Chargers, Cases and Cables'),
('Computers','Laptops and desktops'),
('Gaming','Gaming consoles and accessories'),
('Health','Healthcare products'),
('Automotive','Vehicle accessories'),
('Stationery','Office and school supplies'),
('Pet Supplies','Products for pets'),
('Musical Instruments','Music instruments and accessories');

select * from categories;