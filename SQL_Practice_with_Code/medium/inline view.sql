# inline view
## 테이블 대용 서브쿼리
## 조인을 안쓰는 이유는?
## 전체가 아닌 일부 데이터만 가져와서 쓸 경우에 쓰면 좋다

# idol 커밋한후
select * from idol_group;
select * from idol_member;

# inline view
select m.group_name, m.name, g.debut
from idol_member m,
	(select group_name, debut
		from idol_group
		where type = 'boy') g
where m.group_name = g.group_name;

# 일반적인 join으로 하면?
select m.group_name, m.name, g.debut
from idol_member m, idol_group g
where m.group_name = g.group_name
and g.type = 'boy';

# 1대1 매핑 (막내라인만)
select g.group_name, g.debut, m.youngest
from idol_group g,
	(select group_name, max(birthdate) youngest
		from idol_member
        group by group_name) m
where m.group_name = g.group_name;

# join으로
select g.group_name, g.debut, max(m.birthdate) as youngest
from idol_group g, idol_member m
where m.group_name= g.group_name
group by g.group_name, g.debut;

# 가상의 데이터 만들때 유용하게 사용가능
select tmp.hello, m.name
from (select '안녕!' as hello from dual) tmp,
idol_member m;