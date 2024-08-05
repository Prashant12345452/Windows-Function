create database Aug05;
use Aug05

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES
(1, 'Alice', 1, 60000),
(2, 'Bob', 1, 70000),
(3, 'Charlie', 1, 70000),
(4, 'David', 2, 80000),
(5, 'Eve', 2, 90000),
(6, 'Frank', 3, 75000),
(7, 'Grace', 3, 85000),
(8, 'Hannah', 3, 75000);

select * from employees;

--ROW_NUMBER(): Assign a unique sequential integer to employees within each department, ordered by salary in descending order.

select *, ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num from employees;

--RANK(): Rank employees within each department by salary, allowing for ties.

select *, rank() over (partition by department_id order by salary desc) as rn from employees;

--DENSE_RANK(): Rank employees within each department by salary, without gaps in ranking sequence for ties

select *, DENSE_RANK() over(partition by department_id order by salary desc) from employees;

--SUM(): Calculate a running total of salaries within each department.
select *, sum(salary) over(partition by department_id  order by employee_id desc) from employees;

--AVG(): Calculate a moving average of salaries within each department.

select *, avg(salary) over(partition by department_id  order by employee_id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) from employees;

