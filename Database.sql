CREATE DATABASE CarShow;
USE CarShow;

CREATE TABLE Cars(
	Car_ID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(20) NOT NULL,
    Model VARCHAR(20) NOT NULL,
	Years VARCHAR(4) NOT NULL,
    Horsepower SMALLINT NOT NULL,
    Mileage INT NOT NULL,
    Used VARCHAR(3) NOT NULL,
    DateOfCSale DATE,
    VIN VARCHAR(17) NOT NULL,
    Transmission VARCHAR(20) NOT NULL,
    Price DECIMAL(19,3) NOT NULL,
    Car_status VARCHAR(10) NOT NULL,
    Description TEXT
);

CREATE TABLE Clients(
	Client_ID INT PRIMARY KEY AUTO_INCREMENT,
    Client_Name VARCHAR(20) NOT NULL,
    CLient_LName VARCHAR(20) NOT NULL,
    Contact_Data VARCHAR(35) NOT NULL
);

CREATE TABLE Employees(
	Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Employee_Name VARCHAR(20) NOT NULL,
    Employee_LName VARCHAR(20) NOT NULL,
    Contact_data VARCHAR(20) NOT NULL,
    Post VARCHAR(25) NOT NULL
);

CREATE TABLE Orders(
	Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Amount SMALLINT NOT NULL,
    DateOfOrders DATE NOT NULL,
    Order_status VARCHAR(20) NOT NULL,
    Car_ID INT NOT NULL,
    FOREIGN KEY (Car_ID) REFERENCES Cars (Car_ID)
);

CREATE TABLE Sales(
	Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    DateOfSales DATE NOT NULL,
    Price DECIMAL(19,3) NOT NULL,
	Car_ID INT NOT NULL,
    Client_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (Car_ID) REFERENCES Cars (Car_ID),
    FOREIGN KEY (Client_ID) REFERENCES Clients (Client_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees (Employee_ID)
);

INSERT INTO Cars (Brand, Model, Years, Horsepower, Mileage, Used, DateOfCSale, VIN, Transmission, Price, Car_status, Description) VALUES
('Tesla', 'Model S', '2020', 670, 15000, 'Да', '2022-10-12', '5YJSA1E26LF123456', 'Автоматическая', 79999.999, 'Доступна', 'Электрический седан с большой мощностью.'),
('Honda', 'Civic', '2019', 158, 25000, 'Нет','2023-01-22' , '19XFC2F59KE123456', 'Автоматическая', 21999.500, 'Продана', 'Компактная машинна с маленьким расходом бензина.'),
('Ford', 'Mustang', '2021', 450, 5000, 'Нет','2024-12-01' , '1FA6P8CF5M5101234', 'Механическая', 55999.000, 'Доступна', 'Спортивное купе с мощным двигателем.'),
('Toyota', 'Camry', '2018', 203, 30000, 'Да','2021-06-09' , '4T1B11HK8JU123456', 'Автоматическая', 23999.750, 'Доступна', 'Надежный седан с просторным салоном.');

INSERT INTO Clients (Client_Name, CLient_LName, Contact_data) VALUES
('Джон', 'Дое', 'john.doe@example.com'),
('Джейн', 'Смит', 'jane.smith@example.com'),
('Майкл', 'Джордан', 'michael.jordan@example.com');

INSERT INTO Employees (Employee_Name, Employee_LName, Contact_data, Post) VALUES
('Иван', 'Иванов', '1234567890', 'Менеджер'),
('Петр', 'Петров', '0987654321', 'Разработчик'),
('Светлана', 'Сидорова', '1122334455', 'Дизайнер');

INSERT INTO Orders (Amount, DateOfOrders, Order_status, Car_ID) VALUES
(150, '2024-10-28', 'В обработке', 1),
(200, '2024-11-02', 'Доставленно', 2),
(300, '2024-11-07', 'Доставленно', 3);

INSERT INTO Sales (DateOfSales, Price, Car_ID, Client_ID, Employee_ID) VALUES
('2024-10-15', 25000.000, 1, 1, 1),
('2024-02-16', 30000.500, 2, 2, 1),
('2024-05-17', 15000.750, 3, 3, 2),
('2024-09-18', 22000.000, 4, 1, 2);