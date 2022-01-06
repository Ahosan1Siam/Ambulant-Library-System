SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE TRIGGER insert_message 
AFTER INSERT 
ON book_request
FOR EACH ROW
DECLARE
	A number;
	B varchar2(30);
BEGIN
	A:=:NEW.bid;
	B:=:NEW.bname;
	DBMS_OUTPUT.PUT_LINE('New Book Added to book request.Book ID:'||A||'		'||'Book Name:'||B);
	
END;
/
CREATE OR REPLACE TRIGGER update_message 
AFTER UPDATE 
ON book_request
FOR EACH ROW
DECLARE
	A number;
	B varchar2(30);
BEGIN
	A:=:NEW.bid;
	B:=:NEW.bname;
	DBMS_OUTPUT.PUT_LINE('New amount added for Book ID:'||A||'		'||'Book Name:'||B);
	
END;
/
ACCEPT X number PROMPT "Enter the Book ID:"
ACCEPT Y char PROMPT "Enter the Book name:"
ACCEPT Z char PROMPT "Enter the Wirter Name:"
ACCEPT P number PROMPT "Enter the Demand:"
ACCEPT Q char PROMPT "Enter the Site name:"
ACCEPT R char PROMPT "Enter the meet point:"
DECLARE
	G number;
	H varchar2(30);
	I varchar2(30);
	J number;
	K varchar2(10);
	L varchar2(15);
	N number;
	O number:=0;
	flag number:=0;
BEGIN
	G:=&X;
	H:='&Y';
	I:='&Z';
	J:=&P;
	K:='&Q';
	L:='&R';
	FOR M IN(select bid,bdeamnd from book_request)LOOP
		N:=M.bid;
		O:=M.bdeamnd;
		IF(N=G)THEN
			flag:=1;
			O:=O+J;
			update book_request set bdeamnd=O where bid=G;
		END IF;
	END LOOP;
	IF(Flag=0) THEN
		insert into book_request values(G,H,I,J,K,L,'Not Filled');
	END IF;
END;
/
commit;