use FinalProject
go

--Create Table Dealer
CREATE TABLE Dealer (
    DealerID INT PRIMARY KEY IDENTITY(1,1),
    DealerName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

--Create Table Car
CREATE TABLE Car (
    CarModelID INT PRIMARY KEY IDENTITY(1,1),
    ModelName VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    BasePrice INT NOT NULL
);

--Create Junction Table Dealer Car
CREATE TABLE DealerCar (
    DealerCarID INT PRIMARY KEY IDENTITY(1,1),
    DealerID INT NOT NULL,
    CarModelID INT NOT NULL,
    Stock INT,
    DisplayPrice INT,
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID),
    FOREIGN KEY (CarModelID) REFERENCES Car(CarModelID)
);

--Create Table Sales Person
CREATE TABLE SalesPerson (
    SalesPersonID INT PRIMARY KEY IDENTITY(1,1),
    SalesName VARCHAR(30),
    DealerID INT,
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID)
);

--Create Table Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50)
);

--Create Table Consult History
CREATE TABLE ConsultHistory (
    ConsultID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    DealerCarID INT,
    SalesPersonID INT NOT NULL,
    Budget INT NOT NULL,
    DateConsult DATE,
    Note TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);

--Create Table Test Drive
CREATE TABLE TestDrive (
    TestDriveID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    DealerCarID INT NOT NULL,
    SalesPersonID INT NOT NULL,
    DateTestDrive DATE,
    Note TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);

--Create Table LOI
CREATE TABLE LOI (
    LOIID INT PRIMARY KEY IDENTITY(1,1),
    FixPrice INT NOT NULL,
    Discount FLOAT,
    Deposit INT
);

--Create Table Agreement
CREATE TABLE Agreement (
    AgreementID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    DealerCarID INT NOT NULL,
    SalesPersonID INT NOT NULL,
    LOIID INT UNIQUE,
    VIN VARCHAR(30) NOT NULL UNIQUE,
    AgreementDate DATE,
    IsCredit BIT, --kalo 0 cash klo 1 credit
    CreditNominal INT,
    CreditPeriod INT,
    InterestRate FLOAT,
    Instalment INT,
    CreditStatus BIT,--kalo 0 lancar, kalo 1 tidak lancar
    PaymentStatus BIT, --kalo 0 lunas klo 1 belum lunas
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID),
    FOREIGN KEY (LOIID) REFERENCES LOI(LOIID)
);

--Create Table Warranty Registration
CREATE TABLE WarrantyRegistration (
    WarrantyID INT PRIMARY KEY IDENTITY(1,1),
    AgreementID INT NOT NULL,
    PurchaseDate DATE,
    WarrantyPeriodMonths INT,
    FOREIGN KEY (AgreementID) REFERENCES Agreement(AgreementID)
);

--Create Table Warranty Claim
CREATE TABLE WarrantyClaim (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    WarrantyID INT NOT NULL,
    IssueReported TEXT,
    ServiceCenter VARCHAR(100),
    RepairDate DATE,
    RepairCost INT,
    ClaimStatus VARCHAR(20),
    FOREIGN KEY (WarrantyID) REFERENCES WarrantyRegistration(WarrantyID)
);


