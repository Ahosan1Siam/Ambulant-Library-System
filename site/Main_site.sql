SET SERVEROUTPUT ON;
SET VERIFY OFF;
BEGIN
DBMS_OUTPUT.PUT_LINE('Press 1 for member list.');
DBMS_OUTPUT.PUT_LINE('Press 2 for book list.');
DBMS_OUTPUT.PUT_LINE('Press 3 for Book Record.');
DBMS_OUTPUT.PUT_LINE('Press 4 for  book_request.');
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
		site.mem_list;
	ELSIF(A=2)THEN
		site.b_list;
	ELSIF(A=3)THEN
		site.b_record;
	ELSIF(A=4)THEN
		site.book_re;
	ELSIF(A>4)THEN
		RAISE not_found;
	END IF;
EXCEPTION
	WHEN zero_input THEN
		DBMS_OUTPUT.PUT_LINE('0 Can not be a valid Input.');
	WHEN not_found THEN
		DBMS_OUTPUT.PUT_LINE('ID NOT FOUND.');
END;
/