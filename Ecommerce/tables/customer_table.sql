USE ecommerce_db;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    membership_type ENUM('Silver', 'Gold', 'Platinum') DEFAULT 'Silver',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_CUSTOMERS PRIMARY KEY (customer_id),
    CONSTRAINT FK_CUSTOMERS_USERS FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);
INSERT INTO customers(user_id, date_of_birth, gender, membership_type)
VALUES
(2,'1999-05-12','Male','Gold'),
(3,'2000-02-15','Female','Silver'),
(4,'1998-10-22','Male','Gold'),
(5,'2001-07-18','Female','Platinum'),
(6,'1997-12-30','Male','Silver'),
(7,'2002-03-25','Female','Gold'),
(8,'1999-08-11','Male','Silver'),
(9,'2000-06-05','Female','Gold'),
(10,'1998-11-19','Male','Platinum'),
(11,'1999-09-14','Female','Silver'),
(12,'2001-04-18','Male','Gold'),
(13,'1998-03-11','Female','Gold'),
(14,'2000-07-07','Male','Silver'),
(15,'1999-01-26','Female','Platinum'),
(16,'1997-06-16','Male','Silver'),
(17,'2002-10-30','Female','Gold'),
(18,'1998-08-21','Male','Silver'),
(19,'2001-11-09','Female','Gold'),
(20,'1999-02-13','Male','Platinum'),
(21,'2000-12-24','Female','Gold');

select * from customers;