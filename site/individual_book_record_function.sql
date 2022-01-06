SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION Individual_record(A IN number)
RETURN number
IS
	B number;
	flag number:=0;
	
BEGIN
	FOR I IN(Select * from book_record)LOOP
		B:=I.memberID;
		IF(B=A)THEN
			IF(flag=0)THEN
				DBMS_OUTPUT.PUT_LINE('mID'||'	'||'mName'||'	'||'BID'||'	'||'Bname'||'		'||'meet_point'||'	'||'Issue'||'		 '||'Return');
			END IF;
			flag:=1;
			DBMS_OUTPUT.PUT_LINE(I.memberID||'	'||I.member_Name||'	'||I.bookID||'	'||I.book_Name||'	'||I.meet_point||'	'||I.issue||'	'||I.Return_);
		END IF;
	END LOOP;
	return B;
END Individual_record;
/
ACCEPT X number PROMPT "Enter the member ID:"
DECLARE
	A number;
	D number;
BEGIN
	A:=&X;
	D:=Individual_record(A);

END;
/
commit;