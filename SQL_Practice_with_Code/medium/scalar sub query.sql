# 서브쿼리
## 메인 쿼리 안에 내포되어 있는 또 다른 쿼리(여러개일 수도 있음)
## 그중에서도 스칼라 서브쿼리란, 칼럼 대신에 대입해서 쓸 수 있음
## 주로 select 절에 대입해서 사용
## return은 한개만 나오게 해야함

create table customers (
    id   varchar(20),
    name   varchar(10),
    grade_code  integer
);

insert into customers values ('angel1004','소요정',1);
insert into customers values ('soso94','나적당',2);
insert into customers values ('nobuy20','안사요',3);

create table grade_info (
	code integer,
    name varchar(10)
);

insert into grade_info values(1, 'VIP');
insert into grade_info values(2, 'GOLD');
insert into grade_info values(3, 'SILVER');

commit;

# 서브 쿼리 (연관 서브커리)
select a.id, a.name,
	(select b.name from grade_info b where b.code=a.grade_code) as grade
from customers a;

# 서브 쿼리 (비연관 서브커리)
select a.id, a.name,
	(select b.name from grade_info b where b.code = 1) as grade
from customers a;

# NULL이면? 출력은 된다
select a.id, a.name,
	(select b.name from grade_info b where b.code = 4) as grade
from customers a;

# 쿼리를 outer joing으로 바꿔보자
select a.id, a.name, b.name
	from customers a left outer join grade_info b
    on b.code = a.grade_code;
    
# 여러개 서브쿼리
## 당연히 성능상 좋지 않음
select a.id, a.name,
	(select b.name from grade_info b where b.code=1) as grade1,
    (select b.name from grade_info b where b.code=2) as grade2,
    (select b.name from grade_info b where b.code=3) as grade3
from customers a;