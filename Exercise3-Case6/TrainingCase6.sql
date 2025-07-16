-- 1. CarModel
CREATE TABLE CarModel (
    CarModelID INT PRIMARY KEY IDENTITY(1,1),
    ModelName VARCHAR(100) NOT NULL,
    Year INT NOT NULL
);

-- 2. Dealer
CREATE TABLE Dealer (
    DealerID INT PRIMARY KEY IDENTITY(1,1),
    DealerName VARCHAR(100) NOT NULL,
    Region VARCHAR(50)
);

-- 3. PromotionCampaign
CREATE TABLE PromotionCampaign (
    CampaignID INT PRIMARY KEY IDENTITY(1,1),
    CampaignName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    DiscountPercent DECIMAL(5,2) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- 4. CampaignModel (Junction table: menghubungkan Campaign dan CarModel)
CREATE TABLE CampaignModel (
    CampaignModelID INT PRIMARY KEY IDENTITY(1,1),
    CampaignID INT NOT NULL,
    CarModelID INT NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID),
    FOREIGN KEY (CarModelID) REFERENCES CarModel(CarModelID)
);

-- 5. CampaignDealer (Junction table: menghubungkan Campaign dan Dealer)
CREATE TABLE CampaignDealer (
    CampaignDealerID INT PRIMARY KEY IDENTITY(1,1),
    CampaignID INT NOT NULL,
    DealerID INT NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID),
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID)
);

-- 6. CustomerBenefit (mencatat pelanggan yang mendapat manfaat dari kampanye)
CREATE TABLE CustomerBenefit (
    BenefitID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    CarModelID INT NOT NULL,
    CampaignID INT NOT NULL,
    EligibleDate DATE NOT NULL,
    FOREIGN KEY (CarModelID) REFERENCES CarModel(CarModelID),
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID)
);
