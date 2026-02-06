https://school.programmers.co.kr/learn/challenges?order=acceptance_desc&levels=0%2C1&languages=mysql

### LV1

<details>
  <summary> DATE_FORMAT </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/132203
- 풀이
  - date 형식을 어떻게 변경하는지가 포인트 였다.

- 내 답안
  - ```SQL
    select DR_NAME, DR_ID, MCDP_CD, HIRE_YMD
    from DOCTOR
    where MCDP_CD in ('CS', 'GS')
    order by HIRE_YMD desc, DR_NAME asc;
    ```

- 옳은 답안
  - ```SQL
    select DR_NAME, DR_ID, MCDP_CD,
      date_format(HIRE_YMF, '%Y-%m-%d') as HIRE_YMB
    from DOCTOR
    where MCDP_CD in ('CS', 'GS')
    order by HIRE_YMD desc, DR_NAME asc;
    ```

</details>

<details>
  <summary> IN </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/276013
- 풀이
  - 여러 열의 같은 조건을 사용할 경우 IN을 사용해보자

- 내 답안
  - ```SQL
    SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
    FROM DEVELOPER_INFOS
    WHERE SKILL_1 LIKE 'Python'
    OR SKILL_2 LIKE 'Python'
    OR SKILL_3 LIKE 'Python'
    ORDER BY ID;
    ```

- 옳은 답안
  - ```SQL
    SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
    FROM DEVELOPER_INFOS
    WHERE 'Python' in (SKILL_1, SKILL_2, SKILL_3)
    ORDER BY ID;
    ```

</details>


<details>
  <summary> CASE WHEN </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/293259
- 풀이
  - 쿼리가 아닌 CASE WHEN으로 간단하게 풀어보자

- 내 답안
  - ```SQL
    SELECT ROUND(AVG(M.LENGTH), 2) AS AVERAGE_LENGTH
    FROM (SELECT IFNULL(LENGTH, 10) AS LENGTH
         FROM FISH_INFO) M;
    ```

- 옳은 답안
  - ```SQL
    SELECT 
      ROUND(AVG(CASE WHEN LENGTH IS NULL THEN 10 ELSE LENGTH END), 2) AS AVERAGE_LENGTH
    FROM FISH_INFO;
    ```

</details>

<details>
  <summary> DATEDIFF </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/151138
- 풀이
  - 날짜 계산에 DATEDIFF를 사용하자

- 내 답안
  - ```SQL
    SELECT 
     HISTORY_ID,
     CAR_ID, 
     DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE,
     DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
    CASE
     WHEN END_DATE - START_DATE >= 30 THEN '장기 대여' 
     ELSE '단기 대여' 
    END AS RENT_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE LIKE '2022-09%'
    ORDER BY HISTORY_ID DESC;
    ```

- 옳은 답안
  - ```SQL
    SELECT 
     HISTORY_ID,
     CAR_ID, 
     DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE,
     DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
    CASE
     WHEN DATEDIFF(END_DATE, START_DATE) >= 29 THEN '장기 대여' 
     ELSE '단기 대여' 
    END AS RENT_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE LIKE '2022-09%'
    ORDER BY HISTORY_ID DESC;
    ```

</details>

<details>
  <summary> 비트연산자 </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/301646
- 풀이
  - [`비트 연산자 링크 확인`](https://github.com/novicedata/SQL/tree/main/SQL_Practice_with_Code)

- 옳은 답안
  - ```SQL
    SELECT COUNT(*) AS COUNT
    FROM ECOLI_DATA
    WHERE GENOTYPE & 2 = 0 AND GENOTYPE & 5 <> 0;
    ```

</details>
