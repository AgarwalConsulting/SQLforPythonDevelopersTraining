CREATE TABLE EmployeeProjectInfo (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    ProjectID VARCHAR(10),
    ProjectName VARCHAR(100),
    ProjectStartDate DATE,
    ProjectEndDate DATE,
    Role VARCHAR(50),
    ProjectBudget NUMERIC(10, 2),
    ManagerID INT,
    ManagerName VARCHAR(100),
    OfficeLocation VARCHAR(100),
    Bonus NUMERIC(10, 2),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO EmployeeProjectInfo (EmployeeID, EmployeeName, Department, ProjectID, ProjectName, ProjectStartDate, ProjectEndDate, Role, ProjectBudget, ManagerID, ManagerName, OfficeLocation, Bonus, PhoneNumber, Email)
VALUES
(101, 'Aarav Singh', 'Marketing', 'P001', 'Website Redesign', '2024-01-01', NULL, 'Lead', 500000.00, 201, 'Priya Kapoor', 'Mumbai', NULL, '9876543210', 'aarav.singh@email.com'),
(102, 'Meera Iyer', 'HR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chennai', 50000.00, '9876543222', 'meera.iyer@email.com'),
(103, 'Aditya Sharma', 'Engineering', 'P002', 'App Development', '2024-02-15', '2024-06-15', 'Developer', 1200000.00, 202, 'Rohan Jain', 'Bangalore', NULL, '9876543233', 'aditya.sharma@email.com'),
(104, 'Kavya Nair', 'Sales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Delhi', 30000.00, NULL, 'kavya.nair@email.com'),
(105, 'Siddharth Rao', 'Engineering', 'P003', 'AI Research', '2024-03-01', NULL, 'Researcher', 2000000.00, 203, 'Anjali Das', 'Hyderabad', 200000.00, '9876543244', 'siddharth.rao@email.com'),
(106, 'Ishita Desai', 'Marketing', 'P004', 'Social Media Campaign', '2024-04-01', NULL, 'Manager', 750000.00, 204, 'Arjun Mehta', 'Mumbai', NULL, '9876543255', 'ishita.desai@email.com');
