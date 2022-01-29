CREATE OR REPLACE TRIGGER salary_check_trigger
	BEFORE  UPDATE ON employee
	FOR EACH ROW
	
	BEGIN
	
	IF UPDATING AND  valid_salary(:NEW.ssn, :NEW.salary) THEN
--		DBMS_OUTPUT.PUT_LINE(NEW.salary || 'is updating to ' || :NEW.ssn || ' employee');
		INSERT INTO SALARY_RECORD VALUES(:NEW.SSN, :NEW.LNAME, :NEW.SALARY, SYSDATE );
	ELSE
		RAISE_APPLICATION_ERROR(-20100, 'Salary is INVALID');
	END IF;
	
END salary_check_trigger;