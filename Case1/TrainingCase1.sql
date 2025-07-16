--Case 1--
-- 1. CarModel Table
CREATE TABLE CarModel (
    CarModelID INT PRIMARY KEY,
    ModelName VARCHAR(100) NOT NULL,
    Year INT NOT NULL
);

-- 2. PrototypeVehicle Table
CREATE TABLE PrototypeVehicle (
    PrototypeID INT PRIMARY KEY,
    CarModelID INT NOT NULL,
    VIN VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (CarModelID) REFERENCES CarModel(CarModelID)
);

-- 3. TestEngineer Table
CREATE TABLE TestEngineer (
    EngineerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(100)
);

-- 4. TestLocation Table
CREATE TABLE TestLocation (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);

-- 5. VehicleTest Table
CREATE TABLE VehicleTest (
    TestID INT PRIMARY KEY,
    PrototypeID INT NOT NULL,
    EngineerID INT NOT NULL,
    LocationID INT NOT NULL,
    TestDate DATE NOT NULL,
    TestType VARCHAR(50) NOT NULL, -- e.g., "Crash Test", "Emission Test"
    Result VARCHAR(10) NOT NULL,   -- "Pass" or "Fail"
    Notes TEXT,
    FOREIGN KEY (PrototypeID) REFERENCES PrototypeVehicle(PrototypeID),
    FOREIGN KEY (EngineerID) REFERENCES TestEngineer(EngineerID),
    FOREIGN KEY (LocationID) REFERENCES TestLocation(LocationID)
);
