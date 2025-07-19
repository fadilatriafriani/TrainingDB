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
CREATE PROCEDURE usp_SubmitCreditApplication
    @CustomerID INT,
    @DealerCarID INT,
    @SalesPersonID INT,
    @LOIID INT,
    @VIN VARCHAR(30),
    @AgreementDate DATE,
    @IsCredit BIT,
    @CreditNominal INT = NULL,
    @CreditPeriod INT = NULL,
    @InterestRate FLOAT = NULL,
    @Instalment INT = NULL,
    @CreditStatus BIT = 0,
    @PaymentStatus BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Agreement
    (CustomerID, DealerCarID, SalesPersonID, LOIID, VIN, AgreementDate, IsCredit, CreditNominal, CreditPeriod, InterestRate, Instalment, CreditStatus, PaymentStatus)
    VALUES
    (@CustomerID, @DealerCarID, @SalesPersonID, @LOIID, @VIN, @AgreementDate, @IsCredit, @CreditNominal, @CreditPeriod, @InterestRate, @Instalment, @CreditStatus, @PaymentStatus);

    SELECT SCOPE_IDENTITY() AS NewAgreementID;
END;
GO
