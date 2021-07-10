-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UptVjO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DEP_ID" VARCHAR   NOT NULL,
    "Dep_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DEP_ID"
     )
);

CREATE TABLE "Titles" (
    "Emp_Title_ID" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Emp_Title_ID"
     )
);

CREATE TABLE "Employees" (
    "EMP_ID" INTEGER   NOT NULL,
    "Emp_Title_ID" VARCHAR   NOT NULL,
    "Birth_Date" VARCHAR   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EMP_ID"
     )
);

CREATE TABLE "Dept_Emp" (
    "EMP_ID" INTEGER   NOT NULL,
    "DEP_ID" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "EMP_ID","DEP_ID"
     )
);

CREATE TABLE "Dept_Manager" (
    "DEP_ID" VARCHAR   NOT NULL,
    "EMP_ID" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "DEP_ID","EMP_ID"
     )
);

CREATE TABLE "Salaries" (
    "EMP_ID" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "EMP_ID","Salary"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_ID" FOREIGN KEY("Emp_Title_ID")
REFERENCES "Titles" ("Emp_Title_ID");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_DEP_ID" FOREIGN KEY("DEP_ID")
REFERENCES "Departments" ("DEP_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_DEP_ID" FOREIGN KEY("DEP_ID")
REFERENCES "Departments" ("DEP_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

