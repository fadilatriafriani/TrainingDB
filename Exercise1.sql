use Exercise1
;

create table Plant(
--nama-kolom tipe-data attribute
	Code int identity(1,1) primary key,
	PlantsName varchar(50) not null,
	City varchar(30) not null,
	Country varchar(30) not null,
	AreaTotal int not null,
	Year int not null
)
;

create table CarModel(
--nama-kolom tipe-data attribute
	IdCar int identity(1,1) primary key,
	ModelName varchar(50) not null,
	TypeOfCar varchar(30) not null,
	EngineCapacity float not null,
	Year int not null,
	FuelType varchar(30) not null
)
;

create table ProductionPlan(
--nama-kolom tipe-data attribute
	IdProd int identity(1,1) primary key,
	PlanName varchar(50) not null,
	Month varchar(30) not null,
	Year int not null,
	TargetUnit int not null,
	Notes text 
)
;

create table Dealer(
--nama-kolom tipe-data attribute
	IdDealer int identity(1,1) primary key,
	DealerName varchar(50) not null,
	City varchar(30) not null,
	Province varchar(30) not null,
	Region varchar(30) not null,
	Phone int,
	Year int not null
)
;

create table CarSale(
--nama-kolom tipe-data attribute
	IdCustomer int identity(1,1) primary key,
	CustomerName varchar(50) not null,
	CarModel varchar(30) not null,
	Date date not null,
	Price int not null,
	PaidType varchar(30)not null
)
;

create table MaintenaceLog(
--nama-kolom tipe-data attribute
	IdLog int identity(1,1) primary key,
	CustomerName varchar(50) not null,
	CarModel varchar(30) not null,
	Date date not null,
	ServiceType varchar(30) not null,
	ServiceCenterName varchar(50) not null
)
;

create table PartInventory(
--nama-kolom tipe-data attribute
	IdPart int identity(1,1) primary key,
	PartName varchar(50) not null,
	PartNumber int not null,
	PartCategory varchar(50) not null,
	StockQuantity int not null,
	UnitPrice int not null,
	Status varchar(30) not null
)
;

create table CustomerFeedback(
--nama-kolom tipe-data attribute
	IdCustomer int identity(1,1) primary key,
	CustomerName varchar(50) not null,
	CarModel int not null,
	DateOfFeedback date not null,
	Rating int not null,
	Comment text 
)
;

