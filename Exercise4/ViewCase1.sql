use AdventureWorks2022
go

create view vwActiveProductCatalog
as

select 
    p.Name as ProductName,
    p.ProductNumber,
    p.ListPrice,
    p.SellStartDate
from 
    Production.Product p
where 
    p.SellEndDate is null;