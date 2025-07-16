-- 1. Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
 
-- 2. Car
CREATE TABLE Car (
    VIN VARCHAR(20) PRIMARY KEY,
    Model VARCHAR(50),
    Year VARCHAR(4),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
 
-- 3. WarrantyRegistration
CREATE TABLE WarrantyRegistration (
    WarrantyID INT PRIMARY KEY IDENTITY(1,1),
    VIN VARCHAR(20) UNIQUE NOT NULL,
    PurchaseDate DATE NOT NULL,
    WarrantyPeriodMonths INT NOT NULL,
    FOREIGN KEY (VIN) REFERENCES Car(VIN)
);
 
-- 4. WarrantyClaim
CREATE TABLE WarrantyClaim (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    WarrantyID INT NOT NULL,
    IssueReported VARCHAR(255),
    ServiceCenter VARCHAR(100),
    RepairDate DATE,
    RepairCost VARCHAR(20),
    ClaimStatus VARCHAR(20),
    FOREIGN KEY (WarrantyID) REFERENCES WarrantyRegistration(WarrantyID)
);