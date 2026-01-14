create table book_list; create table book_list (
	book_no varchar(16) not null, #null 있으면 오류나게
    book_name varchar(50),
    writer varchar(50),
    publisher varchar(30),
    reg_date date,
    price int
);

select * from book_list;

insert into book_list values ('1', '매리골드 마음 세탁소', '윤정은', '북로망스', '20230306', 15000);
insert into book_list values ('2', '세이노의 가르침', '세이노', '데이원', '20230302', '19900'); # int로 설정한 곳에 따옴표 쓸 수 있다(알아서 제거해줌). 그렇지만 일을 두번해야하니..

insert into book_list (book_no, book_name, writer, publisher, price)
values ('3', '도둑맞은 집중력', '요한하리', '어크로스', 18800); # 원하는 열에만 넣고 나머지는 NULL

# !! 데이터를 다루고 업로드 하기 위해서는 무조건 커밋을 해줘야 한다!! 

commit; # 이래야 다른 쿼리에서도 가져와 사용이 가능

rollback; # 롤백가능