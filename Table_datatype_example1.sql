SET SERVEROUTPUT ON
DECLARE
	CURSOR c_stud is
		SELECT * FROM STUDENT
		ORDER BY ID;
--		FETCH FIRST 5 ROWS ONLY;
	
	TYPE stud_table	is table of 	student.id%type;
	
	stud_record	stud_table;
BEGIN
	stud_record := stud_table();
	
	for i in c_stud
	loop
		stud_record.extend;
		stud_record(stud_record.last) := i.id;
	end loop;
	
	for j in stud_record.first.. stud_record.last
	loop
		dbms_output.put_line(stud_record(j));
	end loop;
END;

commit;
