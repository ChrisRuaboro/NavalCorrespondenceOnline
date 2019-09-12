DROP database if exists NCO

Create database NCO

USE NCO
GO

DROP table if exists Users
CREATE TABLE Users (
    UserID int not null,
    LastName varchar(30)not null,
    FirstName varchar(30) not null,
	PayGradeType varchar(3),
	PayGradeRank varchar(2)
	CONSTRAINT PK_Users PRIMARY KEY (UserID)
);

DROP table if exists Accounts
CREATE TABLE Accounts (
    AccountID int not null CONSTRAINT PK_AccountID PRIMARY KEY,
	Email varchar(255) not null,
	Username varchar(25) not null,
	UserID int not null CONSTRAINT  FK_UserID FOREIGN KEY REFERENCES Users(UserID),
	SubscriptionType varchar(10)
);

DROP table if exists Units
CREATE TABLE Units (
    UnitIDCode int not null CONSTRAINT PK_UnitIDCode PRIMARY KEY,
	UnitName varchar(100) not null,
	ParentTo int,
	ChildTo int,
	POBox varchar(10),
	Address varchar(255) not null,
	City varchar(35) not null,
	State varchar(25) not null,
	Country varchar(25) not null,
	ZipCode varchar(255) not null,
	Phone varchar(25) not null,
);

DROP table if exists Templates
CREATE TABLE Templates (
    TemplateID int not null CONSTRAINT PK_TemplateID PRIMARY KEY,
	Template varchar(30),
);

DROP table if exists Products
CREATE TABLE Products(
	ProductID int not null CONSTRAINT PK_ProductID PRIMARY KEY,
	TemplateID int not null CONSTRAINT FK_TemplateID FOREIGN KEY REFERENCES Templates(TemplateID),
	AccountID int not null CONSTRAINT FK_AccountID FOREIGN KEY REFERENCES Accounts(AccountID),
	ProductDate Date
);







