USE ecommerce_db;
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR(255),
    review_date DATE,
    CONSTRAINT PK_REVIEWS PRIMARY KEY (review_id),
    CONSTRAINT FK_REVIEWS_CUSTOMERS FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT FK_REVIEWS_PRODUCTS FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
INSERT INTO reviews
(customer_id, product_id, rating, review_text, review_date)
VALUES
(1,1,5,'Excellent product and fast delivery.','2026-07-05'),
(2,5,4,'Very comfortable shoes.','2026-07-06'),
(3,3,5,'MacBook performance is outstanding.','2026-07-06'),
(4,24,4,'Good sound quality.','2026-07-07'),
(5,21,5,'Amazing gaming console.','2026-07-08'),
(6,2,4,'Samsung phone is very smooth.','2026-07-08'),
(7,14,5,'OnePlus camera quality is excellent.','2026-07-09'),
(8,23,5,'Apple Watch is premium.','2026-07-09'),
(9,20,4,'Camera quality is nice.','2026-07-10'),
(10,18,5,'Best smartwatch for fitness.','2026-07-10'),
(11,11,5,'ThinkPad is perfect for office work.','2026-07-11'),
(12,10,4,'Dell laptop is worth the money.','2026-07-11'),
(13,17,4,'Vivo phone has a great display.','2026-07-12'),
(14,15,5,'Realme offers good value.','2026-07-12'),
(15,12,5,'ROG laptop is excellent for gaming.','2026-07-13'),
(16,13,4,'Acer laptop performance is good.','2026-07-13'),
(17,6,5,'Ultraboost shoes are very comfortable.','2026-07-14'),
(18,7,4,'Puma shoes have good quality.','2026-07-14'),
(19,8,5,'Washing machine works perfectly.','2026-07-15'),
(20,25,4,'Football quality is excellent.','2026-07-15'),
(1,4,5,'Earbuds battery backup is awesome.','2026-07-16'),
(2,9,4,'HP laptop is reliable.','2026-07-16'),
(3,16,5,'Oppo phone has an excellent camera.','2026-07-17'),
(4,19,4,'JBL speaker has powerful bass.','2026-07-17'),
(5,22,5,'Samsung TV picture quality is amazing.','2026-07-18');

SELECT * FROM reviews;