# SQL Practice

## DDL

<details>  
  <summary>  👉 CREATE(테이블 생성) </summary>

- `create table '테이블 명' ('칼럼 명' '칼럼 특성')`
- `create table '테이블 명' ('칼럼 명' '칼럼 속성' not null)` -> null 있으면 오류나게
- 예시
  - ```SQL
    create table book_list (
      book_no varchar(16) not null,
      book_name varchar(50),
      prcie int,
      reg_date date
    )
    ```
</details>

<details>  
  <summary>  👉 ALTER(테이블 명령어) </summary>

- 칼럼 추가: ` alter table '테이블 명' add column '칼럼 명' '칼럼 속성'`
- 속성 변경: `alter table '테이블 명' modify column '칼럼 명' '칼럼 속성'`
- 이름도 변경: `alter table '테이블 명' change column '변경 전 칼럼 명' '변경 후 칼럼 명' '칼럼 속성'`
- 칼럼 드랍: `alter table '테이블 명' drop '칼럼 명'`
- 테이블 명 변경: `alter table '변경 전 테이블 명' rename '변경 후 테이블 명'`
</details>

<details>  
  <summary>  👉 INSERT(칼럼 값 삽입), DROP/TRUNCATE(삭제) </summary>

- 칼럼 값 삽입: `insert into '테이블 명' values '(값1, 값2, ..., 값 x)'`
- 예시
  ```SQL
  insert into book_list values ('21566', '세이노의 가르침'. '세이노', '데이원', '2023002', 7200)
  insert into book_list values ('15485', '심플 라이프'. '제시카 로즈', '밀리언서재', '20240423', 15800)
  ```

- 데이터 전체 삭제(롤백 불가): `truncate table '테이블 명'`
- 테이블, 데이터 모두 삭제: `drop table '테이블 명`' 
</details>
