SET SERVEROUTPUT ON;
SET VERIFY OFF;
--CREATE OR REPLACE TRIGGER message_st 
--AFTER INSERT OR UPDATE
--ON Book_list_st@site1
--FOR EACH ROW
--DECLARE
	--A number;
	--B number;
	--S number:=0;
--BEGIN
	--A:=:OLD.book_amount;
	--B:=:NEW.book_amount;
	--S:=B-A;
	--DBMS_OUTPUT.PUT_LINE(S|| 'New Books added.');
--END;
--/
--CREATE OR REPLACE TRIGGER message_gp 
--AFTER INSERT OR UPDATE
--ON Book_list_gp@site1
--FOR EACH ROW
--DECLARE
	--A number;
	--B number;
	--S number:=0;
--BEGIN
	--A:=:OLD.book_amount;
	--B:=:NEW.book_amount;
	--S:=B-A;
	--DBMS_OUTPUT.PUT_LINE(S|| 'New Books added.');	
--END;
--/
--DBMS_OUTPUT.PUT_LINE('Please give the following information:');
ACCEPT A number PROMPT "Enter the Book ID number:"
ACCEPT B CHAR  PROMPT "Enter the Book Name:"
ACCEPT C CHAR  PROMPT "Enter the Book Writter Name:"
ACCEPT D number  PROMPT "Enter the Book amount:"
ACCEPT E CHAR  PROMPT "Enter the Site Name:"
ACCEPT F CHAR  PROMPT "Enter the Meet Point:"
DECLARE
	G number;
	H varchar2(30);
	I varchar2(30);
	J number;
	K varchar2(10);
	L varchar2(15);
	M number;
	N number:=0;
	O varchar2(30);
	P varchar2(30);
	Flag number:=0;
BEGIN
	G:=&A;
	H:='&B';
	I:='&C';
	J:=&D;
	K:='&E';
	L:='&F';
	--DBMS_OUTPUT.PUT_LINE(G||'	'||H||'	'||I||'		'||J||'		'||K||'		'||L);
	IF (L='stadium para')THEN
		FOR X IN(select bid,book_amount from Book_list_st@site1)LOOP
			M:=X.bid;
			N:=X.book_amount;
			IF(M=G)THEN
				Flag:=1;
				N:=N+J;
				update Book_list_st@site1 set book_amount=N where bid=G;
				update book_request@site1 set Status='Filled' where bid=G;
			END IF;
		END LOOP;
		IF(Flag=0) THEN
			insert into Book_list_st@site1 values(G,H,I,J);
			FOR X IN(select bid from book_request@site1)LOOP
				M:=X.bid;
				update book_request@site1 set Status='Filled' where bid=G;
			END LOOP;
		END IF;
	ELSIF (L='ghop road')THEN
		FOR X IN(select bid,book_amount from Book_list_gp@site1)LOOP
			M:=X.bid;
			N:=X.book_amount;
			IF(M=G)THEN
				Flag:=1;
				N:=N+J;
				update Book_list_gp@site1 set book_amount=N where bid=G;
				update book_request@site1 set Status='Filled' where bid=G;
			END IF;
		END LOOP;
		IF(Flag=0) THEN
			insert into Book_list_gp@site1 values(G,H,I,J);
			FOR X IN(select bid from book_request@site1)LOOP
				M:=X.bid;
				update book_request@site1 set Status='Filled' where bid=G;
			END LOOP;
		END IF;
	END IF;
END;
/
commit;
