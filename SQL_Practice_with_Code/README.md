# SQL Practice

## DDL

<details>  
  <summary>  <h4> 👉 CREATE(테이블 생성) </h4> </summary>

- create table '테이블 명' ('칼럼명' '칼럼 특성')
- create table '테이블 명' ('칼럼명' '칼럼 특성' not null) -> null 있으면 오류나게
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
