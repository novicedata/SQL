# order by는 보통 마지막 순서로

select * from melon_chart;

# 랭킹
select * from melon_chart order by ranking;
select * from melon_chart order by ranking desc; # 역순 # asc가 정순

select song, singer from melon_chart order by ranking;

# 조건절 추가
select * from melon_chart where singer not in ('정국', '박재정') order by song;

# 다중 컬럼 기준 정렬 (왼쪽 부터 먼저 시행됨)
select * from melon_chart order by singer asc, like_no desc; # 가수 오름차순, 좋아요 내림차순

# limit 구문 (좋아요 기준 상위 5)
select * from melon_chart order by like_no desc limit 5;
select * from melon_chart order by like_no desc limit 3, 5; # 상위 4번째부터 5개

