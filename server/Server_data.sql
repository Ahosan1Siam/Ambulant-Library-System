clear screen;

drop table member_list cascade constraints;
drop table Site_admin cascade constraints;
drop table Book_request cascade constraints;

create table member_list(
meID number,
meName varchar2(30),
meAddress varchar2(50),
site_name varchar2(10),
meStatus varchar(10),
		PRIMARY KEY(meID)
);
create table book_request(
bid number,
bname varchar2(30),
bwname varchar2(30),
bdeamnd number,
site_name varchar2(10),
meetup_point varchar2(15),
status varchar2(10)
);
create table Site_admin(
Admin_ID number,
name varchar2(30),
site_name varchar2(15),
Address varchar2(30),
		PRIMARY KEY(Admin_ID)
);

--total member_list
insert into member_list values(20,'Aftab','Banani RR','Dhaka','active');
insert into member_list values(21,'Amit','Gulsan RR','Dhaka','active');
insert into member_list values(22,'Alpha','Baily Road','Dhaka','TEMPORARY');
insert into member_list values(23,'Gama','mohanagar RR','Dhaka','active');
insert into member_list values(24,'Beta','Hatirjhill','Dhaka','TEMPORARY');
--site_admin
insert into Site_admin values(3,'Naruto GG','Dhaka','Bangladesh');
insert into Site_admin values(4,'Suske UCH','Dhaka','Bangladesh');
--Book request
insert into book_request values(32,'One Piece','Eiichiro Oda',4,'Dhaka','Hatirjhill','Not Filled');
insert into book_request values(33,'Black Clover','TABATA Yuki',5,'Dhaka','Baily Road','Not Filled');
commit;