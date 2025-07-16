--Case 3--
-- 1. PartCategory
CREATE TABLE PartCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);

-- 2. Part
CREATE TABLE Part (
    PartNumber VARCHAR(50) PRIMARY KEY,
    PartName VARCHAR(30) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES PartCategory(CategoryID)
);

-- 3. Supplier
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(30) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- 4. SupplierPartOffer
CREATE TABLE SupplierPartOffer (
    OfferID INT PRIMARY KEY IDENTITY(1,1),
    SupplierID INT NOT NULL,
    PartNumber VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    LeadTimeDays INT NOT NULL,
    Rating DECIMAL(3,2) NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (PartNumber) REFERENCES Part(PartNumber)
);
