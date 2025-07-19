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

--function Discount Amount
CREATE FUNCTION ufn_DiscountAmount (
    @DealerCarID INT,
    @LOIID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @BasePrice INT, @Discount FLOAT, @DiscountAmount INT

    SELECT @BasePrice = DisplayPrice FROM DealerCar WHERE DealerCarID = @DealerCarID
    SELECT @Discount = Discount FROM LOI WHERE LOIID = @LOIID

    SET @DiscountAmount = CAST(@BasePrice * @Discount AS INT)

    RETURN @DiscountAmount
END;

--test diskon yang didapatkan
SELECT dbo.ufn_DiscountAmount(1, 1) AS DiscountAmount;
