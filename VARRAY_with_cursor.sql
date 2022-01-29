set SERVEROUTPUT ON
DECLARE 

   CURSOR c_customers is 
   SELECT  name FROM customers; 
   
   TYPE c_list 
   IS VARRAY(20) OF 			customers.name%TYPE; 
   
    counter 				varchar2(20) := 1;
   name_list 				c_list :=  c_list(); 
   
BEGIN
	FOR n IN c_customers
	LOOP
		name_list.extend;
		name_list(counter) := n.name;
		EXIT WHEN c_customers%NOTFOUND;
		dbms_output.put_line('Customer(' || counter || ') : ' || name_list(counter));
		counter := counter + 1;
	END LOOP;
END; 
/ 

--select * from customers;