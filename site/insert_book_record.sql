SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE TRIGGER insert_me
AFTER INSERT 
ON book_record
FOR EACH ROW
DECLARE
	A varchar2(30);
	B varchar2(30);
BEGIN
	A:=:NEW.member_Name;
	B:=:NEW.book_Name;
	DBMS_OUTPUT.PUT_LINE('User '||A||'	'||'Took Book: '||B||' '|| 'for reading.');
	
END;
/
ACCEPT X NUMBER PROMPT "Enter The member ID:"
ACCEPT Y char PROMPT "Enter the member name:"
ACCEPT Z number PROMPT "Enter the Book ID:"
ACCEPT P char PROMPT "Enter the Book name:"
ACCEPT Q char PROMPT "Enter the meet point:"
ACCEPT R char PROMPT "Enter the Issue Date:"
ACCEPT S char PROMPT "Enter the Return name:"
DECLARE
	A number;
	B varchar2(30);
	C number;
	D varchar2(30);
	E varchar2(15);
	F varchar2(6);
	G varchar2(6);
	cnt number:=0;
	M number;
	bi number;
	bm number;
BEGIN
	A:=&X;
	B:='&Y';
	C:=&Z;
	D:='&P';
	E:='&Q';
	F:='&R';
	G:='&S';
	FOR I IN(select * from book_record)LOOP
		M:=I.memberID;
		IF(M=A)THEN
			cnt:=cnt+1;
		END IF;
	END LOOP;
	IF(cnt>3)THEN
		DBMS_OUTPUT.PUT_LINE('Cannot assign new book.');
	ELSIF(cnt<3)THEN
		insert into book_record values(A,B,C,D,E,TO_DATE(F,'DDMMYY'),TO_DATE(G,'DDMMYY'));
		IF(E='stadium para')THEN
			select bid,book_amount into bi,bm from Book_list_st where bid=C;
			bm:=bm-1;
			update Book_list_st set book_amount=bm where bid=C; 
		ELSIF(E='ghop road')THEN
			select bid,book_amount into bi,bm from Book_list_gp where bid=C;
			bm:=bm-1;
			update Book_list_gp set book_amount=bm where bid=C; 
		END IF;
	END IF;	
END;
/
commit;