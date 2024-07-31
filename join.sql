use aug30

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    employee_id INT
);

INSERT INTO projects (project_id, project_name, employee_id) VALUES
(100, 'Project A', 1),
(101, 'Project B', 2),
(102, 'Project C', 4),
(103, 'Project D', 5),
(104, 'Project E', 5);


INSERT INTO employees (employee_id, name, department_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', NULL),
(4, 'David', 10),
(5, 'Eve', 30);

INSERT INTO departments (department_id, department_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT'),
(40, 'Marketing');

select * from employees;
select * from departments;

--Inner Join--

select e.name, d.department_name from employees e inner join departments d on e.department_id=d.department_id;

--left join

select e.name, d.department_name from employees e left join departments d on e.department_id=d.department_id;

--right join

select e.name, d.department_name from employees e right join departments d on e.department_id = d.department_id;

-- full join


select e.name, d.department_name from employees e full join departments d on e.department_id = d.department_id;

--cross join

select e.name, d.department_name from employees e cross join departments d;


--complex query

--Let's write a query that joins all three tables to get a list of employees, their department names, and their project names
select * from employees;
select * from departments;
select * from projects;

select e.name, d.department_id, project_name from employees e left join departments d on 
e.department_id = d.department_id left join projects p on e.employee_id=p.employee_id;

SELECT e.name, d.department_name, project_name FROM employees e INNER JOIN departments d on e.department_id  = d.department_id 
left join projects p on e.employee_id=p.employee_id;

SELECT e.name, d.department_name, project_name FROM employees e INNER JOIN departments d on e.department_id  = d.department_id 
inner join projects p on e.employee_id=p.employee_id;

use aug30

select * from artist;

SELECT COUNT(*) 
FROM artist 
WHERE middle_names IS NULL;

INSERT INTO employees (employee_id, name, department_id) VALUES
(6, 'Alice', 10),
(7, 'Bob', 20),
(8, 'Charlie', NULL);
select * from employees
with cte as (
select *, ROW_NUMBER() over ( partition by name order by employee_id) as rn from employees)
delete from cte
where rn>1;












