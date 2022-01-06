SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop package body server;
create or replace package body server as
	procedure member
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Name'||'	'||'Address'||'		          '||'Site'||'      	'||'Status');
		For I IN(select * from Total_Member_List) LOOP
			DBMS_OUTPUT.PUT_LINE(I.ID||'	'||I.Name||'	'||I.Address||'	    	'||I.site||'		'||I.Status);
		END LOOP;	
	end member;
	procedure book
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('BookID'||'	'||'Name'||'		'||'Wirtter Name'||'	'||'Demand'||'		'||'Site'||'	'||'checkpoint'||'	'||'Status');
		For J IN(select * from All_Book_request) LOOP
			DBMS_OUTPUT.PUT_LINE(J.Book_ID||'	'||J.Name||'	'||J.Wirtter_name||'	'||J.Demand||'		'||J.Site||'	'||J.Checkpoint||'	'||J.Status);
		END LOOP;	
	end book;
	procedure site_Add
		IS
	begin
		DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Name'||'		'||'Site'||'		'||'Address');
		For k IN(select * from All_site_admin) LOOP
			DBMS_OUTPUT.PUT_LINE(K.ID||'	'||K.Name||'	'||K.Site||'		'||K.Address);
		END LOOP;	
	end site_Add;
end server;
/
commit;