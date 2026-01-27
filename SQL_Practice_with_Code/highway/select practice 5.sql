select * from rest_area_animal; #(휴게소명, 종류, 위치, 운영시간, 휴장일, 설치연도, 비고)
select * from rest_area_parking;
select * from rest_area_restroom;
select * from rest_area_score;
select * from rest_area_wifi; #(본부, 휴게소명, 가능여부[O,X])

# 1. 반려동물 놀이터가 있는 휴게소 중 wifi 사용 가능한 곳
select a.휴게소명, b.가능여부
from rest_area_animal a, rest_area_wifi b
where b.가능여부 = 'O'
and a.휴게소명 = b.휴게소명;

# 2. 반려동물 놀이터가 있는 휴게소 중 운영 시간이 24시간 인곳이 몇군데인가
select count(*)
from rest_area_animal a, rest_area_score b
where a.운영시간 ='24시간'
and a.휴게소명 = b.휴게소명;

# 3. 본부별 wifi 사용가능한 휴게소 몇군데 인지
select 본부, count(*)
from rest_area_wifi
where 가능여부 = 'O'
group by 본부;

# 4. 3번 데이터를 휴게소가 많은 손서대로 정렬
select 본부, count(*) as count
from rest_area_wifi
where 가능여부 = 'O'
group by 본부
order by count desc;

# 5. 4번 데이터에서 휴게소가 25보다 많은 곳 출력
select 본부, count(*) as count
from rest_area_wifi
where 가능여부 = 'O'
group by 본부
having count > 25
order by count desc;