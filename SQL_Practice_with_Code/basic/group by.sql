# group by 구문
# animal 데이터 commit한 후

select * from animal_info;

# gourping 칼럼이 아닌 것들은 select가 안되기 때문에 오류가 나는 경우가 많음
select animal, count(*) from animal_info group by animal;
select animal, max(age) from animal_info group by animal;
select animal, max(age), avg(age) from animal_info group by animal;

select age, count(*) from animal_info group by age order by age;

# gourp 기준 2개
select animal, type, count(*) from animal_info group by animal, type order by animal;
select animal, type, count(*) from animal_info where animal = '강아지' group by animal, type; # 강아지만
select animal, type, avg(age) from animal_info group by animal, type; #평균 나이
select animal, type, min(age), max(age) from animal_info group by animal, type order by animal;