# 중첩 서브쿼리
## where, having 절과 같은 조건절에서 쓸 수 있는 서브쿼리
## 조건 부여, main table과 비교하는데 사용

select * from idol_member a
where a.group_name = (select b.group_name
						from idol_group b
                        where b.debut >= '2022-01-01');
					
                    
## 만약에 서브 쿼리 결과값이 2개 이상이면 에러남
select * from idol_member a
where a.group_name = (select b.group_name
						from idol_group b
                        where b.debut < '2022-01-01');

## 대신 in으로 해서 결과값 하나로 만들면됨
select * from idol_member a
where a.group_name in (select b.group_name
						from idol_group b
                        where b.debut < '2022-01-01');
                        
# 단일 서브쿼리
select * from idol_member
where birthdate > (select avg(birthdate) from idol_member);

# 중첩 서브쿼리
select * from idol_member a
where exists (select 1 from melon_chart b
				where b.singer like concat('%', a.name, '%')); # select 1은 존재 유뮤만 확인하는 것
                
select * from idol_member a
where exists (select 'X' from melon_chart b
				where b.singer like concat('%', a.group_name, '%'));