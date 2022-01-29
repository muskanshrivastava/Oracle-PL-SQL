SET SERVEROUTPUT ON

create or replace function valid_salary
(
	emp_ssn			IN 	employee.ssn%TYPE,
	emp_salary	IN	employee.salary%TYPE
)
RETURN BOOLEAN
IS 

	highest_salary		employee.salary%TYPE  :=  50000;
BEGIN
		IF emp_salary > highest_salary THEN
			RETURN FALSE;
		ELSE
			RETURN TRUE;
		END IF;
		
END valid_salary;


