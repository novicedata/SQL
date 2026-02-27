### SQL 활용

---

<details>
  <summary><strong> 1️⃣ 서브쿼리 </strong></summary>
  
- **서브쿼리**: 하나의 쿼리 안에 존재하는 또 다른 쿼리

|위치|쿼리 명|
|---|---|
|SELECT 절|스칼라 서브쿼리|
|FROM 절|인라인 뷰|
|WHERE, HAVING 절|중첩 서브쿼리|

- **스칼라 서브쿼리**: select절에 위치하지만 컬럼이 올 수 있는 대부분의 위치에 사용이 가능.
  - 반드시 하나의 값만 반환해야 함
    > <img width="608" height="233" alt="image" src="https://github.com/user-attachments/assets/fcc94f42-02f3-407e-a579-45f9cf596f0e" />

- **인라인 뷰**: from 절 등 테이블명이 올 수 있는 위치에 사용 가능
  > <img width="651" height="290" alt="image" src="https://github.com/user-attachments/assets/7f756367-572b-46ae-9975-f719b630685a" />

- **중첩 서브쿼리**: where, having 절에 사용.
  - 메인쿼리와 관계를 맺고 있으면 **연관 서브쿼리** 아니면 **비연관 서브쿼리**
    - **비연관 서브쿼리**는 서브쿼리 내에 메인쿼리의 칼럼이 존재하지 않음
      > <img width="603" height="184" alt="image" src="https://github.com/user-attachments/assets/cc8669be-07e9-486f-9318-8f0403584b5e" />
    - **연관 서브쿼리**는 서브쿼리 내에 메인쿼리의 칼럼이 존재
      > <img width="586" height="261" alt="image" src="https://github.com/user-attachments/assets/70a83401-3cc5-4339-9730-e7b579e8347b" />

  - **단일 행 서브쿼리**: 1건 이하의 데이터 반환, 단일 행 비교 연산자(부등호 등)과 함께 사용
  - **다중 행 서브쿼리**: 여러 건의 데이터 반환, 다중 행 비교 연산자(IN, ALL, ANY 등)과 함께 사용
  - **다중 칼럼 서브쿼리**: 여러 칼럼의 데이터를 반환
</details>

<details>
  <summary><strong> 2️⃣ 뷰 </strong></summary>

- **뷰**: 특정 SELECT 문에 이름을 붙여서 재사용 가능하도록 저장해놓은 오브젝트
  - 단, 실제 데이터를 저장한게 아니라 조회해오는 SELECT문만 가지고 있는 것
    > <img width="455" height="162" alt="image" src="https://github.com/user-attachments/assets/72ab66c9-411b-465f-8595-b0998de2e6df" />

  - **보안성, 독립성, 편리성**

</details>

<details>
  <summary><strong> 3️⃣ 집합 연산자 </strong></summary>

- **집합 연산자**: 각 쿼리의 결과 집합을 가지고 연산하는 명령어(join의 세로 버전)

|연산자|의미|
|---|---|
|UNION ALL|각 쿼리 결과 집합의 합집합. 중복 행도 그대로 출력|
|UNION|각 쿼리 결과 집합의 합집합. 중복 행은 한줄로 출력|
|INTERSECT|각 쿼리 결과 집합의 교집합. 중복된 행은 한줄로 출력|
|MINUS/EXCEPT|앞 쿼리 결과 - 뒷 쿼리 결과. 차집합. 중복된 행은 한줄로 출력|

- **UNION ALL**
  > <img width="250" height="152" alt="image" src="https://github.com/user-attachments/assets/489529be-880d-4d6a-bc58-d8977c645e01" />

- **UNION**
  > <img width="235" height="143" alt="image" src="https://github.com/user-attachments/assets/7ba2c4b6-452f-4771-b429-cf76f9bfcf2e" />

- **INTERSECT**
  > <img width="232" height="141" alt="image" src="https://github.com/user-attachments/assets/f13122df-cd81-4533-a5b6-cacb193edaf9" />

