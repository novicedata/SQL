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



### LV2

<details>
  <summary> FLOOR 이용 범주 나누기 </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/131530
- 풀이
  - 가격대별 범주를 어떻게 하느냐

- 옳은 답안
  - ```SQL
    SELECT 
        FLOOR(PRICE/10000)*10000 AS PRICE_GROUP,
        COUNT(*) AS PRODUCTS
    FROM PRODUCT
    GROUP BY PRICE_GROUP
    ORDER BY PRICE_GROUP;
    ```
</details>

<details>
  <summary> 분기 나누기(QUARTER) </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/299308
- 풀이
  - 가격대별 범주를 어떻게 하느냐

- 옳은 답안
  - ```SQL
    SELECT
      CONCAT(QUARTER(DIFFERENTIATION_DATE), 'Q') AS QUARTER,
      COUNT(*) AS ECOLI_COUNT
    FROM ECOLI_DATA 
    GROUP BY CONCAT(QUARTER(DIFFERENTIATION_DATE), 'Q')
    ORDER BY QUARTER ASC;
    ```
</details>

<details>
  <summary> 업그레이드 아이템 확인(부모자식 JOIN) </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/273711
- 풀이
  - 부모, 자식 인덱스롤 JOIN 해서 풀 수 있다

- 옳은 답안
  - ```SQL
    SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
    FROM ITEM_INFO I
    JOIN ITEM_TREE T
        ON T.ITEM_ID = I.ITEM_ID
    JOIN ITEM_INFO P
        ON T.PARENT_ITEM_ID = P.ITEM_ID
    WHERE P.RARITY = 'RARE'
    ORDER BY I.ITEM_ID DESC
    ```
</details>

<details>
  <summary> 연도별 편차(서브쿼리, 윈도우) </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/299310
- 풀이
  - 내 풀이: 연도별 최댓값 구하는 서브쿼리 활용
  - ```SQL
    SELECT
        B.YEAR,
        B.MAX_SIZE - A.SIZE_OF_COLONY AS YEAR_DEV,
        A.ID
    FROM ECOLI_DATA A
    LEFT JOIN (
        SELECT 
            YEAR(DIFFERENTIATION_DATE) AS YEAR,
            MAX(SIZE_OF_COLONY) AS MAX_SIZE
        FROM ECOLI_DATA
        GROUP BY YEAR(DIFFERENTIATION_DATE)
    ) B
    ON YEAR(A.DIFFERENTIATION_DATE) = B.YEAR
    ORDER BY B.YEAR, YEAR_DEV;
    ```

- 옳은 답안
- 윈도우 FUNCTION 사용하면 훨 쉬
  - ```SQL
    SELECT YEAR(DIFFERENTIATION_DATE) AS YEAR, 
          MAX(SIZE_OF_COLONY) OVER (PARTITION BY YEAR(DIFFERENTIATION_DATE)) - SIZE_OF_COLONY AS YEAR_DEV, ID
    FROM ECOLI_DATA
    ORDER BY YEAR, YEAR_DEV
    ```
</details>

<details>
  <summary> 조건에 맞는 개발자 찾(비트연산) </summary>

- https://school.programmers.co.kr/learn/courses/30/lessons/276034
- 풀이
  - 연산자 &의 경우 AND로 SKILL_CODE안에 CODE에 해당하는 비트가 커져있으면 0보다 큰값
  - 내부적으로 SKILL_CODE와 CODE의 각행을 하나씩 비교해서 0보다 큰지를 확인하는 것
  - 확인해서 크면 1로 해당하는 것만 조

  - ```SQL
    SELECT DISTINCT
        D.ID,
        D.EMAIL,
        D.FIRST_NAME,
        D.LAST_NAME
    FROM DEVELOPERS D
    JOIN SKILLCODES S
    ON D.SKILL_CODE & S.CODE > 0
    WHERE S.NAME IN ('Python', 'C#')
    ORDER BY D.ID ASC;
    ```
</details>
