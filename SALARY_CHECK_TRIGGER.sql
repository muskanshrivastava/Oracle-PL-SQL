set SERVEROUTPUT ON
create or replace NONEDITIONABLE TRIGGER salary_check_trigger
	BEFORE  UPDATE ON employee
	FOR EACH ROW
	
	BEGIN

	IF UPDATING AND  valid_salary(:NEW.ssn, :NEW.salary) THEN
		
		INSERT INTO SALARY_RECORD VALUES
		(
			:NEW.SSN,
			:NEW.LNAME,
			SYSDATE,
			:OLD.SALARY,
			:NEW.SALARY,
			:NEW.SALARY - :OLD.SALARY
		 );
		 DBMS_OUTPUT.PUT_LINE(to_char(:NEW.salary) || ' is updating to ' || :NEW.ssn || ' employee');
	ELSE
		RAISE_APPLICATION_ERROR(-20100, 'Salary is INVALID');
	END IF;

END salary_check_trigger;