select * from camping_info;

# 1. 각 지역별 캠핑장 수 출력 단, 지역은 LOCATION으로 출력
select substr(도로명주소, 1, instr(도로명주소, ' ')) as LOCATION, count(*)
from camping_info
group by substr(도로명주소, 1, instr(도로명주소, ' '));

# 2. 1번 데이터를 캠핑장 수가 많은 지역부터 출력
select substr(도로명주소, 1, instr(도로명주소, ' ')) as LOCATION, count(*)
from camping_info
group by substr(도로명주소, 1, instr(도로명주소, ' '))
order by count(*) desc;

# 3. 각 지역별 영업중인 캠핑장 수 출력
select substr(도로명주소, 1, instr(도로명주소, ' ')) as LOCATION, count(*)
from camping_info
where 상세영업상태코드=13
group by substr(도로명주소, 1, instr(도로명주소, ' '));

# 4. 3번 데이터에서 캠핑장 수가 300개 이상인 지역만 출력
select substr(도로명주소, 1, instr(도로명주소, ' ')) as LOCATION, count(*)
from camping_info
where 상세영업상태코드=13
group by substr(도로명주소, 1, instr(도로명주소, ' '))
having count(*) >= 300;

# 5. 년도별 폐업한 캠핑장 수 출력 (단, 년도는 YEAR로 출력)
select substr(폐업일자_date, 1, 4) as YEAR, count(*) as 캠핑장수
from camping_info
group by substr(폐업일자_date, 1, 4);

# 5. 5번 데이터 년도별로 내림차순
select substr(폐업일자_date, 1, 4) as YEAR, count(*) as 캠핑장수
from camping_info
where 상세영업상태코드=03
group by substr(폐업일자_date, 1, 4)
order by substr(폐업일자_date, 1, 4) desc;