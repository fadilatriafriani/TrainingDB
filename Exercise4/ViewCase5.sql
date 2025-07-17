use AdventureWorks2022
go

create view vwPFrequentCustomers
as

select 
    p.FirstName + isnull(' ' + p.MiddleName, '') + ' ' + p.LastName as CustomerName,
    COUNT(s.SalesOrderID) as OrderCount
from 
    Sales.SalesOrderHeader s
    inner join Sales.Customer sc on s.CustomerID = sc.CustomerID
    inner join Person.Person p on sc.PersonID = p.BusinessEntityID
group by 
    p.FirstName, p.MiddleName, p.LastName
having 
    COUNT(s.SalesOrderID) > 3

