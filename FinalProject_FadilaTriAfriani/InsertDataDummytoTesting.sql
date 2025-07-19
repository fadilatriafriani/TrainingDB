--Data Dummy untuk Test Query

USE FinalProject;
GO

-- 1. Dealer 
INSERT INTO Dealer (DealerName, Location) VALUES
('Mitsubishi Jakarta Pusat', 'Jakarta'),
('Mitsubishi Padang Raya', 'Padang');

--SELECT * FROM Dealer
--DELETE  FROM Dealer

-- 2. Car
INSERT INTO Car (ModelName, Year, BasePrice) VALUES
('Mitsubishi Xpander', 2023, 250000000),
('Mitsubishi Pajero Sport', 2022, 550000000);

--SELECT * FROM Car
--DELETE FROM Car

-- 3. DealerCar
INSERT INTO DealerCar (DealerID, CarModelID, Stock, DisplayPrice) VALUES
(1, 1, 5, 260000000),  
(2, 2, 3, 565000000);

--SELECT * FROM DealerCar
--DELETE FROM DealerCar

-- 4. SalesPerson (Satu per dealer)
INSERT INTO SalesPerson (SalesName, DealerID) VALUES
('Dita Mitsubishi', 1),
('Ditu Mitsubishi', 2);

--SELECT * FROM SalesPerson
--DELETE FROM SalesPerson

-- 5. Customer
INSERT INTO Customer (CustomerName, Phone, Email) VALUES
('Fadila Afriani', '08123456789', 'fadila@gmail.com'),
('Tri Afrianda', '08234567890', 'tri@gmail.com.com');

--SELECT * FROM Customer
--DELETE FROM Customer


-- 6. ConsultHistory
INSERT INTO ConsultHistory (CustomerID, DealerCarID, SalesPersonID, Budget, DateConsult, Note) VALUES
(1, 1, 1, 270000000, '2025-07-10', 'Suka Xpander.'),
(2, 2, 2, 570000000, '2025-07-11', 'Pajero Keren.');

--SELECT * FROM ConsultHistory
--DELETE FROM ConsultHistory

-- 7. TestDrive
INSERT INTO TestDrive (CustomerID, DealerCarID, SalesPersonID, DateTestDrive, Note) VALUES
(1, 1, 1, '2025-07-15', 'Xpander enak dikendarai.'),
(2, 2, 2, '2025-07-15', 'Pajero nyaman.');

--SELECT * FROM TestDrive
--DELETE FROM TestDrive

-- 8. LOI
INSERT INTO LOI (FixPrice, Discount, Deposit) VALUES
(0, 0.05, 10000000),         --memakai harga discount
(550000000, NULL, 15000000); --memakai harga fix

--SELECT * FROM LOI
--DELETE FROM LOI

-- 9. Agreement
INSERT INTO Agreement (
    CustomerID, DealerCarID, SalesPersonID, LOIID,
    VIN, AgreementDate, IsCredit, CreditNominal,
    CreditPeriod, InterestRate, Instalment, CreditStatus, PaymentStatus
) VALUES
(1, 1, 1, 1, 'VINXPDR001', '2025-07-18', 0, NULL, NULL, NULL, NULL, 0, 0),
(2, 2, 2, 2, 'VINPJR002', '2025-07-18', 1, 300000000, 36, 3.5, 9500000, 1, 0);

--SELECT * FROM Agreement
--DELETE FROM Agreement


-- 10. WarrantyRegistration
INSERT INTO WarrantyRegistration (AgreementID, PurchaseDate, WarrantyPeriodMonths) VALUES
(1, '2025-07-18', 36),
(2, '2025-07-18', 48);

--SELECT * FROM WarrantyRegistration
--DELETE FROM WarrantyRegistration

-- 11. WarrantyClaim
INSERT INTO WarrantyClaim (WarrantyID, IssueReported, ServiceCenter, RepairDate, RepairCost, ClaimStatus) VALUES
(1, 'AC Tidak Dingin', 'Mitsubishi SC Jakarta', '2025-08-01', 500000, 'Selesai'),
(2, 'Rem Berbunyi', 'Mitsubishi SC Padang', '2025-08-03', 300000, 'Dalam Proses');

--SELECT * FROM WarrantyClaim
--DELETE FROM WarrantyClaim



