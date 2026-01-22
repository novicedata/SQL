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

## DDL

<details>  
  <summary>  👉 UPDATE </summary>

- 조건절 업데이트: `update '테이블 명' set '칼럼 명' = '업데이트 값' where '조건절'`

- 조건절 누락되지 않도록
- 꼭 커밋해주기
</details>

<details>  
  <summary>  👉 DELETE(행 단위 삭제) </summary>

- 조건절 삭제: `delete from '테이블 명' where '조건절'`
</details>

## BASIC 쿼리

<details>  
  <summary>  👉 SELECT(distinct, count, as, limit) </summary>

- 중복 제거: `select distinct '칼럼 명' from '테이블 명'`

- 조건절에 맞는 행 수: `select count(distinct '칼럼 명') from '테이블 명'`

- header 설정: `select '칼럼 명' as 'header 명' from '테이블 명'`

- 보이는 행수 조절: `select '칼럼 명' from '테이블 명' limit '수'`
</details>

<details>  
  <summary>  👉 WHERE(in, like, between) </summary>

- 여러 조건 확인: `select * from '테이블 명' where '조건 열' in ('조건 1', '조건 2', ..., '조건 x')`

- 넓은 범위 조건 확인(예시로):
  - '이브'로 시작하는 조건: `select * from '테이블 명' where '조건 열' like '이브%'`
  - 'S'가 들어있는 조건: `select * from '테이블 명' where '조건 열' like '%S%'`
  - '정'으로 시작하는 두글자 조건: `select * from '테이블 명' where '조건 열' like '정_'`
  - 세글자이고 마지막에 '정'이 들어가는 조건: `select * from '테이블 명' where '조건 열' like '__정'`
  - 두번째 글자가 '카'인 조건: `select * from '테이블 명' where '조건 열' like '_카%'`
  - '%', '_'를 문자열로 인식해야 한다면
    - escape 사용: `select * from '테이블 명' where '조건 열' like '%#%%' escape '#'`
      - 중간에 있는 %기호를 문자열로 인식하라(기호는 원하는 것 모두 가능)
  
 - 범위 지정: `select * from '테이블 명' where '조건 열' between '하한값' and '상한값'`
</details>
