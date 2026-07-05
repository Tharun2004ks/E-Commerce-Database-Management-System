CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE roles (
    role_id INT AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL,

    CONSTRAINT PK_ROLES PRIMARY KEY (role_id),
    CONSTRAINT UQ_ROLE_NAME UNIQUE (role_name)
);
INSERT INTO roles(role_name)
VALUES
('Admin'),
('Customer'),
('Seller'),
('Delivery Agent');
SELECT * FROM roles;