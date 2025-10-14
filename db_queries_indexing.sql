-- indexing (B-tree)
use sql_learning;

CREATE TABLE students (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO students (first_name, last_name, department, salary) VALUES
('John', 'Doe', 'Sales', 60000.00),
('Jane', 'Smith', 'Marketing', 65000.00),
('Peter', 'Jones', 'Engineering', 75000.00),
('Mary', 'Brown', 'Sales', 58000.00),
('Robert', 'Davis', 'Engineering', 80000.00);


select * from students;

-- without index - full table scan
select * from students
where department = 'Engineering';

-- it will have to scan all rows 
explain select * from students
where department = 'Engineering';

--  with index - specific scan
create index students_dept_ix on students (department);

select * from students
where department = 'Engineering';

explain select * from students
where department = 'Engineering';


-- drop index
-- use alter table and drop index
alter table students drop index students_dept_ix;

drop table students;
