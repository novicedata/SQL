select * from weather;
select * from store_order;
select * from price_info;

# 1. 가장 비싼 음료 top5
select * from price_info
order by price desc
limit 5;

# 2. 월별 커피음료 매출 구하기
select substring(일자, 1, 7) as month,
	sum(커피음료_페트)*(select price from price_info where product = '커피음료_페트') as '커피음료_페트',
    sum(커피음료_병)*(select price from price_info where product = '커피음료_병') as '커피음료_페트',
    sum(커피음료_중캔)*(select price from price_info where product = '커피음료_중캔') as '커피음료_중캔',
    sum(커피음료_소캔)*(select price from price_info where product = '커피음료_소캔') as '커피음료_소캔'
from store_order
group by month;

# 3. 10월 3일의 주스 매출 구하기
select 주스_대페트*(select price from price_info where product = '주스_대페트') as '주스_대페트',
		주스_중페트*(select price from price_info where product = '주스_중페트') as '주스_중페트',
        주스_캔*(select price from price_info where product = '주스_캔') as '주스_캔'
from store_order
where 일자 = '2020-10-03';

# 4. 8월의 이온음료 매출 구하기
select sum(이온음료_대페트*(select price from price_info where product ='이온음료_대페트')) as '이온음료_대페트',
		sum(이온음료_중페트*(select price from price_info where product ='이온음료_중페트')) as '이온음료_중페트',
		sum(이온음료_캔*(select price from price_info where product ='이온음료_캔')) as '이온음료_캔'
from store_order
where substring(일자, 6, 2) = '08';

# 5. 9월의 차음료 판매수와 매출 구하기
select sum(차음료) as 차음료판매수,
	sum(차음료*(select price from price_info where product = '차음료')) as 차음료매출
from store_order
where 일자 like '2020-09%';