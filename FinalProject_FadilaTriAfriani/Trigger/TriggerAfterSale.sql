-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_UpdateStockAfterSale
ON Agreement
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kurangi stok mobil sesuai DealerCarID yang ada di Agreement baru
    UPDATE DC
    SET DC.Stock = DC.Stock - 1
    FROM DealerCar DC
    INNER JOIN inserted i ON DC.DealerCarID = i.DealerCarID;

END;

--testing trigger
-- Tambah LOI baru 
INSERT INTO LOI (FixPrice, Discount, Deposit)
VALUES (0, 0.03, 8000000);  -- LOIID baru, misal ID = 3

-- Lalu Agreement baru pakai LOIID 3
INSERT INTO Agreement (
    CustomerID, DealerCarID, SalesPersonID, LOIID,
    VIN, AgreementDate, IsCredit, CreditNominal,
    CreditPeriod, InterestRate, Instalment, CreditStatus, PaymentStatus
) VALUES
(1, 1, 1, 3, 'VINXPDR004', '2025-07-19', 0, NULL, NULL, NULL, NULL, 0, 0);


SELECT * FROM DealerCar