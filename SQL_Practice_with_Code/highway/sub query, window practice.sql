select * from rest_area_animal;
select * from rest_area_parking;
select * from rest_area_restroom;
select * from rest_area_score;
select * from rest_area_wifi;

# 1. 노선별 남자 변기수, 여자 변기수 최대값 출력
select 노선, max(남자_변기수), max(여자_변기수)
from rest_area_restroom
group by 노선;

# 2. 휴게소 중 total 변기수가 가장 많은 휴게소 어딘가
select 시설명, 남자_변기수 + 여자_변기수 as 총변기수
from rest_area_restroom
order by 총변기수 desc limit 1;

# 3. 노선별 남자 변기, 여자 변기수 편균 출력
select 노선, round(avg(남자_변기수)), round(avg(여자_변기수))
from rest_area_restroom
group by 노선;

# 4. 노선별 total 변기수가 가장 많은 곳 출력
select 노선, 남자_변기수 + 여자_변기수 as 총변기수,
rank() over(partition by 노선 order by 남자_변기수 + 여자_변기수 desc) as rnk
from rest_area_restroom
limit 1;

# 5. 노선별 남자 변기수가 더 많은 곳, 여자 변기수가 더 많은곳, 동일한 곳의 count를 각가 구하여 출력
select t.노선, t.남, t.여, t.동일
	from (
		select 노선,
			(select count(*) from rest_area_restroom where 남자_변기수 > 여자_변기수) as 남,
			(select count(*) from rest_area_restroom where 남자_변기수 < 여자_변기수) as 여,
			(select count(*) from rest_area_restroom where 남자_변기수 = 여자_변기수) as 동일
		from rest_area_restroom
        group by 노선
        ) t
group by t.노선;

## right method
select 노선,
	count(case when 남자_변기수 > 여자_변기수 then 1 end) as male,
    count(case when 남자_변기수 < 여자_변기수 then 1 end) as female,
    count(case when 남자_변기수 = 여자_변기수 then 1 end) as equal
from rest_area_restroom
group by 노선;