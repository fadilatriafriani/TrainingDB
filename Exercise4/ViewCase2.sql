use AdventureWorks2022
go

create view vwEmployeeDirectory
as

select 
    p.FirstName + isnull(' ' + p.MiddleName, '') +  ' ' + p.LastName as FullName,
    m.EmailAddress,
    e.JobTitle
from 
    HumanResources.Employee e
    inner join Person.Person p on e.BusinessEntityID = p.BusinessEntityID
    inner join Person.EmailAddress m on e.BusinessEntityID = m.BusinessEntityID
 
