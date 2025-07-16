--Case 4--
-- 1. RentalBranch
CREATE TABLE RentalBranch (
    RentalBranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(50) NOT NULL,
    Address VARCHAR(200)
);

-- 2. Vehicle
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    RentalBranchID INT NOT NULL,
    VehicleModel VARCHAR(50) NOT NULL,
    Mileage INT NOT NULL,
    FOREIGN KEY (RentalBranchID) REFERENCES RentalBranch(RentalBranchID)
);

-- 3. Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- 4. Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(30) NOT NULL,
    Position VARCHAR(50),
    RentalBranchID INT NOT NULL,
    FOREIGN KEY (RentalBranchID) REFERENCES RentalBranch(RentalBranchID)
);

-- 5. RentalContract
CREATE TABLE RentalContract (
    ContractID INT PRIMARY KEY IDENTITY(1,1),
    VehicleID INT NOT NULL,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays INT NOT NULL,
    DailyRate DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
