-- Gunakan database
USE DBProjectMigration;
GO

-- 1. Dealer
INSERT INTO Dealer (DealerName, Location) VALUES
('Dealer A', 'Jakarta'),
('Dealer B', 'Bandung'),
('Dealer C', 'Surabaya'),
('Dealer D', 'Medan'),
('Dealer E', 'Makassar');

-- 2. Car
INSERT INTO Car (ModelName, Year, BasePrice, Color) VALUES
-- Dealer A
('Destinator A', 2024, 385000000, 'Silver'),
('Xpander A', 2023, 270100000, 'White'),
('Xpander Cross A', 2024, 338000000, 'Grey'),
('Pajero Sport A', 2023, 577700000, 'White'),
('Xforce A', 2024, 388000000, 'White'),

-- Dealer B
('Destinator B', 2024, 385000000, 'Silver'),
('Xpander B', 2023, 270100000, 'White'),
('Xpander Cross B', 2024, 338000000, 'Grey'),
('Pajero Sport B', 2023, 577700000, 'White'),
('Xforce B', 2024, 388000000, 'White'),

-- Dealer C
('Destinator C', 2024, 385000000, 'Silver'),
('Xpander C', 2023, 270100000, 'White'),
('Xpander Cross C', 2024, 338000000, 'Grey'),
('Pajero Sport C', 2023, 577700000, 'White'),
('Xforce C', 2024, 388000000, 'White'),

-- Dealer D
('Destinator D', 2024, 385000000, 'Silver'),
('Xpander D', 2023, 270100000, 'White'),
('Xpander Cross D', 2024, 338000000, 'Grey'),
('Pajero Sport D', 2023, 577700000, 'White'),
('Xforce D', 2024, 388000000, 'White'),

-- Dealer E
('Destinator E', 2024, 385000000, 'Silver'),
('Xpander E', 2023, 270100000, 'White'),
('Xpander Cross E', 2024, 338000000, 'Grey'),
('Pajero Sport E', 2023, 577700000, 'White'),
('Xforce E', 2024, 388000000, 'White');

-- 3. DealerCar (Asumsikan ID dealer = 1-5 dan CarModelID = 1-25)
INSERT INTO DealerCar (DealerID, CarModelID, Stock, DisplayPrice) VALUES
-- Dealer A
(1, 1, 5, 395000000),
(1, 2, 6, 280000000),
(1, 3, 4, 345000000),
(1, 4, 3, 585000000),
(1, 5, 5, 395000000),

-- Dealer B
(2, 6, 5, 395000000),
(2, 7, 6, 280000000),
(2, 8, 4, 345000000),
(2, 9, 3, 585000000),
(2, 10, 5, 395000000),

-- Dealer C
(3, 11, 5, 395000000),
(3, 12, 6, 280000000),
(3, 13, 4, 345000000),
(3, 14, 3, 585000000),
(3, 15, 5, 395000000),

-- Dealer D
(4, 16, 5, 395000000),
(4, 17, 6, 280000000),
(4, 18, 4, 345000000),
(4, 19, 3, 585000000),
(4, 20, 5, 395000000),

-- Dealer E
(5, 21, 5, 395000000),
(5, 22, 6, 280000000),
(5, 23, 4, 345000000),
(5, 24, 3, 585000000),
(5, 25, 5, 395000000);

-- 4. SalesPerson (1 per dealer)
INSERT INTO SalesPerson (SalesName, Gender, DealerID, Email, Phone) VALUES
('Andi A', 'M', 1, 'andi.a@dealerA.com', '081100000001'),
('Budi B', 'M', 2, 'budi.b@dealerB.com', '081100000002'),
('Citra C', 'F', 3, 'citra.c@dealerC.com', '081100000003'),
('Dina D', 'F', 4, 'dina.d@dealerD.com', '081100000004'),
('Eko E', 'M', 5, 'eko.e@dealerE.com', '081100000005');
