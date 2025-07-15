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
