use AdventureWorks2022
go

create view vwSalesOrderSummary
as

select 
    s.SalesOrderID as OrderID,
    s.OrderDate,
    p.FirstName + isnull(' ' + p.MiddleName, '') + ' ' + p.LastName as CustomerName,
    s.TotalDue
from 
    Sales.SalesOrderHeader s
    inner join Sales.Customer c on s.CustomerID = c.CustomerID
    inner join Person.Person p on c.PersonID = p.BusinessEntityID;

 
