select * from rest_area_animal;
select * from rest_area_parking;
select * from rest_area_restroom;
select * from rest_area_score;
select * from rest_area_wifi;

# 1. 평가등급이 최우수인 휴게소의 장애인 주차장수(휴게소명, 시설구분, 장애인 주차장 수)
select a.휴게소명, a.시설구분, a.평가등급, b.장애인
from rest_area_score a
join rest_area_parking b
on a.휴게소명 = b.휴게소명
where a.평가등급 like '최우수'
order by b.장애인 desc;

## better
select s.휴게소명, s.시설구분, p.장애인
	from(
		select 휴게소명, 시설구분
        from rest_area_score
        where 평가등급 = '최우수'
    ) s join rest_area_parking p
    on s.휴게소명 = p.휴게소명;

# 2. 평가등급이 우수인 휴게소의 장애인 주차장 수 비율(휴게소명, 시설구분, 장애인 주차장 수 비율)
select a.휴게소명, a.시설구분, a.평가등급, 장애인/합계 as ratio
from rest_area_score a
join rest_area_parking b
on a.휴게소명 = b.휴게소명
where a.평가등급 like '우수'
order by ratio desc;

## better
select p.휴게소명, p.시설구분, round(s.장애인/s.합계*100, 2) as ratio
	from(
		select 휴게소명, 시설구분
        from rest_area_score
        where 평가등급 = '우수'
        ) p join rest_area_parking s
	on p.휴게소명 = s.휴게소명
order by ratio;

# 3. 휴게소 시설구분별 주차장 수 합계의 평균
select t.시설구분, avg(t.합계) as 합계의평균
from(
	select a.휴게소명, a.시설구분, b.합계
	from rest_area_score a
	join rest_area_parking b
	on a.휴게소명 = b.휴게소명
    ) t
group by t.시설구분;

## better
select a.시설구분, round(avg(b.합계))
from rest_area_score a, rest_area_parking b
where a.휴게소명 = b.휴게소명
group by a.시설구분;

# 4. 노선별 대형차를 가장 많이 주차할 수 있는 휴게소 top3
select t.노선, t.휴게소명, t.대형,
	rank() over(partition by t.노선 order by t.대형) as rnk
from(
	select a.휴게소명, b.노선, b.대형
	from rest_area_score a
	join rest_area_parking b
	on a.휴게소명=b.휴게소명
    ) t
limit 3;

### right
select t.노선, t.휴게소명, t.대형, t.rnk
from(
	select a.휴게소명, b.노선, b.대형,
		rank() over(partition by b.노선 order by b.대형) as rnk
	from rest_area_score a
	join rest_area_parking b
	on a.휴게소명=b.휴게소명
    ) t
where rnk < 4;


# 5. 본부별 소형차 가장 많이 주차할 수 있는 휴게소 top3
select t.본부, t.휴게소명, t.소형, t.rnk
from(
	select 본부, 휴게소명, 소형,
    rank() over(partition by 본부 order by 소형 desc) as rnk
    from rest_area_parking
    ) t
where t.rnk < 4;

rest_area_parking;