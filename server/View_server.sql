Drop view Total_Member_List;
Drop view All_Book_request;
Drop view All_site_admin;
create or replace view Total_Member_List(ID, Name, Address, Site, Status) as
select * from member_list
union 
select * from member_list_st@site1
union
select * from member_list_gp@site1;
create or replace view All_Book_request(Book_ID,Name, Wirtter_name, Demand,Site,Checkpoint,status)as
select * from book_request
union 
select * from book_request@site1;
create or replace view All_site_admin(ID, Name, Site,Address)as
select * from site_admin
union 
select * from site_admin@site1;
commit;