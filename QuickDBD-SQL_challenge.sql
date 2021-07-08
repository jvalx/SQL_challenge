-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UptVjO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DEP_ID" INTEGER   NOT NULL,
    "Dep_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DEP_ID"
     )
);

CREATE TABLE "Dept_Emp" (
    "EMP_ID" INTEGER   NOT NULL,
    "DEP_ID" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "EMP_ID"
     )
);

CREATE TABLE "Dept_Manager" (
    "DEP_ID" INTEGER   NOT NULL,
    "EMP_ID" INTEGER   NOT NULL
);

CREATE TABLE "Employees" (
    "EMP_ID" INTEGER   NOT NULL,
    "Emp_Title_ID" INTEGER   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EMP_ID","Emp_Title_ID"
     )
);

CREATE TABLE "Salaries" (
    "EMP_ID" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_DEP_ID" FOREIGN KEY("DEP_ID")
REFERENCES "Departments" ("DEP_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_DEP_ID" FOREIGN KEY("DEP_ID")
REFERENCES "Departments" ("DEP_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Dept_Emp" ("EMP_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EMP_ID" FOREIGN KEY("EMP_ID")
REFERENCES "Employees" ("EMP_ID");

