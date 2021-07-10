


--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

select 
	e."EMP_ID", "Last_Name", "First_Name", "Sex", s."Salary"
 from "Employees" e
 	 JOIN "Salaries" s
 		 on e."EMP_ID" = s."EMP_ID";


--2. List first name, last name, and hire date for employees who were hired in 1986.
 select 
 	 "First_Name", "Last_Name", "hire_date"
 from "Employees" e
 where 1=1
 	and "hire_date" ilike '%1986'

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

 select d."DEP_ID", d."Dep_Name", dm."EMP_ID", e."Last_Name", e."First_Name"
 FROM "Departments" d
 	JOIN "Dept_Manager" dm on dm."DEP_ID" = d."DEP_ID"
 	JOIN "Employees" e on e."EMP_ID" = dm."EMP_ID"

--4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

 select e."EMP_ID", e."Last_Name", e."First_Name", d."Dep_Name"
 FROM "Departments" d
 	JOIN "Dept_Emp" de on de."DEP_ID" = d."DEP_ID"
 	JOIN "Employees" e on e."EMP_ID" = de."EMP_ID"

-- 5. List first name, last name, and sex for employees whose first name 
 --is "Hercules" and last names begin with "B."

 select e."First_Name", e."Last_Name", e."Sex"
 from "Employees" e
 WHERE 1=1
 	AND  e."First_Name" = 'Hercules'
 	AND  e."Last_Name" ilike 'B_%'

 --6. List all employees in the Sales department,
 --including their employee number, last name, first name, and department name.

 select e."EMP_ID", e."Last_Name", e."First_Name", d."Dep_Name"
 FROM "Departments" d
 	JOIN "Dept_Emp" de on de."DEP_ID" = d."DEP_ID"
 	JOIN "Employees" e on e."EMP_ID" = de."EMP_ID"
 WHERE 1=1
 	AND d."Dep_Name" = 'Sales'

 --7. List all employees in the Sales and Development departments, 
 --including their employee number, last name, first name, and department name.

 select e."EMP_ID", e."Last_Name", e."First_Name", d."Dep_Name"
 FROM "Departments" d
 	JOIN "Dept_Emp" de on de."DEP_ID" = d."DEP_ID"
 	JOIN "Employees" e on e."EMP_ID" = de."EMP_ID"
 WHERE 1=1
 	AND d."Dep_Name" = 'Sales' 
	OR d."Dep_Name" = 'Development'

 --8. In descending order, list the frequency count of employee last names, 
 --i.e., how many employees share each last name.

select 
    "Last_Name",
	count(*) as c
from 
	"Employees"
group by "Last_Name"
order by c desc