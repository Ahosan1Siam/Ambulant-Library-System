clear screen;
--st=> stadium para
--gp=> ghop
drop table Book_list_st cascade constraints;
drop table Book_list_gp cascade constraints;
drop table member_list_st cascade constraints;
drop table member_list_gp cascade constraints;
drop table book_request cascade constraints;
drop table Site_admin cascade constraints;
drop table book_record cascade constraints;

create table Book_list_st(
bid number,
bname varchar2(30),
bwname varchar2(30),
book_amount number,
		PRIMARY KEY(bid)
);

create table Book_list_gp(
bid number,
bname varchar2(30),
bwame varchar2(30),
book_amount number,
		PRIMARY KEY(bid)
);
create table member_list_st(
meID number,
meName varchar2(30),
meAddress varchar2(50),
site_name varchar2(10),
meStatus varchar(10),
		PRIMARY KEY(meID)
);
create table member_list_gp(
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
create table book_record(
memberID number,
member_Name varchar2(30),
bookID number,
book_Name varchar2(30),
meet_point varchar2(15),
issue Date,
Return_ Date
);

--Book_list_st(stadium para)
insert into Book_list_st values(1,'3.15 A.M.','Nick Pirog',4);
insert into Book_list_st values(2,'Shonkhonil','Humayun Ahmed',2);
insert into Book_list_st values(3,'Alir Choshma','Humayun Ahmed',3);
insert into Book_list_st values(4,'Holud Himu','Humayun Ahmed',1);
insert into Book_list_st values(5,'Chromium Oronno','Zafar Iqbal',5);
insert into Book_list_st values(6,'Dipu nambara tu','Zafar Iqbal',6);
insert into Book_list_st values(7,'Amar kosto 2','Zafar Iqbal',1);
--Book_list_gp(ghop)
insert into Book_list_gp values(8,'Jol batash','Rakin Islam',2);
insert into Book_list_gp values(9,'hauai mithai','Robin Islam',3);
insert into Book_list_gp values(10,'Jol kaman','Atif aslam',4);
insert into Book_list_gp values(11,'mohiner hat','sifat Islam',5);
insert into Book_list_gp values(12,'3.10 A.M.','Nick Pirog',7);
insert into Book_list_gp values(13,'3.45 A.M.','Nick Pirog',3);
insert into Book_list_gp values(14,'3.55 A.M.','Nick Pirog',2);
insert into Book_list_gp values(15,'3.20 A.M.','Nick Pirog',1);
--member_list_st(stadium para)
insert into member_list_st values(1,'Siam','stadium para','Jessore','active');
insert into member_list_st values(2,'Impa','karim road','Jessore','active');
insert into member_list_st values(3,'Sakib','abdul alim road','Jessore','TEMPORARY');
insert into member_list_st values(4,'Shuvo','apon mor','Jessore','active');
insert into member_list_st values(5,'Tamim','apon mor','Jessore','TEMPORARY');
--member_list_gp(ghop)
insert into member_list_gp values(11,'Robin','ghop road','Jessore','active');
insert into member_list_gp values(12,'Amit','central road','Jessore','active');
insert into member_list_gp values(13,'Ador','borad office','Jessore','TEMPORARY');
insert into member_list_gp values(14,'Rakin','new market','Jessore','active');
insert into member_list_gp values(15,'Raju','ghop road','Jessore','TEMPORARY');
--book_request
insert into book_request values(12,'3:10 A.M.','Nick Pirog',4,'Jessore','stadium para','Not Filled');
insert into book_request values(11,'mohiner hat','sifat Islam',5,'Jessore','ghop road','Not Filled');
--site_admin
insert into Site_admin values(1,'Itadori Youji','Jessore','Bangladesh');
insert into Site_admin values(2,'Fushiguro','Jessore','Bangladesh');
--commit;
--book_reocrd
insert into book_record values(1,'Siam',5,'Chromium Oronno','stadium para',TO_DATE('010720','DDMMYY'),TO_DATE('070720','DDMMYY'));
insert into book_record values(2,'IMPA',6,'Dipu nambara tu','stadium para',TO_DATE('010820','DDMMYY'),TO_DATE('070820','DDMMYY'));
insert into book_record values(11,'Robin',11,'mohiner hati','ghop road',TO_DATE('010920','DDMMYY'),TO_DATE('070920','DDMMYY'));
insert into book_record values(11,'Robin',7,'Amar kosto 2','ghop road',TO_DATE('010920','DDMMYY'),TO_DATE('070920','DDMMYY'));
insert into book_record values(2,'IMPA',7,'Amar kosto 2','stadium para',TO_DATE('010820','DDMMYY'),TO_DATE('070820','DDMMYY'));
commit;



