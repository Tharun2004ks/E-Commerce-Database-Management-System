USE ecommerce_db;
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    door_no VARCHAR(20),
    street VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    CONSTRAINT PK_ADDRESSES PRIMARY KEY (address_id),
    CONSTRAINT FK_ADDRESS_CUSTOMER FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);
INSERT INTO addresses(customer_id,door_no,street,city,state,pincode)
VALUES
(1,'12A','Anna Nagar','Chennai','Tamil Nadu','600040'),
(2,'45B','MG Road','Bangalore','Karnataka','560001'),
(3,'89C','Banjara Hills','Hyderabad','Telangana','500034'),
(4,'22D','T Nagar','Chennai','Tamil Nadu','600017'),
(5,'56E','Jayanagar','Bangalore','Karnataka','560041'),
(6,'78F','Adyar','Chennai','Tamil Nadu','600020'),
(7,'91G','Kukatpally','Hyderabad','Telangana','500072'),
(8,'33H','Velachery','Chennai','Tamil Nadu','600042'),
(9,'17J','Whitefield','Bangalore','Karnataka','560066'),
(10,'88K','Gachibowli','Hyderabad','Telangana','500032'),
(11,'10L','Tambaram','Chennai','Tamil Nadu','600045'),
(12,'29M','HSR Layout','Bangalore','Karnataka','560102'),
(13,'65N','Madhapur','Hyderabad','Telangana','500081'),
(14,'40P','Porur','Chennai','Tamil Nadu','600116'),
(15,'51Q','Indiranagar','Bangalore','Karnataka','560038'),
(16,'72R','Secunderabad','Hyderabad','Telangana','500003'),
(17,'18S','Ambattur','Chennai','Tamil Nadu','600053'),
(18,'84T','Electronic City','Bangalore','Karnataka','560100'),
(19,'39U','Begumpet','Hyderabad','Telangana','500016'),
(20,'95V','Perungudi','Chennai','Tamil Nadu','600096');

select * from addresses;