select * from camping_info;

# 1. 캠핑장의 사업장명과 시설면적을 시설면적이 가장 넓은 순으로
select 사업장명, cast(nullif(시설면적, '') as unsigned) as 시설면적
from camping_info
order by 시설면적 desc;

# 2. 1번 데이터에서 1위~10위까지만 출력
select 사업장명, cast(nullif(시설면적, '') as unsigned) as 시설면적
from camping_info
order by 시설면적 desc
limit 10;

### 시설면적을 int인 시설면적_num으로
alter table camping_info add column 시설면적_num decimal(12,2);
update camping_info
set 시설면적_num = cast(시설면적 as decimal(12,2))
where trim(시설면적) regexp '^[0-9]+(\\.[0-9]+)?$';
show columns from camping_info like '시설면적_num';
alter table camping_info modify column 시설면적_num int;
commit;

# 3. 경기도 캠핑장 중에서 면적이 가장 넓은 순으로 5개 출력
select 사업장명, 시설면적_num from camping_info
where 도로명주소 like '%경기도%'
order by 시설면적_num desc
limit 5;

# 4. 3번 데이터에서 1위 제외
select 사업장명, 시설면적_num from camping_info
where 도로명주소 like '%경기도%'
order by 시설면적_num desc
limit 1,4;

# 5. 영업중인 캠핑장 중에서 인허가일자가 가장 오래된 순으로 20개 출력
select 사업장명, 인허가일자 from camping_info
where 상세영업상태코드 = 13
order by 인허가일자 asc
limit 20;

# 6. 2020년 10월 ~ 2021년 3월 사이에 폐업한 캠핑장의 사업장명, 주소
### 폐업일자 date화
alter table camping_info add column 폐업일자_date DATE;
update camping_info
set 폐업일자_date = str_to_date(폐업일자, '%Y-%m-%d')
where 폐업일자 regexp '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
commit;

select 사업장명, 도로명주소, 폐업일자 from camping_info
where 폐업일자_date between '2020-10-01' and '2021-03-31';

# 7. 폐업한 캠핑장 중에서 시설면적이 가장 컸던 곳의 사업장명, 시설면적
select 사업장명, 시설면적, 영업상태명
from camping_info
where 상세영업상태코드=03
order by 시설면적_num desc
limit 1;