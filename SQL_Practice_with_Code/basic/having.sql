# having 구문
# group by절 다음에 위치하게 됨..

# 순서
# select 
# from
# where
# group by
# having
# order by 

# 아래는 에러가남, having절 써야함
## 집계 건수가 아닌것은 그냥 where 써도됨
select animal, type, count(*) from animal_info where count(*) > 2 group by animal, type;

select animal, type, count(*) from animal_info group by animal, type having count(*) > 2;

# 아래 처럼 해도도 되는데, animal = '고양이'는 순서상 where을 써야함
## where가 having보다 먼저 시행되기 떄문에
select animal, type, count(*)
from animal_info
group by animal, type
having count(*) > 2 and animal = '고양이'
order by count(*) desc;

select animal, type, count(*)
from animal_info
where animal = '고양이'
group by animal, type
having count(*) > 2
order by count(*) desc;


# where에서 먼저 걸러내야 데이터 크기가 큰 경우에 더욱 효율적으로 진행할 수 있음

select animal, type, max(age)
from animal_info
group by animal, type
having max(age) > 10;