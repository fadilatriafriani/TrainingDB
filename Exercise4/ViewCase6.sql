use AdventureWorks2022
go

create view vwSalespersonPerformance
as

select
	p.FirstName + isnull(' ' + p.MiddleName, '') + ' ' + p.LastName as Name,
    SUM(s.TotalDue) as TotalSalesAmount,
    COUNT(s.SalesOrderID) as OrderCount
from 
    Sales.SalesOrderHeader s
    inner join Sales.SalesPerson sp ON s.SalesPersonID = sp.BusinessEntityID
    inner join Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
where 
   s.SalesPersonID is not null
group by
    p.FirstName, p.MiddleName, p.LastName;





