use FinalProject
go

---View Sales Report
CREATE VIEW vw_SalesReport AS
SELECT 
    A.AgreementID,
    C.CustomerName,
    D.DealerName,
    M.ModelName,
    A.VIN,
    A.AgreementDate,
    A.IsCredit,
    A.PaymentStatus
FROM Agreement A
JOIN Customer C ON A.CustomerID = C.CustomerID
JOIN DealerCar DC ON A.DealerCarID = DC.DealerCarID
JOIN Dealer D ON DC.DealerID = D.DealerID
JOIN Car M ON DC.CarModelID = M.CarModelID;

--View Credit Status
CREATE VIEW vw_CreditStatus AS
SELECT 
    A.AgreementID,
    C.CustomerName,
    A.CreditNominal,
    A.CreditPeriod,
    A.InterestRate,
    A.Instalment,
    A.CreditStatus,
    A.PaymentStatus
FROM Agreement A
JOIN Customer C ON A.CustomerID = C.CustomerID
WHERE A.IsCredit = 1;

--View Available Cars
CREATE VIEW vw_AvailableCars AS
SELECT 
    D.DealerName,
    C.ModelName,
    DC.Stock,
    DC.DisplayPrice
FROM DealerCar DC
JOIN Dealer D ON DC.DealerID = D.DealerID
JOIN Car C ON DC.CarModelID = C.CarModelID
WHERE DC.Stock > 0;



---Testin view
SELECT * FROM vw_SalesReport;

SELECT * FROM vw_CreditStatus; 

SELECT * FROM vw_AvailableCars;
