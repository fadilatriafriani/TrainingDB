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
CREATE PROCEDURE usp_RegisterCustomer
    @CustomerName VARCHAR(50),
    @Phone VARCHAR(20),
    @Email VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customer (CustomerName, Phone, Email)
    VALUES (@CustomerName, @Phone, @Email);

    SELECT SCOPE_IDENTITY() AS NewCustomerID;
END;
GO

--Execute
--Jika sudah execute, maka bisa dilakukan pengecekan data yang sudah ditambah
SELECT * FROM Customer WHERE CustomerID = 3;
