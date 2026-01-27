select * from weather;

update weather set 일강수량 = 0 where 일강수량 = '';
alter table weather modify column 일강수량 int;
commit;

select * from store_order;

# 1. 월별 커피음료 총 판매수
select substring(일자, 1, 7) as month,
	sum(커피음료_페트), sum(커피음료_병), sum(커피음료_중캔), sum(커피음료_소캔)
from store_order
group by substring(일자, 1, 7);

# 2. 1번 데이터에서 가장 많이 팔린 음료는 몇개인지 풀력
select substring(일자, 1, 7) as month,
	greatest(sum(커피음료_페트), sum(커피음료_병), sum(커피음료_중캔), sum(커피음료_소캔))
from store_order
group by substring(일자, 1, 7);

# 3. 1번 데이터에서 커피음표 페트 데이터를 pivot
select '커피음료_페트' as product,
	sum(case when substring(일자, 1, 7)='2020-07' then 커피음료_페트 end) as '2020-07',
    sum(case when substring(일자, 1, 7)='2020-08' then 커피음료_페트 end) as '2020-08',
    sum(case when substring(일자, 1, 7)='2020-09' then 커피음료_페트 end) as '2020-09',
    sum(case when substring(일자, 1, 7)='2020-10' then 커피음료_페트 end) as '2020-10'
from store_order;

# 4. 월별 탄산수와 생수의 평균 판매수 출력
select substring(일자, 1, 7) as month,
	floor(avg(탄산수)),  floor(avg(생수))
from store_order
group by month;

# 5. 월별 비타민워터, 에너지음료, 건강음료 최대 판매수
select substring(일자, 1, 7) as month,
	max(비타민워터), max(에너지음료), max(건강음료)
from store_order
group by month;