select * from melon_chart;

select * from melon_chart where song = 'I AM';
select * from melon_chart where song in ('I AM', 'Super Shy'); # in 조건을 통해 여러 where 적용 가능
select * from melon_chart where song = 'I AM' or song = 'Super Shy'; # 위 쿼리와 같은 조건이지만 위 쿼리가 더 깔끔한 것을 볼 수 있음

select * from melon_chart where song = 'I AM' or song = 'Super Shy' or song = 'Spicy' and singer = 'NewJeans';
# 우리 생각에는 가수가 뉴진스이고 저 세 제목을 가진 걸 가져올 것 같지만
# 맨 마지막 Spicy와 가수 뉴진스 조건 둘이 붙어버려서 그렇게 안됨 원하는 대로 하려면 아래와 같이 해야함

select * from melon_chart where song in ('I AM', 'Super Shy', 'Spicy') and singer = 'NewJeans';

select * from melon_chart where song like '이브%'; # 이브로 시작하는 것 가져오기
select * from melon_chart where song like '%S%'; # 모래 제목에 S가 들어가는 모든거 가져오기
select * from melon_chart where singer like '정_'; # 정으로 시작하는 두글자 가수 가져오기
select * from melon_chart where singer like '__정'; # 세글자이고 마지막에 정들어가는 가수 가져오기
select * from melon_chart where song like '_카%'; # 두번째글자가 카인 노래제목 가진 row 가져오기

# 만약 %, _를 문자열로 인식해야 한다면??

insert into melon_chart values (11, '반_가_워', '연우', '연우의 앨범', 1924);
insert into melon_chart values (12, '안%녕', '연우', '연우의 앨범', 12452);
select * from melon_chart;

select * from melon_chart where song like '%#%%' escape '#'; # escape사용하여 중간에 있는 % 기호를 문자열로 인식하여 출력
select * from melon_chart where song like '%$_%' escape '$'; # escape 기호는 이처럼 원하는 기호로 바꿔서 사용이 가능

# between은 특정 범위를 지정하는 것

select * from melon_chart where like_no between 100000 and 150000; # like가 10만, 15만 사이

# between은 이상과 이하이지 초과 미만이 아님!

commit;