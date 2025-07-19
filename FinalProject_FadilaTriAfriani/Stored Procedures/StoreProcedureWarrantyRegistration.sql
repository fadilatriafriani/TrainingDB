-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE usp_RegisterWarranty
    @AgreementID INT,
    @PurchaseDate DATE,
    @WarrantyPeriodMonths INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO WarrantyRegistration (AgreementID, PurchaseDate, WarrantyPeriodMonths)
    VALUES (@AgreementID, @PurchaseDate, @WarrantyPeriodMonths);

    SELECT SCOPE_IDENTITY() AS NewWarrantyID;
END;
GO