- **MINUS/EXCEPT**
  > <img width="233" height="140" alt="image" src="https://github.com/user-attachments/assets/5af22a3f-cd56-45a4-bd9f-6dd81ef47ce2" />

</details>

<details>
  <summary><strong> 4️⃣ 그룹 함수 </stong></summary>

- **그룹 함수**: GROUP BY하여 나타낼 수 있는 데이터 구하는 함수
  - **집계 함수**: COUNT, SUM, AVG, MAX 등
  - **총계 함수**: ROLLUP, CUBE, GROUPING SETS 등
 
- **ROLLUP**: 소그룹 간 소계 및 총계 계산 함수
  - **ROLLUP (A)**: A로 그룹핑, 총 합계
    > <img width="289" height="358" alt="image" src="https://github.com/user-attachments/assets/2f84c18e-3412-4636-8b3d-d7ef2b2f1e20" />

  - **ROLLUP (A, B)**: A, B로 그룹핑 -> A로 그룹핑 -> 총 합계
    > <img width="360" height="474" alt="image" src="https://github.com/user-attachments/assets/bb3569d7-5962-4562-b8eb-fc5a4236e52c" />

  - **ROLLUP (A, B, C)**: A, B, C로 그룹핑 -> A, B로 그룹핑 -> A로 그룹핑 -> 총합계
    > <img width="547" height="622" alt="image" src="https://github.com/user-attachments/assets/d2cebda2-3241-40c6-a457-7f41783a37de" />

- **CUBE**: 소그룹 산 소계 및 총계를 다차원적으로 계산할 수 있는 함수
  - **CUBE (A)**: A로 그룹핑 -> 총 합계
  - **CUBE(A, B)**: A, B로 그룹핑 -> A로 그룹핑 -> B로 그룹핑 -> 총 합계
    > <img width="413" height="475" alt="image" src="https://github.com/user-attachments/assets/b7146006-0f10-4e32-8d86-693d4b5808e6" />

  - **CUBE(A, B, C)**: A, B, C로 그룹핑 -> A, B로 그룹핑 -> A, C로 그룹핑 -> B, C로 그룹핑 -> A로 그룹핑 -> B로 그룹핑 -> C로 그룹핑 -> 총 합

- **GROUPING SETS**: 특정 항목에 대한 소계 계산
  - **GROUPING SETS (A, B)**: A로 그룹핑 -> B로 그룹핑
  - **GROUPING SETS (A, B, ())**: A로 그룹핑 -> B로 그룹핑 -> 총 합계
  - **GROUPING SETS (A, ROLLUP(B))**: A로 그룹핑 -> B로 그룹핑 -> 총 합계
  - **GROUPING SETS (A, ROLLUP(B, C))**: A로 그룹핑 -> B, C로 그룹핑 -> B로 그룹핑 -> 총 합계
  - **GROUPING SETS (A, B, ROLLUP(C))**: A로 그룹핑 -> B로 그룹핑 -> C로 그룹핑 -> 총 합

- **GROUPING**: ROLLUP, CUBE, GROUPING SETS 등과 함께 쓰이며 소계를 나타내는 Row를 구분할 수 있게 해줌.
  > <img width="469" height="387" alt="image" src="https://github.com/user-attachments/assets/a27606e5-521a-4be1-963d-b3094a6fef14" />
  > <img width="467" height="421" alt="image" src="https://github.com/user-attachments/assets/b852fe2c-b1c4-4ad4-a262-34400a92678b" />

</details>

<details>
  <summary><strong> 5️⃣ 윈도우 함수 </stong></summary>

- **윈도우 함수**: OVER 키워드와 함께 사용.

- **순위 함수**
  - **RANK**: 순위 매기며 같은 순위일 시 존재하는 수만큼 다음 순위 건너 띔
    > <img width="468" height="319" alt="image" src="https://github.com/user-attachments/assets/93485475-da52-4ba7-93ef-8330d029edda" />

  - **DENSE_RANK**: 순의 매기며 같은 순위일 시 건너띄지 않고 이어서 매김
    > <img width="626" height="361" alt="image" src="https://github.com/user-attachments/assets/feedfdae-fb87-44a1-81ef-b77cf5d2ade7" />

  - **ROW_NUMBER**: 순의 매기며 같은 값이여도 다른 순위
    > <img width="633" height="361" alt="image" src="https://github.com/user-attachments/assets/aa98e72d-3710-4cc1-a90d-c00e6f736024" />

