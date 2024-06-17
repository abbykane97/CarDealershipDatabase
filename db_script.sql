CREATE DATABASE car_dealership;

USE car_dealership;

CREATE TABLE Dealerships(

DealershipID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,

CompanyName VARCHAR(50) NOT NULL,

Address VARCHAR(50),

Phone VARCHAR(12)
 
);

CREATE TABLE Vehicles(

Vin INT NOT NULL PRIMARY KEY, 

Year INT,

Make Varchar(50),

Model varchar(50),

vehicleType varchar(50),

Color varchar(50),

Odometer INT,

Price decimal(10,2), 

Sold boolean

);

CREATE TABLE inventory (

dealership_id INT, 

VIN INT,

Foreign KEY (dealership_id) references dealerships(dealership_id),

Foreign KEY (VIN) REFERENCES vehichle(VIN)
);

CREATE TABLE sales_contract (

contract_id INT AUTO_INCREMENT PRIMARY KEY,

VIN int,

foreign key (vin) references vehicles(VIN),

salesTaxAmount decimal (10,2),

recordingFee decimal (10,2),

processingFee decimal (10.2),

financeOption boolean

);

-- Populate Dealerships
INSERT INTO Dealerships (CompanyName, Address, Phone)
VALUES ('ABC Motors', '123 Main St', '555-1234'),
       ('XYZ Auto', '456 Oak St', '555-5678');
-- Populate Vehicles
INSERT INTO Vehicles (Vin, Year, Make, Model, vehicleType, Color, Odometer, Price, Sold)
VALUES (123456789, 2022, 'Toyota', 'Camry', 'Sedan', 'Red', 20000, 25000, 0),
       (987654321, 2021, 'Ford', 'F-150', 'Truck', 'Blue', 15000, 35000, 1);

-- Populate inventory
INSERT INTO inventory (dealership_id, VIN)
VALUES (1, 123456789),
       (2, 987654321);

-- Populate sales_contract
INSERT INTO sales_contract (VIN, salesTaxAmount, recordingFee, processingFee, financeOption)
VALUES (123456789, 1500.00, 100.00, 50.00, 1),
       (987654321, 2000.00, 150.00, 75.00, 0);
       
-- 1
SELECT * FROM Dealerships;

-- 2
SELECT v.*
FROM Vehicles v
INNER JOIN inventory i ON v.Vin = i.VIN
WHERE i.dealership_id = @dealership_id;


-- 3
SELECT * FROM Dealerships WHERE CompanyName = @company_name;

-- 4
SELECT d.*
FROM Dealerships dDealershipsVehicles
INNER JOIN inventory i ON d.DealershipID = i.dealership_id
WHERE i.VIN = @VIN;

-- 5
SELECT d.*
FROM Dealerships d
INNER JOIN inventory i ON d.DealershipID = i.dealership_id
INNER JOIN Vehicles v ON i.VIN = v.Vin
WHERE v.Color = 'Red' AND v.Make = 'Ford' AND v.Model = 'Mustang';

-- 6
 SELECT s.*, v.*
FROM sales_contract s
INNER JOIN Vehicles v ON s.VIN = v.Vin
WHERE v.dealership_id = @dealership_id 
AND s.contract_date BETWEEN @start_date AND @end_date;
       
       






