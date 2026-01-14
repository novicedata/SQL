# outer join
## left outer join(왼쪽 테이블 기준으로 오른쪽에 붙임), right outer join(오른쪽 테이블 기준으로 왼쪽에 붙임)으로 나뉨

select * from world_tour1;
select * from world_tour2;

# wt1 기준 (wt1 출연자 모두 나오고, wt2에 나오지 않은건 null)
select * from world_tour1 wt1 left outer join world_tour2 wt2 on wt1.cast=wt2.cast;

# wt2 기준 ( 반대)
select * from world_tour1 wt1 right outer join world_tour2 wt2 on wt1.cast=wt2.cast;

# outer join에 조건 적어서 inner처럼 가능
select * from world_tour1 wt1 left outer join world_tour2 wt2 on wt1.cast=wt2.cast where wt2.cast is not null;