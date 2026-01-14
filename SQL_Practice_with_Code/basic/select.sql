create table melon_chart (
    ranking     	int,
    song    	varchar(50),
    singer		varchar(20),
    album		varchar(50),
    like_no	int
);

insert into melon_chart values (1, 'Super Shy', 'NewJeans', 'NewJeans 2nd EP Get Up', 115766);
insert into melon_chart values (2, 'Seven (feat. Latto) - Clean Ver.', '정국', 'Seven (feat. Latto) - Clean Ver.', 124699);
insert into melon_chart values (3, 'ETA', 'NewJeans', 'NewJeans 2nd EP Get Up', 60239);
insert into melon_chart values (4, '퀸카 (Queencard)', '(여자)아이들', 'I feel', 125309);
insert into melon_chart values (5, 'I AM', 'IVE (아이브)', 'Ive IVE', 188847);
insert into melon_chart values (6, '헤어지자 말해요', '박재정', '1집 Alone', 96577);
insert into melon_chart values (7, '이브, 프시케 그리고 푸른 수염의 아내', 'Le SSERAFIM (르세라핌)', 'UNFORGIVEN', 96863);
insert into melon_chart values (8, 'Spicy', 'aespa', 'MY WORLD - The 3rd Mini Album', 115388);
insert into melon_chart values (9, 'Steal The Show (From 엘리멘탈)', 'Lauv', 'Steal The Show (From 엘리멘탈)', 108665);
insert into melon_chart values (10, 'New Jeans', 'NewJeans', 'NewJeans 2nd EP Get Up', 57308);

select * from melon_chart

commit;

# 내가 원하는 걸 골라내는 where문을 얼마나 간결하게 사용하느냐가 관건

select singer from melon_chart; # singer만 뽑자
select distinct singer from melon_chart; # 중복 제거
select count(distinct singer) from melon_chart; # 중복 제거한 가수 명수 확인a
select count(distinct singer) as cnt from melon_chart; # as는 내가 부르고 싶은 header 쓰는 것

select ranking, song from melon_chart where singer ='NewJeans'; # newjin 노래만
select * from melon_chart where singer = 'NewJeans' and ranking < 6; # and: + / 뉴진스 노래 + 랭킹 상위
select * from melon_chart where singer = '정국' or singer = '박재정'; # or: a거나 b거나 / 정국 노래거나 박재정 노래거나

select * from melon_chart limit 3; # limit은 상위 기준만 빠르게 보기 위함

commit;