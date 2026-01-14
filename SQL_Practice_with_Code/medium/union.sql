# union, union al
# 집합 연산자
## join이 가로로 출력하는거라면
## union은 세로로

# union all
## 세로로 연산 시킬 수 있음
## select 할 수 있는 칼럼 수가 같아야함
## 다르면 error
select * from world_tour1
union all
select * from world_tour2;

# 칼럼 순서 바꿀 수 잇음
select cast, name from world_tour1
union all
select name, cast from world_tour2;

# alias 붙이고 싶으면 맨 위 테이블에 붙이면 됨
select cast as '출연자', name as '이름' from world_tour1
union all
select name, cast from world_tour2;

# union은 all과 다르게 중복을 제거함
select * from world_tour1
union
select * from world_tour2;

/* intersect */ # 교집합
select * from world_tour1 a
where exists (select 1 from world_tour2 b where a.cast=b.cast);

/* minus */ # 차집합
select * from world_tour1 a
where not exists (select 1 from world_tour2 b where a.cast=b.cast);