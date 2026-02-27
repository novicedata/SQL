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

- **ROWNUM**: 슈도 칼럼
  > <img width="488" height="372" alt="image" src="https://github.com/user-attachments/assets/5ac253f2-f156-4f5a-9e49-3a5c49082758" />

- **윈도우 함수의 순위 함수**
  > <img width="659" height="282" alt="image" src="https://github.com/user-attachments/assets/fe1bebd0-b49d-494b-a0dd-3531eab482b7" />

</details>

<details>
  <summary><strong> 7️⃣ 셀프 조인 </stong></summary>

- **셀프 조인**: 나 자신과의 조인. FROM 절에 같은 테이블이 두 번 이상 등장하기 때문에 혼란을 막기 위해 ALIAS를 반드시 표기해주어야 함
  > <img width="529" height="270" alt="image" src="https://github.com/user-attachments/assets/51c388a5-6eae-4237-8c24-7a77975df788" />
  > <img width="538" height="227" alt="image" src="https://github.com/user-attachments/assets/35167206-f170-4e59-bb01-474935dc0db4" />

</details>

<details>
  <summary><strong> 8️⃣ 계층 쿼리 </stong></summary>

- **계층 쿼리**: 계층 구조를 이루는 쿼리가 존재할 경우 계층 쿼리를 이용하여 데이터 출력 가능
  > <img width="672" height="303" alt="image" src="https://github.com/user-attachments/assets/40d2ff9a-f7c9-41bc-9f73-397d784bf96f" />

- **구문**
  - **LEVEL**: 현재의 depth를 반환(루트 노드가 1)
  - **SYS_CONNECT_BY_PATH (칼럼, 구분자)**: 루트 노드부터 현재 노드까지의 경로 출력
  - **START WITH**: 경로가 시작되는 루트 노드를 생성해주는 절
  - **CONNECT BY**: 루트로부터 자식 노드를 생성해주는 절
  - **PRIOR**: 바로 앞에 있는 부모 노드 값 반환
  - **CONNECT_BY_ROOT 칼럼**: 루트 노드의 주어진 칼럼 값 반환
  - **CONNECT_BY_ISLEAF**: 가장 하위 노드인 경우 1 반환, 그 외 0 반환
 
> <img width="552" height="668" alt="image" src="https://github.com/user-attachments/assets/0b3b671f-1014-4dbb-919e-68b7b3c7f0f2" />
> <img width="663" height="346" alt="image" src="https://github.com/user-attachments/assets/7171c734-54c2-41a6-9e9a-0a1926872116" />


</details>

<details>
  <summary><strong> 9️⃣ PIVOT, UNPIVOT </stong></summary>

- **PIVOT절 구성 요소**
  - 집계 함수: 결과 데이터에 표시할 집계 데이터 정의
  - FOR 절: PIVOT할 칼럼 지정
  - IN 절: PIVOT할 칼럼 값 지정 
  > <img width="438" height="240" alt="image" src="https://github.com/user-attachments/assets/f82c9a8f-74d0-4ec0-a15d-f83ae150ce62" />
  > <img width="619" height="201" alt="image" src="https://github.com/user-attachments/assets/ed7ca6ad-8d6a-4eb8-a0d9-790749a1c0d7" />

- **UNPIVOT**: PIVOT 반대

- **문법 비교**
  > <img width="654" height="220" alt="image" src="https://github.com/user-attachments/assets/7722be5c-3632-48df-91d2-450379297e0a" />

</details>

<details>
  <summary><strong> 🔟 정규표현식 </stong></summary>

- **REGEXP_SUBSTR**: 문자열에서 특정 패턴에 맞는 부분 추출 함수
  > <img width="391" height="124" alt="image" src="https://github.com/user-attachments/assets/87e0dba3-970e-4c91-bd72-2fe76b0677b9" />

- **정규 표현식 기본 연산자**

> <img width="651" height="354" alt="image" src="https://github.com/user-attachments/assets/6f87e6d9-2049-4cfa-89d5-e3c9f694088e" />
> <img width="667" height="151" alt="image" src="https://github.com/user-attachments/assets/cf806829-9027-4915-9f86-691b987e158a" />
> <img width="671" height="227" alt="image" src="https://github.com/user-attachments/assets/1db00b7f-6c1f-4980-9cdb-d838620bd18c" />
> <img width="614" height="141" alt="image" src="https://github.com/user-attachments/assets/d551602c-15ce-48ea-9bd7-2c0094e29de0" />

> <img width="667" height="127" alt="image" src="https://github.com/user-attachments/assets/d53c7c42-367d-44ae-b347-f81d345ab3a3" />
> <img width="667" height="291" alt="image" src="https://github.com/user-attachments/assets/977ddf22-9228-4683-bfb6-562af9957965" />

- **REGEXP_REPLACE**: 문자열 내 정규표현식 패턴과 일치하는 부분 찾아 지정한 다른 문자열로 대체
- **REGEXP_INSTR**: 문자열에서 정규표현식 패턴과 일치하는 부분의 위치 반환
- **REGEXP_COUNT**: 문자열 내에서 정규표현식 패턴과 일치하는 부분이 몇 번 나타나는지 계산
- **REGEXP_LIKE 조건**: 정규표현식을 사용하여 문자열 패턴과 일치하는지 여부를 확인하는 조건 식

</details>

---
