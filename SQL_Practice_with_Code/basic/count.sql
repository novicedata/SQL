# 집계 함수 (count, sum, average, min, max etc)

# count
select count(*) from melon_chart; # 전체건수
select count(*) from melon_chart where singer in ('박재정');

# 연습용 데이터 생성
create table function_test (
  col1   int,
  col2   int
);

insert into function_test values (10,null);
insert into function_test values (20,30);

select * from function_test;
select count(*), count(1), count(col1), count(col2) from function_test;
# null은 세지 못함.
# 첫번째는 전체 row개수니까 2, 두번째는 row1이니까 2, 세번째는 col1이니까 2, 네번째는 col2니까 null빼고 1
commit;

# sum
select sum(col1), sum(col2) from function_test;

# average
select avg(col1), avg(col2) from function_test; # NULL은 없는 취급이라 n수에 포함 안됨

# min, max
select min(col1), min(col2) from function_test; # 최소
select max(col1), max(col2) from function_test; # 최대

# where와 함꼐 사용 가능
select count(*) from melon_chart where like_no > 100000;