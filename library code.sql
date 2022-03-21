Create Table Catalog_Service(
Id  Int Not Null Primary Key,
Name Varchar(50) 
);


Create Table Book (
Isbn Char(10) Not Null Primary Key,
Name Varchar (50) Not Null,
Authorid Varchar (50) Not Null,
Publisher Varchar (50) Not Null,
State Varchar (50) Not Null, 
Cat_Book Varchar (50) Not Null, 
Location Varchar (50) Not Null, 
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);



 


Create Table Loan (
Id Int Not Null Primary Key ,
Status Varchar(50),
Starttime Date Not Null,
Endtime Date Not Null , 
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
)


Create Table Fine ( 
Id Int Not Null Primary Key ,
Descrip Varchar(50) ,
Status Varchar(50) ,
Loanid Int ,
Foreign Key (Loanid) References Loan(Id) On Delete Cascade
);



Create Table Privilege (
Num Int Not Null Primary Key, 
Name Varchar(50) Not Null , 
Max_Num Varchar(50),
Loan Int,
Foreign Key (Num) References Loan(Id) On Delete Cascade

);


Create Table Member ( 
Id  Int Not Null Primary Key, 
Name Varchar(50) Not Null , 
Email Varchar(50),
Types Varchar(50) Not Null, 
Dob Date ,
Status Varchar(50),
Address Varchar(50),
Id_Catalog Int ,
Phone Int,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);

Create Table Staff ( 
Id  Int Not Null Primary Key, 
Name Varchar(50) Not Null , 
Email Varchar(50),
Job Varchar(50) Not Null, 
Contact Varchar(50) ,
Status Varchar(50),
Address Varchar(50),
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);

Create Table Video_Sound (
Id Int Not Null Primary Key,
Name Varchar(50)Not Null,
Rec_Type   Varchar(50) Not Null,
Rec_Description Varchar(50) Not Null,
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);


Create Table Thesis( 
Id Char(9) Not Null Primary Key, 
Name Varchar(50) Not Null, 
Location Varchar(50) Not Null, 
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);

Create Table journal ( 
Num int Not Null Primary Key, 
Title Varchar(50) Not Null, 
Status Varchar(50),
Id_Catalog Int ,
Foreign Key (Id_Catalog) References Catalog_Service(Id) On Delete Cascade
);



View :

Create View Vbookstatus As 
Select * From Book

User:

Create User User_Name
Identified By 1234
Default Tablespace Users
Temporary Tablespace Temp
Quota 500k On Users;

Grant Connect To User_Name;
Grant Select On Vbookstatus To User_Name;
