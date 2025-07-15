--SECTION 1--
--Case 1
select Name, ListPrice from Production.Product 
where ListPrice > 1000

--Case 2
select * from HumanResources.Employee
where HireDate > '2012-01-01'

--Case 3
select top 10 * from Production.Product order by ListPrice desc

--Case 4
select Name from Production.Product 
where Name like 'b%'

--pegawai paling muda
select top 1 * from HumanResources.Employee order by BirthDate desc

--pegawai paling tua
select top 1 * from HumanResources.Employee order by BirthDate asc


--SECTION 2--
--Case 5
select * from Sales.SalesOrderHeader
select * from Sales.Customer
select * from Person.Person

select 
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS CustomerFullName,
    h.OrderDate,
    h.TotalDue
from Sales.SalesOrderHeader as h
inner join Sales.Customer as c on h.CustomerID = c.CustomerID
inner join Person.Person as p on c.PersonID = p.BusinessEntityID


--Case 6
select * from Production.Product
select * from Production.ProductSubcategory

select 
    p.Name as ProductName,
    s.Name as SubcategoryName
from Production.Product p 
inner join Production.ProductSubcategory s on p.ProductSubcategoryID = s.ProductSubcategoryID


--Case 7
select * from HumanResources.Employee
select * from Person.Person

select 
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS EmployeeName,
    e.JobTitle
from HumanResources.Employee e 
inner join Person.Person p on e.BusinessEntityID = p.BusinessEntityID


--case 8
select * from Sales.SalesOrderHeader
select * from Sales.SalesPerson
select * from Person.Person

select 
    s.SalesOrderID,
    sp.BusinessEntityID as SalesPersonID,
    p.FirstName + ' ' + p.LastName as SalesPersonName
from Sales.SalesOrderHeader as s
left join Sales.SalesPerson as sp on s.SalesPersonID = sp.BusinessEntityID
left join Person.Person as p on sp.BusinessEntityID = p.BusinessEntityID



--SECTION 3--
--Case 9
select ProductLine, count(*) as Total from Production.Product group by ProductLine; --Count nya pakai primary key atau pakai *
 
--Case 10
select ProductSubcategoryID, avg(ListPrice) as Average from Production.Product group by ProductSubcategoryID;

--Case 11
select JobTitle, count(*) as EmployeeTotal from HumanResources.Employee group by JobTitle;

--Case 12
select year(OrderDate) as OrderYear, count(*) as OrderTotal from Sales.SalesOrderHeader group by year(OrderDate);


--SECTION 4--
--Case 13
select 
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName as CustomerFullName,
    sum(s.TotalDue) as TotalSales
from Sales.SalesOrderHeader s
inner join Sales.Customer c on s.CustomerID = c.CustomerID
inner join Person.Person p on c.PersonID = p.BusinessEntityID
group by p.FirstName, p.MiddleName,  p.LastName


--Case 14
select 
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName as SalesPersonName,
    count(s.SalesOrderID) as OrderCount
from Sales.SalesPerson sp
left join Sales.SalesOrderHeader s on sp.BusinessEntityID = s.SalesPersonID
inner join Person.Person p on sp.BusinessEntityID = p.BusinessEntityID
group by p.FirstName, p.MiddleName, p.LastName


--Case 15
select 
    year(OrderDate) as OrderYear,
    avg(TotalDue) as AverageOrderAmount
from Sales.SalesOrderHeader
group by year(OrderDate)


--Case 16
select top 5
    p.Name AS ProductName,
    sum(o.OrderQty) as TotalQuantitySold
from Sales.SalesOrderDetail o
inner join Production.Product p on o.ProductID = p.ProductID
group by p.Name
order by TotalQuantitySold desc;


--Case 17
select 
    c.Name as SubcategoryName,
    count(p.ProductID) as ProductCount
from Production.Product p
inner join Production.ProductSubcategory c on p.ProductSubcategoryID = c.ProductSubcategoryID
where p.ListPrice > 500
group by c.Name


--Case 18
select TOP 1
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName as SalesPersonName,
    count(s.SalesOrderID) as OrderCount
from Sales.SalesOrderHeader s
inner join Sales.SalesPerson sp on s.SalesPersonID = sp.BusinessEntityID
inner join Person.Person p on sp.BusinessEntityID = p.BusinessEntityID
group by p.FirstName, p.MiddleName, p.LastName
order by OrderCount desc;
