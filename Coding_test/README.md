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
