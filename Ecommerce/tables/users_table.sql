USE ecommerce_db;

CREATE TABLE users(

    user_id INT AUTO_INCREMENT,

    role_id INT NOT NULL,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL,

    phone VARCHAR(15) NOT NULL,

    password VARCHAR(255) NOT NULL,

    status ENUM('Active','Inactive','Blocked')
    DEFAULT 'Active',

    CONSTRAINT PK_USERS PRIMARY KEY(user_id),

    CONSTRAINT FK_USERS_ROLE
        FOREIGN KEY(role_id)
        REFERENCES roles(role_id),

    CONSTRAINT UQ_USERS_EMAIL UNIQUE(email),

    CONSTRAINT UQ_USERS_PHONE UNIQUE(phone)

);

INSERT INTO users
(role_id,first_name,last_name,email,phone,password,status)
VALUES
(1,'Arun','Kumar','arun@gmail.com','9876500001','Admin@123','Active'),
(2,'Rahul','Sharma','rahul@gmail.com','9876500002','Rahul@123','Active'),
(2,'Priya','Menon','priya@gmail.com','9876500003','Priya@123','Active'),
(2,'Vijay','Raj','vijay@gmail.com','9876500004','Vijay@123','Active'),
(2,'Sneha','R','sneha@gmail.com','9876500005','Sneha@123','Active'),
(2,'Karthik','M','karthik@gmail.com','9876500006','Karthik@123','Active'),
(2,'Divya','S','divya@gmail.com','9876500007','Divya@123','Active'),
(2,'Ajith','P','ajith@gmail.com','9876500008','Ajith@123','Active'),
(2,'Keerthi','N','keerthi@gmail.com','9876500009','Keerthi@123','Active'),
(2,'Hari','V','hari@gmail.com','9876500010','Hari@123','Active'),
(3,'Sony','Electronics','sony@gmail.com','9876500011','Sony@123','Active'),
(3,'Samsung','Store','samsung@gmail.com','9876500012','Samsung@123','Active'),
(3,'Apple','India','apple@gmail.com','9876500013','Apple@123','Active'),
(3,'Boat','Official','boat@gmail.com','9876500014','Boat@123','Active'),
(3,'Nike','Sports','nike@gmail.com','9876500015','Nike@123','Active'),
(4,'Ravi','Delivery','ravi@gmail.com','9876500016','Ravi@123','Active'),
(4,'Suresh','Express','suresh@gmail.com','9876500017','Suresh@123','Active'),
(4,'Ganesh','Logistics','ganesh@gmail.com','9876500018','Ganesh@123','Active'),
(4,'Manoj','Courier','manoj@gmail.com','9876500019','Manoj@123','Active'),
(4,'Akash','Speed','akash@gmail.com','9876500020','Akash@123','Active');

select * from users;