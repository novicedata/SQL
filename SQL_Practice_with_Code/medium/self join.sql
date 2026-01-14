# self join
## 자기자신과의 join
## 하나의 테이블 자체가 hierarchy일 때

# high kick 커밋한후
select * from high_kick;

# a가 자식, b가 부모님 계층 구조
select * from high_kick a left outer join high_kick b on a.id = b.parent_id;

# 보기 편하게
select a.id, a.name, a.role, b.id, b.name, b.role, c.role, c.id, c.name
from high_kick a
left outer join high_kick b
on a.id=b.parent_id
left outer join high_kick c
on b.id = c.parent_id
where a.parent_id is null;

# cross join
## 각 테이블 row별 반복 적합
select * from world_tour1 wt1 cross join world_tour2 wt2;