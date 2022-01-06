SET SERVEROUTPUT ON;
drop package server;
create or replace package server as
	procedure member;
	procedure book;
	procedure site_Add;
end server;
/
commit;