- **집계 함수**
  - **SUM**
    > <img width="439" height="104" alt="image" src="https://github.com/user-attachments/assets/1fc88774-3248-4f3c-828f-d27dd6d2e57e" />
    > <img width="656" height="275" alt="image" src="https://github.com/user-attachments/assets/6e045852-5e12-4864-86ff-1b2d1961c386" />

  - **MAX, MIN, AVG, COUNT**
 
- **행 순서 함수**
  - **FIRST_VALUE**: 파티션 별 가장 선두에 위치한 데이터 구하는 함수
    > <img width="521" height="275" alt="image" src="https://github.com/user-attachments/assets/cf6182d5-f7fc-4f54-82f0-44533f9322c8" />
    > <img width="572" height="325" alt="image" src="https://github.com/user-attachments/assets/ee8a5b52-19b1-43ba-94de-a72d0ab38e2b" />

  - **LAST_VALUE**: FIRST_VALUE와 반대로 마지막 데이터 구하는 함수
 
  - **LAG**: 파티션 별로 특정 수 만큼 앞선 데이터 구하는 함수
    > <img width="513" height="355" alt="image" src="https://github.com/user-attachments/assets/51b69a36-afa8-4059-82ee-f268956b2374" />

  - **LEAD**: 파티션 별로 특정 수 만큼 뒤에 있는 데이터 구하는 함수
    > <img width="517" height="357" alt="image" src="https://github.com/user-attachments/assets/b9869a70-da60-41ba-a443-9c3ba377fcc5" />

- **비율 함수**
  - **RATIO_TO_REPORT**: 파티션 별로 합계에서 차지하는 비율을 구하는 함수
    > <img width="639" height="319" alt="image" src="https://github.com/user-attachments/assets/6cd2d1fb-d020-4c4f-9e40-7e1063d3d998" />

  - **PERCENT_RANK**: 파티션의 맨 위 끝 행을 0, 맨 아래 끝 행을 1로 놓고 현재 행이 위치하는 백분위 순위값 구하는 함수
    > <img width="655" height="290" alt="image" src="https://github.com/user-attachments/assets/20589c79-f363-4687-bccc-5f891f11750e" />

  - **CUME_DIST**: 해당 파티션에서의 누적 백분율을 구하는 함수
    > <img width="644" height="278" alt="image" src="https://github.com/user-attachments/assets/a6335117-b45f-48a2-aa04-97114cdf6dc9" />

  - **NTILE**: 주어진 수만큼 행들을 n등분한 후 현재 행에 해당하는 등급 구하는 함수
    > <img width="642" height="355" alt="image" src="https://github.com/user-attachments/assets/197ff47b-2ea1-4b14-b99d-e3a09af1c423" />

</details>

<details>
  <summary><strong> 6️⃣ Top-N 쿼리 </stong></summary>

- **ORDER BY**: 데이터 정렬

</details>

<details>
  <summary><strong> 7️⃣ 셀프 조인 </stong></summary>

- **JOIN**: 각기 다른 테이블을 한 번에 보여줄 때

</details>

<details>
  <summary><strong> 8️⃣ 계층 쿼리 </stong></summary>

- **STANDARD JOIN**: 표준이 되는 ANSI SQL중 하나로 어느 RDBMS에서든 사용 가능

</details>

<details>
  <summary><strong> 9️⃣ 계층 쿼리 </stong></summary>

- **STANDARD JOIN**: 표준이 되는 ANSI SQL중 하나로 어느 RDBMS에서든 사용 가능

</details>

<details>
  <summary><strong> 🔟 계층 쿼리 </stong></summary>

- **STANDARD JOIN**: 표준이 되는 ANSI SQL중 하나로 어느 RDBMS에서든 사용 가능

</details>
---
