 create table book_list (
	book_no varchar(16) not null, #null 있으면 오류나게
    book_name varchar(50),
    writer varchar(50),
    publisher varchar(30),
    reg_date date,
    price int
);

select * from book_list;

insert into book_list values 
('9791168373690', '세노이의 가르침', '세노이', '데이원', '20230302', 7200);

drop table book_list;