# inner join
## 테이블 공통 부분만 가져올 수 있음

# world tour1, world tour2 커밋한후
select * from world_tour1;
select * from world_tour2;

# 동시에 출연한 사람만 뽑아옴
select * from world_tour1 inner join world_tour2 on world_tour1.cast = world_tour2.cast;

# 매번 테이블 이름 쓰기 힘드니까 이름 지정해주기
select * from world_tour1 wt1 inner join world_tour2 wt2 on wt1.cast = wt2.cast;

# inner join 안쓰고 컴마로도 가능
select wt1.cast from world_tour1 wt1, world_tour2 wt2 where wt1.cast=wt2.cast;

# 조건절 포함 and로 연결해서 사용가능
select wt1.name from world_tour1 wt1, world_tour2 wt2 where wt1.cast=wt2.cast and wt1.cast <> '기안84';