SET SERVEROUTPUT ON;
SET VERIFY OFF;
drop package body site;
create or replace package body site as
	procedure mem_list
	IS
	begin
		DBMS_OUTPUT.PUT_LINE('Member List from stadium para:');
		DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Name'||'	'||'Address'||'		     	'||'Site'||'     '||'Status');
		For I IN(select * from member_list_st) LOOP
			DBMS_OUTPUT.PUT_LINE(I.meID||'	'||I.meName||'	'||I.meAddress||'	    	'||I.site_name||'	'||I.meStatus);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('Member List from Ghop:');
		DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Name'||'	'||'Address'||'		        '||'Site'||'    '||'Status');
		For J IN(select * from member_list_gp) LOOP
			DBMS_OUTPUT.PUT_LINE(J.meID||'	'||J.meName||'	'||J.meAddress||'	    	'||J.site_name||'	'||J.meStatus);
		END LOOP;
	end mem_list;
	procedure b_list
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('Book List from stadium para:');
		DBMS_OUTPUT.PUT_LINE('Book ID'||'	'||'Book Name'||'		'||'wirtter Name'||'	'||'Amount');
		For K IN(select * from Book_list_st)LOOP
			DBMS_OUTPUT.PUT_LINE(K.bid||'	'||K.bname||'		'||K.bwname||'	    '||K.book_amount);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('Book List from Ghop:');
		DBMS_OUTPUT.PUT_LINE('Book ID'||'	'||'Book Name'||'		'||'wirtter Name'||'	'||'Amount');
		For L IN(select * from Book_list_gp)LOOP
			DBMS_OUTPUT.PUT_LINE(L.bid||'	'||L.bname||'	        '||L.bwame||'	  '||L.book_amount);
		END LOOP;
	end b_list;
	procedure b_record
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('Total Book Record:');
		DBMS_OUTPUT.PUT_LINE('MID'||'	'||'MName'||'		'||'BID'||'		'||'Book Name'||'	'||'MeetPoint'||'		'||'Issue'||'		'||'Retrun');
		FOR I IN(select * from book_record)LOOP
			DBMS_OUTPUT.PUT_LINE(I.memberID||'	'||I.member_Name||'		'||I.bookID||'		'||I.book_Name||'	'||I.meet_point||'		'||I.issue||'	'||I.Return_);
		END LOOP;
	end b_record;
	procedure book_re
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('BID'||'	'||'BName'||'	 	'||'Status');
		FOR I IN(select * from book_request)LOOP
			DBMS_OUTPUT.PUT_LINE(I.bid||'	'||I.bname||' 	'||I.status);
		END LOOP;
	end book_re;
end site;
/
commit;