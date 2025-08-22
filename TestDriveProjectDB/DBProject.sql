USE DBProject;
GO

-- 1. Dealer
CREATE TABLE Dealer (
    DealerID INT PRIMARY KEY IDENTITY(1,1),
    DealerName VARCHAR(255) NOT NULL,
    Location VARCHAR(50) NULL
);

-- 2. Car (with Color column)
CREATE TABLE Car (
    CarModelID INT PRIMARY KEY IDENTITY(1,1),
    ModelName VARCHAR(50) NOT NULL,
    Year SMALLINT NOT NULL,
    BasePrice BIGINT NOT NULL,
    Color VARCHAR(30) NULL
);

-- 3. DealerCar (Junction table)
CREATE TABLE DealerCar (
    DealerCarID INT PRIMARY KEY IDENTITY(1,1),
    DealerID INT NOT NULL,
    CarModelID INT NOT NULL,
    Stock BIGINT NOT NULL,
    DisplayPrice BIGINT NOT NULL,
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID),
    FOREIGN KEY (CarModelID) REFERENCES Car(CarModelID)
);

-- 4. SalesPerson (added Gender, CreatedDate, UpdatedDate)
CREATE TABLE SalesPerson (
    SalesPersonID INT PRIMARY KEY IDENTITY(1,1),
    SalesName VARCHAR(100) NOT NULL,
    Gender CHAR(1) NULL, -- 'M' / 'F' or as preferred
    DealerID INT NULL,
    Email VARCHAR(100) NULL,
    Phone VARCHAR(20) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID)
);

-- 5. Visitor (Potential buyer, added Gender)
CREATE TABLE Visitor (
    VisitorID INT PRIMARY KEY IDENTITY(1,1),
    VisitorName VARCHAR(100) NOT NULL,
    Gender CHAR(1) NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
);

-- 6. ConsultHistory (for Visitor)
CREATE TABLE ConsultHistory (
    ConsultID INT PRIMARY KEY IDENTITY(1,1),
    VisitorID INT NOT NULL,
    DealerCarID INT NULL,
    SalesPersonID INT NOT NULL,
    Budget BIGINT NOT NULL,
    DateConsult DATE NOT NULL,
    Note VARCHAR(MAX) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (VisitorID) REFERENCES Visitor(VisitorID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);

-- 7. TestDrive (only for Visitor, added Status, CreatedDate, UpdatedDate)
CREATE TABLE TestDrive (
    TestDriveID INT PRIMARY KEY IDENTITY(1,1),
    VisitorID INT NOT NULL,
    DealerCarID INT NOT NULL,
    SalesPersonID INT NOT NULL,
    DateTestDrive DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending', -- e.g. Pending, Approved, Completed, Cancelled
    Note VARCHAR(MAX) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (VisitorID) REFERENCES Visitor(VisitorID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);

-- 8. Customer (who already bought a car, added Gender)
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    Gender CHAR(1) NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL
);

-- 9. LOI (Letter of Intent)
CREATE TABLE LOI (
    LOIID INT PRIMARY KEY IDENTITY(1,1),
    FixPrice BIGINT NOT NULL,
    Discount DECIMAL(5,2) NULL,
    Deposit BIGINT NULL
);

-- 10. Agreement (purchase transaction by Customer)
CREATE TABLE Agreement (
    AgreementID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    DealerCarID INT NOT NULL,
    SalesPersonID INT NOT NULL,
    LOIID INT UNIQUE NULL,
    VIN VARCHAR(17) NOT NULL UNIQUE,
    AgreementDate DATE NOT NULL,
    IsCredit BIT NOT NULL,
    CreditNominal BIGINT NULL,
    CreditPeriod INT NULL,
    InterestRate DECIMAL(6,3) NULL,
    Instalment BIGINT NULL,
    CreditStatus BIT NOT NULL,
    PaymentStatus BIT NOT NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DealerCarID) REFERENCES DealerCar(DealerCarID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID),
    FOREIGN KEY (LOIID) REFERENCES LOI(LOIID)
);

-- 11. WarrantyRegistration
CREATE TABLE WarrantyRegistration (
    WarrantyID INT PRIMARY KEY IDENTITY(1,1),
    AgreementID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    WarrantyPeriodMonths INT NOT NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (AgreementID) REFERENCES Agreement(AgreementID)
);

