Create database Prashant

Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    JobTitle NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2) -- Adding Salary for some queries
);

-- Insert sample data into Employees table
INSERT INTO Employees (FirstName, LastName, JobTitle, Department, Salary)
VALUES 
('John', 'Doe', 'Junior Developer', 'IT', 50000),
('Jane', 'Smith', 'Senior Developer', 'IT', 80000),
('Michael', 'Johnson', 'Developer', 'IT', 60000),
('Emily', 'Davis', 'HR Manager', 'HR', 70000),
('Sarah', 'Brown', 'Lead Developer', 'IT', 90000),
('Chris', 'Wilson', 'Accountant', 'Finance', 55000),
('Jessica', 'Taylor', 'Junior Developer', 'IT', 51000),
('David', 'Anderson', 'HR Assistant', 'HR', 40000);


select * from Employees


--Simple select statement
create procedure GetAllEmployee
As 
Begin
	select * from Employees
End;

--calling
Exec GetAllEmployee


--Select input parameter

create procedure GetEmployeebyId 
	@EmployeeID INT
As
Begin
	Select * from Employees where EmployeeID= @EmployeeID
End;

--calling
Exec GetEmployeebyId @EmployeeID=2;

--Insert Statement

Create Procedure AddEmployee
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@JobTitle NVARCHAR(50),
	@Department NVARCHAR(50),
	@Salary Decimal(10,2)

AS
BEGIN
	insert into Employees(FirstName, LastName, JobTitle, Department, Salary)
	values (@FirstName, @LastName, @JobTitle, @Department, @Salary)
End;

Exec AddEmployee @FirstName ='Mark', @LastName='Lee', @JobTitle='Desginer', @Department='Marketing', @Salary=45000;

--Update Statement

select * from Employees

create procedure UpdateEmployeeDepartment
 @EmployeeID int,
 @NewDepartment NVARCHAR (50)
As Begin
 Update Employees
 Set Department= @NewDepartment
 where EmployeeID = @EmployeeID
End;

exec UpdateEmployeeDepartment @EmployeeID=1, @NewDepartment='HR';

ROLLBACK;

--Delete Statement

Create procedure deleteEmployee
	@EmployeeID Int
AS 
begin
	Delete from Employees where EmployeeID=@EmployeeID;
End;


Exec deleteEmployee @EmployeeID=9

--Handling Transaction

create procedure tranferEmployee
	@EmployeeID INT,
	@oldDepartment NVARCHAR(50),
	@NewDepartment NVARCHAR (50)
As Begin
	Begin Transaction;
	Begin Try
		update Employees
		set Department =@NewDepartment
		where EmployeeID = @EmployeeID

		COMMIT Transaction;
	END Try
	begin catch
		RollBack Transaction;
		Throw;
	End catch;
End;

select * from Employees
-- Calling
EXEC tranferEmployee @EmployeeID=2 , @oldDepartment='IT', @newDepartment='HR';



--Complex logic with Conditional Statement
