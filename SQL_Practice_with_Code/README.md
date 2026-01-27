# SQL Practice

- [`연습1(select query)`](https://github.com/novicedata/SQL/tree/main/SQL_Practice_with_Code/camping)
- [`연습2(select, join, sub query)`](https://github.com/novicedata/SQL/tree/main/SQL_Practice_with_Code/highway)
- [`연습3(count, join, sub query)`](https://github.com/novicedata/SQL/tree/main/SQL_Practice_with_Code/weather)

## DDL

<details>  
  <summary>  👉 CREATE(테이블 생성) </summary>

- `create table '테이블 명' ('칼럼 명' '칼럼 특성');`

- `create table '테이블 명' ('칼럼 명' '칼럼 속성' not null);` -> null 있으면 오류나게

- 예시
  - ```SQL
    create table book_list (
      book_no varchar(16) not null,
      book_name varchar(50),
      prcie int,
      reg_date date
    );
    ```
</details>

<details>  
  <summary>  👉 ALTER(테이블 명령어) </summary>

- 칼럼 추가: ` alter table '테이블 명' add column '칼럼 명' '칼럼 속성';`

- 속성 변경: `alter table '테이블 명' modify column '칼럼 명' '칼럼 속성';`

- 이름도 변경: `alter table '테이블 명' change column '변경 전 칼럼 명' '변경 후 칼럼 명' '칼럼 속성';`

- 칼럼 드랍: `alter table '테이블 명' drop '칼럼 명';`

- 테이블 명 변경: `alter table '변경 전 테이블 명' rename '변경 후 테이블 명';`
</details>

<details>  
  <summary>  👉 INSERT(칼럼 값 삽입), DROP/TRUNCATE(삭제) </summary>

- 칼럼 값 삽입: `insert into '테이블 명' values '(값1, 값2, ..., 값 x)';`

- 예시
  ```SQL
  insert into book_list values ('21566', '세이노의 가르침'. '세이노', '데이원', '2023002', 7200);
  insert into book_list values ('15485', '심플 라이프'. '제시카 로즈', '밀리언서재', '20240423', 15800);
  ```

- 데이터 전체 삭제(롤백 불가): `truncate table '테이블 명';`

- 테이블, 데이터 모두 삭제: `drop table '테이블 명`;' 
</details>

## DDL

<details>  
  <summary>  👉 UPDATE </summary>

- 조건절 업데이트: `update '테이블 명' set '칼럼 명' = '업데이트 값' where '조건절';`

- 조건절 누락되지 않도록
- 꼭 커밋해주기
</details>

<details>  
  <summary>  👉 DELETE(행 단위 삭제) </summary>

- 조건절 삭제: `delete from '테이블 명' where '조건절';`
</details>

## 초급 쿼리

<details>  
  <summary>  👉 SELECT(distinct, count, as, limit) </summary>

- 중복 제거: `select distinct '칼럼 명' from '테이블 명';`

- 조건절에 맞는 행 수: `select count(distinct '칼럼 명') from '테이블 명';`

- header 설정: `select '칼럼 명' as 'header 명' from '테이블 명';`

- 보이는 행수 조절: `select '칼럼 명' from '테이블 명' limit '수';`
</details>

<details>  
  <summary>  👉 WHERE(in, like, between) </summary>

- 여러 조건 확인: `select * from '테이블 명' where '조건 열' in ('조건 1', '조건 2', ..., '조건 x');`

- 넓은 범위 조건 확인(예시로):
  - '이브'로 시작하는 조건: `select * from '테이블 명' where '조건 열' like '이브%';`
  - 'S'가 들어있는 조건: `select * from '테이블 명' where '조건 열' like '%S%';`
  - '정'으로 시작하는 두글자 조건: `select * from '테이블 명' where '조건 열' like '정_';`
  - 세글자이고 마지막에 '정'이 들어가는 조건: `select * from '테이블 명' where '조건 열' like '__정';`
  - 두번째 글자가 '카'인 조건: `select * from '테이블 명' where '조건 열' like '_카%';`
  - '%', '_'를 문자열로 인식해야 한다면
    - escape 사용: `select * from '테이블 명' where '조건 열' like '%#%%' escape '#';`
      - 중간에 있는 %기호를 문자열로 인식하라(기호는 원하는 것 모두 가능)
  
 - 범위 지정: `select * from '테이블 명' where '조건 열' between '하한값' and '상한값';`
</details>

<details>  
  <summary>  👉 ORDER BY(내림, 오른차순) </summary>

- 정순: `select * from '테이블 명' order by '기준 열' asc;`
- 역순: `select * from '테이블 명' order by '기준 열' desc;`

- 다중 칼럼 기준: `select * from '테이블 명' order by '기준 열1', '기준 열2';`
</details>

<details>  
  <summary>  👉 GROUP BY(그룹핑) </summary>

- 집계 함수와 그룹핑: `select '볼 열', '집계 함수1', '집계 함수2', ... from '테이블 명' group by '볼 열';`
- 예시:
  ```SQL
  select animal, max(age), avg(age) from animal_info group by animal;
  ```

- 기준 2개: `select '열1', '열2', '집계 함수1', '집계 함수2', ... from '테이블 명' group by '열1', '열2';`
  
- 조건도 가능: `select '볼 열', '집계 함수' from '테이블 명' where '조건절' group by '볼 열';`
</details>

<details>  
  <summary>  👉 HAVING(GROUP BY뒤에 위치한 조건(그룹화 조건)) </summary>

- `select '볼 열', '집계 함수' from '테이블 명' group by '볼 열' having '조건';`
</details>



## 중급 쿼리

<details>  
  <summary>  👉 INNER JOIN </summary>

<img width="250" height="250" alt="image" src="https://github.com/user-attachments/assets/c0874f93-891b-40e2-a340-989234c11563" />

- 교집합만 보기:
  - ```SQL
    select '열'
    from '테이블 1' '키1'
      inner join '테이블2' '키2'
      on '키1' = '키2'
    where '조건절도 가능';
    ```

- 컴마 조건절로도 가능
  - ```SQL
    select '열'
    from '테이블 1' '헤더1'
      , '테이블2' '헤더2'
      where '헤더1' = '헤더2';
    ```
</details>

<details>  
  <summary>  👉 OUTER JOIN </summary>

<img width="500" height="360" alt="image" src="https://github.com/user-attachments/assets/a7da8639-56a1-4b5a-96d5-1ae9258f6edd" />


- left outer join: 왼쪽 테이블 기준으로 오른쪽에 붙임
  - ```SQL
    select 열
    from '테이블1' '키1'
      left outer join '테이블2' '키2'
      on '키1' = '키2';
    ```

- right outer join: 오른쪽 테이블 기준으로 왼쪽에 붙임
  - ```SQL
    select 열
    from '테이블1' '키1'
      right outer join '테이블2' '키2'
      on '키1' = '키2';
    ```
</details>

<details>  
  <summary>  👉 SELF JOIN(+ CROSS JOIN) </summary>

<img width="200" height="215" alt="image" src="https://github.com/user-attachments/assets/e8179f90-102c-44dc-8501-3ef5ee2d5853" />

- 테이블 자체가 하나의 hierarchy일 때
- ```SQL
  select 열
  from '테이블1' '키1'
    inner join '테이블2' '키2';
  ```

- 예시
  - ```SQL
    select a.id, a.name, a.role, b.id, b.name, b.role, c.role, c.id, c.name
    from high_kick a
      left outer join high_kick b
      on a.id=b.parent_id
      left outer join high_kick c
      on b.id = c.parent_id
    where a.parent_id is null;
    ```

<img width="250" height="230" alt="image" src="https://github.com/user-attachments/assets/b7a48350-b783-4acb-a2b2-12b70c369513" />

- 각 테이블 row별 반복 적합
  - ```SQL
    select 열
    from '테이블1' '키1'
      cross join '테이블2' '키2';
    ```
</details>

<details>  
  <summary>  👉 scalar sub query </summary>


- 메인 쿼리 안에 내포되어 있는 또 다른 쿼리(여러개 가능)
- 그중에서도 스칼라 서브쿼리란, 칼럼 대신에 대입해서 쓸 수 있음
- 주로 select 절에 대입해서 사용
- return은 한개만 나오게 해야함

- ```SQL
  select '열'
    (select ... 단일 행의 단일 칼럼을 반환할 서브쿼리)
  from '테이블';
  ```
- 예시:
  - ```SQL
    select a.id, a.name,
	    (select b.name from grade_info b where b.code=a.grade_code) as grade
    from customers a;
    ```
</details>

<details>  
  <summary>  👉 INLINE VIEW </summary>


- 테이블 대용 서브쿼리
- 전체가 아닌 일부 데이터만 가져와서 쓸 경우 조인보다 좋

- ```SQL
  select '열'
  from (
        select ... 반환할 하나의 테이블
        );
  ```

- 예시:
  - ```SQL
    select m.group_name, m.name, g.debut
    from idol_member m,
    	(select group_name, debut
    		from idol_group
    		where type = 'boy') g
    where m.group_name = g.group_name;
    ```
</details>

<details>  
  <summary>  👉 중첩 sub query </summary>


- where, having과 같은 조건절에서 쓸 수 있는 서브쿼리
- 조건 부여, main table과 비교하는데 사용

- ```SQL
  select '열'
  from '테이블'
  where 열 =(or in, >, exists 등등) (
                                    select ... 단일, 다중행 모두 리턴 가능
                                    );
  ```

- 예시:
  - ```SQL
    select * from idol_member a
    where a.group_name in (select b.group_name
    						from idol_group b
                            where b.debut < '2022-01-01');
    ```
</details>

<details>  
  <summary>  👉 UNION / UNION ALL </summary>


- 집합 연산자
- join: 가로로 출력, union: 세로로 출력
- select 할 수 있는 칼럼 수가 같아야함

- ```SQL
  select 열 from '테이블1'
  union all
  select 열 from '테이블2';
  ```

- union은 all과 다르게 중복 제거
  - ```SQL
    select 열 from '테이블1'
    union
    select 열 from '테이블2';
    ```
</details>

<details>  
  <summary>  👉 WITH ROLLUP(집계) </summary>


- 그룹별로 합계를 한번에 구할 때

- ```SQL
  select 열, 집계 함수(열)
  from '테이블 명'
  group by '그룹화' with rollup
  ```
</details>

<details>  
  <summary>  👉 WINDOW function </summary>

- 순위
  - rank: 동일 순위면 같은 순위로 부여 but 그 수만큼 다음 순위 건너뜀
  - dense_rank: 동일 순위면 같은 순위 부여 건너뛰기 없음
  - row_number: 동일 순위여도 랜덤으로 유니크 순위 부여
  - ```SQL
    select first_name, last_name, department_id, salary,
    	  row_number() over(partition by department_id order by salary desc) as row_no,
        rank() over(partition by department_id order by salary desc) as rank_no,
        dense_rank() over(partition by department_id order by salary desc) as dense_rank_no
    from employees
    order by department_id, row_no;
    ```
</details>

## 추가 function

<details>  
  <summary>  👉 null function </summary>

- null이면 대체
  - `select ifnull('실제데이터', '대체값') from dual;`
  - `select ifnull(null, '대체값') from dual;`
 
- 주어진 argument 중 null이 아닌 최초값 반환
  - `select coalesce('데이터1', '데이터2', ... '데이터x') from dual;`

- 같으면 null: `select nullif('데이터', '데이터') from dual`
- 다르면 첫번째를 반환: `select nullif('데이터', '데이터1') from dual`

- null이면 1반환: `select isnull('데이터') from dual;`
</details>

<details>  
  <summary>  👉 str function </summary>

- substring(규칙에 맞게 자름)
  - x부터 y까지 자르기: `select substring(문자열, x, y) from dual;`
  - x부터 끝까지 자르기: `select substring(문자열, x) from dual;`

- length, concat, upper, lower
  - 바이트 계산(한글은 3바이트): `select length(문자열) from dual;`
  - 합치기: `select concat(문자열1, 문자열2) from dual;`
  - 대문자: `select upper(문자열) from dual;`
  - 소문자: `select lower(문자열) from dual;`
 
- trim, instr, replace, lpad
  - 앞뒤 공백 정리: `select trim(문자열) from dual;`
  - 찾고자 하는거 몇번째에 있는지: `select instr(문자열) from dual;`
  - 원하는 x 찾아서 y로 대체: `select replace(문자열, x, y) from dual;`
  - input이 x자리수 못채우면 나머지 자리 y로 채우기
    - `select lpad(문자열, x, y) from dual;`
</details>

<details>  
  <summary>  👉 num function </summary>

- round(반올림)
  - `select round(숫자) from dual;`
  - x자리 반올림: `select round(숫자, x) from dual;`

- floor(버림), ceil(올림)
  - 소수점 버림: `select floor(숫자) from dual;`
  - 올림: `select ceil(숫자) from dual;`
 
- abs(절대값), sign(양수 or 음수), mod(나머지)
  - 절대값: `select abs(숫자) from dual;`
  - 양수면 1, 음수면 -1 반환: `select sign(숫자) from dual;`
  - 나머지 반환: `select mod(숫자) from dual;`
</details>

<details>  
  <summary>  👉 date function </summary>

- now, sysdate, current_date
  - 현재 시간: `select now() from dual;`
  - 시스템 시간: `select sysdate() from dual;`
  - 년월일: `select current_date() from dual;`

- adddate, last_day
  - x일 만큼 더하기: `select adddate(now(), x) from dual;`
  - 월 마지막 날: `select last_day(now()) from dual;`
 
- year, month, day
  - 년: `select year(now()) from dual;`
  - 월: `select month(now()) from dual;`
  - 일: `select day(now()) from dual;`
</details>