-- 12. WarrantyClaim
CREATE TABLE WarrantyClaim (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    WarrantyID INT NOT NULL,
    IssueReported VARCHAR(MAX) NULL,
    ServiceCenter VARCHAR(100) NULL,
    RepairDate DATE NULL,
    RepairCost BIGINT NULL,
    ClaimStatus VARCHAR(20) NULL,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,
    FOREIGN KEY (WarrantyID) REFERENCES WarrantyRegistration(WarrantyID)
);

-- 13. VisitorFeedback (feedback from Visitor about consultation/test drive)
CREATE TABLE VisitorFeedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    VisitorID INT NOT NULL,
    FeedbackDate DATETIME NOT NULL DEFAULT GETDATE(),
    FeedbackText VARCHAR(MAX) NOT NULL,
    RelatedActivity VARCHAR(50) NULL, -- e.g. 'ConsultHistory' or 'TestDrive'
    RelatedActivityID INT NULL, -- id of ConsultID or TestDriveID if feedback relates to specific activity
    FOREIGN KEY (VisitorID) REFERENCES Visitor(VisitorID)
);


--INSERT DATA
USE DBProject;
GO

-- 1. Dealer 
INSERT INTO Dealer (DealerName, Location) VALUES
('Dealer Srikandi', 'Jakarta Timur'),
('Dealer Lautan Berlian', 'Jakarta Barat'),
('Dealer Sun Star Prima Motor TB', 'Jakarta Selatan'),
('Dealer Ciwangi Berlian Motor', 'Bandung'),
('Dealer Sun Star Prima Motor', 'Surabaya'),
('Dealer Sardana IndahBerlian Motor', 'Medan'),
('Dealer Suka Fajar', 'Padang'),
('Dealer Berlian Maju Motor', 'Palembang'),
('Dealer Bosowa Berlian Motor', 'Makassar');

-- 2. Car
INSERT INTO Car (ModelName, Year, BasePrice, Color) VALUES
('Destinator', 2024, 385000000, 'Silver'),
('New Pajero Sport', 2023, 577700000, 'White'),
('Xforce', 2024, 388000000, 'White'),
('Xpander Cross', 2024, 338000000, 'Grey'),
('Xpander', 2023, 270100000, 'White'),
('All New Triton', 2023, 310200000, 'Black'),
('L100 EV', 2023, 323300000, 'White');

-- 3. DealerCar
INSERT INTO DealerCar (DealerID, CarModelID, Stock, DisplayPrice) VALUES
(1, 1, 5, 395000000),
(1, 2, 3, 585000000),
(2, 3, 4, 390000000),
(3, 4, 6, 340000000),
(4, 5, 7, 275000000),
(5, 6, 3, 315000000),
(6, 7, 2, 325000000),
(7, 1, 1, 390000000),
(8, 2, 2, 580000000),
(9, 3, 3, 395000000);

-- 4. SalesPerson 
INSERT INTO SalesPerson (SalesName, Gender, DealerID, Email, Phone) VALUES
('Andi Saputra', 'M', 1, 'andi.s@dealer1.com', '081234567890'),
('Siti Nurhaliza', 'F', 2, 'siti.n@dealer2.com', '082345678901'),
('Budi Hartono', 'M', 3, 'budi.h@dealer3.com', '083456789012'),
('Rina Dewi', 'F', 4, 'rina.d@dealer4.com', '084567890123'),
('Dedi Kurnia', 'M', 5, 'dedi.k@dealer5.com', '085678901234'),
('Maya Anggraini', 'F', 6, 'maya.a@dealer6.com', '086789012345'),
('Tono Wijaya', 'M', 7, 'tono.w@dealer7.com', '087890123456');

-- 5. Visitor 
INSERT INTO Visitor (VisitorName, Gender, Phone, Email) VALUES
('Rizky Ahmad', 'M', '089912345678', 'rizky.a@gmail.com'),
('Lisa Marlina', 'F', '089923456789', 'lisa.m@gmail.com'),
('Fajar Pratama', 'M', '089934567890', 'fajar.p@gmail.com'),
('Nina Kartika', 'F', '089945678901', 'nina.k@gmail.com'),
('Agus Salim', 'M', '089956789012', 'agus.s@gmail.com'),
('Sari Dewi', 'F', '089967890123', 'sari.d@gmail.com'),
('Dedi Saputra', 'M', '089978901234', 'dedi.s@gmail.com');

