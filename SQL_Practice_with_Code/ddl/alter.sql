select * from book_list;

alter table book_list add column description varchar(1000); # 칼럼 추가alter

alter table book_list modify column book_name varchar(100); # 속성 변경

desc book_list; # 상세창

alter table book_list change column description book_desc varchar(100); # 이름까지 변경

alter table book_list drop column book_desc; # 열 드랍

alter table book_list rename book_info; # 테이블 명 변경

select * from book_info;

# 툴을 이용해서도 가능. 옆 스키마에서 테이블에 Alter table 통해 가능

