select * from weather;
select * from store_order;
select * from price_info;

# 1. 비가 왔던 날만 출력
select * from weather
where 일강수량 > 0;

# 2. 최고기온이 30도 이상이었던 날의 아이스음료 팬매수 출력
select a.일시, a.최고기온, b.아이스음료
from weather a
join store_order b
on a.일시 = b.일자
where a.최고기온 >= 30;

# 3. 최저기온이 20도 미만이었던 날의 건강음료 판매수 출력
select a.일시, a.최저기온, b.건강음료
from weather a
join store_order b
on a.일시 = b.일자
where a.최고기온 < 20;

# 4. 비가 왔던 날의 숙취해소음료 판매수 출력
select a.일시, a.일강수량, b.숙취해소음료
from weather a
join store_order b
on a.일시 = b.일자
where a.일강수량 > 0;

# 5. 4번 데이터에 매출 데이터 추가
select a.일시, a.일강수량, 
	b.숙취해소음료*(select price from price_info where product='숙취해소음료') as 매출
from weather a
join store_order b
on a.일시 = b.일자
where a.일강수량 > 0;