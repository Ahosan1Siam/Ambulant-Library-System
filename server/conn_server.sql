drop database link site1;

create database link site1
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.43.246)
		 (PORT = 1626))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
commit;