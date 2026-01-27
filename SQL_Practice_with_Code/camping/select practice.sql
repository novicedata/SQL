select * from camping_info;
select count(*) from camping_info;

# 1. 캠핑장의 사업장명, 소재지전체주소 확인
select 사업장명 as NAME, 도로명주소 as ADDRESS from camping_info;

# 2. 1번 데이터에서 정상영업하고 있는 캠핑장
select 사업장명 as NAME, 도로명주소 as ADDRESS from camping_info where 영업상태명 like '영업/정상';

## better
select 사업장명 as NAME, 도로명주소 as ADDRESS
from camping_info
where 상세영업상태코드 = 13;

# 3. 양양에 위치한 캠핑장 몇개?
select count(*) from camping_info where 도로명주소 like '%양양%';

# 4. 3번 데이터에서 폐업한 캠핑자은 몇개?
select count(*) from camping_info where 도로명주소 like '%양양%' and 영업상태명 like '폐업';

## better
select count(*)
from camping_info
where 도로명주소 like '%양양%'
and 상세영업상태코드 = 03;

# 5. 태안에 위치한 캠핑장의 사업장명 확인
select 사업장명 from camping_info where 도로명주소 like'%태안%';

# 6. 5번 데이터에서 2020년에 폐업한 캠핑장만 확인
select 사업장명 
from camping_info 
where 도로명주소 like '%태안%' and 폐업일자 between '20191231' and '20210101';

# 7. 제주도와 서울에 위치한 캠핑장은 몇개
select count(*)
from camping_info
where 도로명주소 like '%제주%' or 도로명주소 like '%서울%';
