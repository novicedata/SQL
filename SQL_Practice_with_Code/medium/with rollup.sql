# with rollup
## 데이터 집계 (소계, 합계)

select * from animal_info;

select animal, count(*) from animal_info group by animal;

# rollup하면?
select animal, count(*) from animal_info group by animal with rollup;

# 기준 추가하면?
select animal, type, count(*) from animal_info group by animal, type with rollup order by animal desc;

# null에 값 추가
select case when animal is null then 'total' else animal end as animal,
	   case when type is null then 'total' else type end as type,
       count(*)
	from animal_info
group by animal, type with rollup;

# 다른기준으로 해보자
select animal, age, count(*)
from animal_info
group by animal, age with rollup;

# rollup 사용할때 그룹바이절 순서가 중요
select age, animal, count(*)
from animal_info
group by age, animal with rollup;