SET SERVEROUTPUT ON;
SET VERIFY OFF;
BEGIN
DBMS_OUTPUT.PUT_LINE('Press 1 for member list.');
DBMS_OUTPUT.PUT_LINE('Press 2 for All Book Request.');
DBMS_OUTPUT.PUT_LINE('Press 3 for site admin Info.');
END;
/
ACCEPT X NUMBER PROMPT "Please Enter your Choice="
DECLARE
	A NUMBER;
	zero_input EXCEPTION;
	not_found EXCEPTION;
BEGIN
	A:=&X;
	IF(A=0)THEN
		RAISE zero_input;
	ELSIF(A=1)THEN
		server.member;
	ELSIF(A=2)THEN
		server.book;
	ELSIF(A=3)THEN
		server.site_Add;
	ELSIF(A>3)THEN
		RAISE not_found;
	END IF;
EXCEPTION
	WHEN zero_input THEN
		DBMS_OUTPUT.PUT_LINE('0 Can not be a valid Input.');
	WHEN not_found THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Input.');
END;
/