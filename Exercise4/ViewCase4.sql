use AdventureWorks2022
go

create view vwProductPricingByCategory
as

select 
    p.Name as ProductName,
    s.Name as SubCategoryName,
    p.ListPrice
from 
    Production.Product p
    inner join Production.ProductSubcategory s on p.ProductSubcategoryID = s.ProductSubcategoryID
where
    p.ListPrice > 0;


