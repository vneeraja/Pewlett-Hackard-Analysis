# Pewlett-Hackard-Analysis

## Overview of the analysis

Bobby's manager has given him and us two assignments:
1. Determine the number of retiring employees per title.
2. Identify employees who are eligible to participate in a mentorship program. 
Then, we have to write a report that summarizes our analysis and help prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

## Results
We first create an ERD for our project:
Entity-Relationship (ER) model is a visual representation of the table's structure and the relationships between logically related tables.

![image](https://user-images.githubusercontent.com/111020934/192436926-313791e3-2385-44a4-975d-4be02c8816ef.png)

### 1. Determine the number of retiring employees per title.

* We create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. 
![image](https://user-images.githubusercontent.com/111020934/192437790-fe5c3917-d56b-432f-ab86-2b302af181c0.png)

The Retirement Titles table is exported as retirement_titles.csv.

* Because some employees may have multiple titles in the database—for example, due to promotions—we’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. 
![image](https://user-images.githubusercontent.com/111020934/192438040-15f9609c-6674-4aa2-a66f-e90bb8785548.png)

The Unique Titles table is exported as unique_titles.csv.

* Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, we need to be sure to exclude those employees who have already left the company.

![image](https://user-images.githubusercontent.com/111020934/192438325-c2c0b272-cd24-4b34-8c8f-5b2f391fb7a5.png)

The Retiring Titles table is exported as retiring_titles.csv.

### 2. Identify employees who are eligible to participate in a mentorship program.

* Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. 
We filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.

![image](https://user-images.githubusercontent.com/111020934/192439101-7cb80e10-a5b2-456c-a93e-e132969856f8.png)

Export the Mentorship Eligibility table as mentorship_eligibilty.csv.

## Summary

### 1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
 
From the retiring tables we can see that the number of positions for the titles that will become vacant. These many roles will need to be filled.

![image](https://user-images.githubusercontent.com/111020934/192438325-c2c0b272-cd24-4b34-8c8f-5b2f391fb7a5.png)


### 2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

We can get the number of employees who are eligible to mentor in each of the departments by executing the below query:

select count(me.emp_no) as "Employees",d.dept_name into dept_eligibility
from mentorship_eligibilty as me 
inner join dept_emp as de on (me.emp_no = de.emp_no)
inner join departments as d on (de.dept_no = d.dept_no)
group by d.dept_name;

The result shows the number of eligible employees to mentor the next generation of Pewlett Hackard employees in each department.

![image](https://user-images.githubusercontent.com/111020934/192444107-14f25105-7e52-4db3-8a75-dca0a8780330.png)

**We can see that there are 435 eligible employees in the development department, the highest in all who can mentor the new employees joining the organization.**