-- 6. ConsultHistory 
INSERT INTO ConsultHistory (VisitorID, DealerCarID, SalesPersonID, Budget, DateConsult, Note) VALUES
(1, 1, 1, 400000000, '2025-07-10', 'Tertarik Xpander'),
(2, 3, 2, 600000000, '2025-07-12', 'Mau test drive Pajero Sport'),
(3, 4, 3, 350000000, '2025-07-15', 'Cari Xpander Cross'),
(4, 5, 4, 280000000, '2025-07-18', 'Tanya fitur Triton'),
(5, 6, 5, 320000000, '2025-07-20', 'Diskusi harga'),
(6, 7, 6, 330000000, '2025-07-22', 'Minat L100 EV'),
(7, 2, 7, 590000000, '2025-07-25', 'Minta penawaran Pajero Sport');

-- 7. TestDrive 
INSERT INTO TestDrive (VisitorID, DealerCarID, SalesPersonID, DateTestDrive, Status, Note) VALUES
(1, 1, 1, '2025-08-01 10:00:00', 'Completed', 'Pengalaman bagus'),
(2, 3, 2, '2025-08-02 14:00:00', 'Pending', 'Menunggu approval'),
(3, 4, 3, '2025-08-03 09:00:00', 'Cancelled', 'Batal karena alasan pribadi'),
(4, 5, 4, '2025-08-04 15:00:00', 'Completed', 'Nyaman dan stabil'),
(5, 6, 5, '2025-08-05 11:00:00', 'Approved', 'Disetujui untuk test drive'),
(6, 7, 6, '2025-08-06 13:00:00', 'Pending', 'Belum konfirmasi'),
(7, 2, 7, '2025-08-07 10:00:00', 'Completed', 'Test drive berjalan lancar');

-- 8. Customer
INSERT INTO Customer (CustomerName, Gender, Phone, Email) VALUES
('Hendra Wijaya', 'M', '081298765432', 'hendra.w@gmail.com'),
('Indah Lestari', 'F', '081287654321', 'indah.l@gmail.com'),
('Darmawan', 'M', '081276543210', 'darmawan@gmail.com');

-- 9. LOI
INSERT INTO LOI (FixPrice, Discount, Deposit) VALUES
(390000000, 5.00, 50000000),
(580000000, 7.50, 100000000),
(320000000, 3.00, 30000000);

-- 10. Agreement 
INSERT INTO Agreement (CustomerID, DealerCarID, SalesPersonID, LOIID, VIN, AgreementDate, IsCredit, CreditNominal, CreditPeriod, InterestRate, Instalment, CreditStatus, PaymentStatus) VALUES
(1, 1, 1, 1, 'JT1234567890123456', '2025-08-01', 1, 200000000, 36, 3.5, 6000000, 1, 0),
(2, 2, 2, 2, 'JT6543210987654321', '2025-08-05', 0, NULL, NULL, NULL, NULL, 0, 1),
(3, 3, 3, 3, 'JT1112223334445556', '2025-08-07', 1, 150000000, 24, 4.0, 7000000, 1, 1);

-- 11. WarrantyRegistration
INSERT INTO WarrantyRegistration (AgreementID, PurchaseDate, WarrantyPeriodMonths) VALUES
(1, '2025-08-01', 36),
(2, '2025-08-05', 36),
(3, '2025-08-07', 24);

-- 12. WarrantyClaim
INSERT INTO WarrantyClaim (WarrantyID, IssueReported, ServiceCenter, RepairDate, RepairCost, ClaimStatus) VALUES
(1, 'Mesin bermasalah', 'Jakarta Service Center', '2025-09-01', 2000000, 'Closed'),
(2, 'Cat tergores', 'Bandung Service Center', '2025-09-10', 1500000, 'Open'),
(3, 'Klakson rusak', 'Surabaya Service Center', '2025-09-15', 500000, 'Closed');

-- 13. VisitorFeedback
INSERT INTO VisitorFeedback (VisitorID, FeedbackDate, FeedbackText, RelatedActivity, RelatedActivityID) VALUES
(1, '2025-08-02', 'Pelayanan sangat baik', 'TestDrive', 1),
(2, '2025-08-03', 'Sales ramah dan informatif', 'ConsultHistory', 2),
(3, '2025-08-04', 'Mobil sesuai ekspektasi', 'TestDrive', 4);

SELECT * FROM Car