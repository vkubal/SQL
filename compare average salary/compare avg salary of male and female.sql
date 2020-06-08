/*Comparing average salary of female versus male employees in the entire company until year 2002, and 
adding a filter allowing to see that per each department.*/

select 
 e.gender as gender,
 d.dept_name department_name,
 round(avg(s.salary),2) as average_salary,
 year(s.from_date) AS calendar_year
from employees as e
join
salaries as s on e.emp_no = s.emp_no
join
dept_emp as de on  e.emp_no = de.emp_no 
join
departments as d on de.dept_no = d.dept_no
group by d.dept_no, gender, calendar_year
having calendar_year <= '2002'
order by d.dept_no; 