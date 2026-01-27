select * from camping_info;

# 1. 해수욕장에 위치한 캠핑장의 사업장명과 인허가일자
select 사업장명, 인허가일자 from camping_info where 사업장명 like '%해수욕장%';

# 2. 제주도 해수욕장에 위치한 캠핑장 소재지전체주소와 사업장명
select 사업장명, 도로명주소 from camping_info 
where 도로명주소 like '%제주%'
and 사업장명 like '%해수욕장%';

# 3. 2번에서 인허가 일자가 가장 최근인 곳의 인허가일자 
select 인허가일자 from camping_info
where 도로명주소 like '%제주%'
and 사업장명 like '%해수욕장%'
order by 인허가일자 desc
limit 1;

## better
select max(인허가일자) from camping_info
where 도로명주소 like '%제주%'
and 사업장명 like '%해수욕장%';

# 4. 강원도 해수욕장에 위치한 캠핑장 중 폐업한 곳
select * from camping_info
where 도로명주소 like '%강원%'
and 사업장명 like '%해수욕장%'
and 영업상태코드 = '03';

# 5. 4번에서 인허가일자가 가장 오래된 곳의 인허가일자
select min(인허가일자) from camping_info
where 도로명주소 like '%강원%'
and 사업장명 like '%해수욕장%'
and 영업상태코드 = '03';

# 6. 해수욕장에 위치한 캠핑장 중 시설 면적이 가장 넒은 곳의 시설면적
select max(cast(nullif(시설면적, '') as unsigned)) as 시설면적
from camping_info
where 사업장명 like '%해수욕장%';

# 7. 해수욕장에 위치한 캠핑장의 평균 시설면적
select avg(cast(nullif(시설면적, '') as unsigned)) as 시설면적평균
from camping_info
where 사업장명 like '%해수욕장%';