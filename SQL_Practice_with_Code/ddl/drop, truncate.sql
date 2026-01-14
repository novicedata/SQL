CREATE TABLE book_list (
    book_no     varchar(13),
    book_nm     varchar(30),
    writer      varchar(20),
    publisher   varchar(30),
    reg_date    date,
    price       int
);

INSERT INTO book_list VALUES ('9791168473690','세이노의 가르침','세이노','데이원','20230302',7200); 
INSERT INTO book_list VALUES ('9791158741952','상처받지 않는 관계의 비밀','최리나','미디어숲','20230730',18800); 
INSERT INTO book_list VALUES ('9788901272580','역행자','자청','웅진지식하우스','20230529',19500); 
INSERT INTO book_list VALUES ('9788932923413','꿀벌의 예언1','베르나르 베르베르','열린책들','20230621',16800); 
INSERT INTO book_list VALUES ('9791191891287','메리골드 마음 세탁소','윤정은','북로망스','20230306',15000); 
INSERT INTO book_list VALUES ('9791191669466','나는 죽을 때까지 지적이고 싶다','양원근','정민미디어','20230615',16800); 
INSERT INTO book_list VALUES ('9791158741952','심플 라이프','제시카 로즈 윌리엄스','밀리언서재','20230615',17500); 
INSERT INTO book_list VALUES ('9791190299770','모든 삶은 흐른다','로랑스 드빌레르','피카(FIKA)','20230403',16800); 
INSERT INTO book_list VALUES ('9791192389073','유연함의 힘','수잔 애쉬포드','상상스퀘어','20230510',19800); 
INSERT INTO book_list VALUES ('9791167740984','도둑맞은 집중력','요한 하리','어크로스','20230428',18800); 

select * from book_list;

truncate table book_list; #데이터 전체 삭제, 롤백 불가
drop table book_list; #테이블, 데이터 모두 삭제


	