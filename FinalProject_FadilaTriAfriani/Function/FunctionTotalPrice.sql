-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
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
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
--Function Total Price
CREATE FUNCTION ufn_TotalPrice ( --memakai data dealercar dan LOI
    @DealerCarID INT,
    @LOIID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @BasePrice INT, @Discount FLOAT, @FixPrice INT, @TotalPrice INT

    SELECT @BasePrice = DisplayPrice FROM DealerCar WHERE DealerCarID = @DealerCarID
    SELECT @FixPrice = FixPrice, @Discount = Discount FROM LOI WHERE LOIID = @LOIID

    IF @FixPrice > 0
        SET @TotalPrice = @FixPrice
    ELSE
        SET @TotalPrice = CAST(@BasePrice - (@BasePrice * @Discount) AS INT)

    RETURN @TotalPrice
END;

--Testing harga setelah diskon atau harga fix
-- Pakai diskon
SELECT dbo.ufn_TotalPrice(1, 1) AS TotalPriceWithDiscount;  --data 1 dapat diskon 5% 

-- Pakai harga fix
SELECT dbo.ufn_TotalPrice(2, 2) AS TotalPriceWithFix;       --data 2 punya fix price


