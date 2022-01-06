drop database link site3;


create database link site3
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.43.85)
		 (PORT = 1626))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  