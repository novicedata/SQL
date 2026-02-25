### 데이터 모델링과 SQL

---

<details>
  <summary><strong> 1️⃣ 관계형 데이터 베이스 개요 </strong></summary>
  
- **관계형 데이터 베이스(RDB)**: 관계형 데이터 모델에 기초를 둔 데이터베이스
- **RDBMS(Relational Database Management System)**: 이러한 RDB를 관리/감독하기 위한 시스템(오라클, MySQL 등)

- **TABLE**: RDB에서 모든 데이터를 2차원 테이블 형태로 표현

- **SQL(Strucure Query Language)**: RDB에서 데이터 다루기 위해 사용하는 언어
</details>

<details>
  <summary><strong> 2️⃣ SELECT 문 </strong></summary>

- **SELECT**: 저장되어 있는 데이터 조회하고자 할 때 사용하는 명령어
  > `SELECT 칼럼1, 칼럼2, ... FROM 테이블 WHERE 칼럼1 = '응게';`
  > Alias 가능

- **산술 연산자(번호는 사칙연산 우선 순위)**
  - 1. `()` : 괄호로 우선 순위 조정 가능
    2. `*`, `/` : 곱하기, 나누기
    3. `+`, `-` : 더하기, 빼기
    4. `%` : 나머지
   
- **합성 연산자**: `||`. 문자와 문자 연결할 때 사
</details>

<details>
  <summary><strong> 3️⃣ 함수 </strong></summary>

- **문자 함수**
  - **CHR(아스키코드)**: 아스키 코드를 인수로 입력했을 때 매핑되는 문자가 무엇인지 알려줌
    > <img width="279" height="98" alt="image" src="https://github.com/user-attachments/assets/c0db5fc2-4cdd-4179-a896-d2ea8b52a54a" />

  - **LOWER, UPPER**: 소문자, 대문자 변환
 
  - **LTRIM(문자열 [, 특정 문자]), RTRIM(문자열, [, 특정 문자])** *[]는 옵션
    - 특정 문자 따로 명시 X시 문자열의 왼쪽/오른쪽 공백 제거
    - 명시해주면 문자열을 왼쪽/오른부터 한 글자씩 특정 문자와 비교하여 특정 문자에 포한되어 있으면 제거
      > <img width="436" height="124" alt="image" src="https://github.com/user-attachments/assets/3b78acd2-c00c-4c1f-ae97-cdc8fb4e59b8" />

  - **TRIM([위치] [특정 문자] [FROM] 문자열)** *[]는 옵션
    - 옵션 없으면 문자열 왼, 오 모두 제거
    - 옵션 있으면 위치(LEADING, TRAILING, BOTH)로 지정된 곳부터 한 글자씩 비교하여 같으면 제거
      > <img width="544" height="277" alt="image" src="https://github.com/user-attachments/assets/beed0c8b-1587-413b-a506-c532970b5571" />

  - **SUBSTR(문자열, 시작점, [, 길이])** *[]는 옵션
    - 원하는 부분만 잘라서 반환
   
  - **LENGTH(문자열)**: 문자열 길이 반환
 
  - **REPLACE(문자열, 변경 전 문자열 [, 변경 후 문자열])** *[]는 옵션
    - 문자열 내부 변경 전 문자열을 찾아 변경 후 문자열로 변경
    - 옵션 없으면 제거
   
  - **LPAD(문자열, 길이, 문자), RPAD(문자열, 길이, 문자)**
    - 문자열이 설정한 길이가 될 때까지 왼쪽/오른쪽을 특정 문자로 채움

- **숫자 함수**
  - **ABS(수)**: 절댓값 반환
  - **SIGN(수)**: 수의 부호 반환
    
  - **ROUND(수 [, 자릿수])** *[]는 옵션
    - 지절된 소수점 자릿수까지 반올림
   
  - **TRUNC(수 [, 자릿수])** *[]는 옵션
    - 지정된 소수점 자릿수까지 버림
   
  - **CEIL(수)**: 소수점 이하의 수 올림한 정수 반환
  - **FLORR(수)**: 소수점 이하의 수 버림한 정수 반환
 
  - **MOD(수1, 수2)**: 수1을 수2로 나눈 나머지 반환
 
- **날짜 함수**
  - SYSDATE: 현재의 연, 월, 일, 시, 분, 초 반환
    
  - **EXTRACT(특정 단위 FROM 날짜 데이터)**
    - 특정 단위(YEAR, MONTH, DAY, HOUR, MINUTE, SECOND)만을 반환
   
  - **ADD_MONTHS(날짜 데이터, 특정 개월 수)**
    - 날짜 데이터에서 특정 개월 수 더한 날짜 반환
   
- **변환 함수**
  - **명시적 형변환**: 변환 함수를 사용하여 데이터 유형 변환을 명시적으로 나타냄
    - **TO_NUMBER(문자열)**: 문자열 to 숫자형
    - **TO_CHAR(수 or 날짜 [,포맷])** *[]는 옵션
      - 수 or 날짜 to 문자열
    - **TO_DATE(문자열, 포맷)**: 포맷 형식의 문자형 to 날짜형
      > <img width="628" height="149" alt="image" src="https://github.com/user-attachments/assets/f245a7a8-549e-4e3d-9bfe-9b8e315778cf" />

  - **암시적 형변환**: 데이터 베이스가 내부적으로 알아서 데이터 유형 변환
 
- **NULL 관련 함수**
  - **NVL(인수1, 인수2)**: 인수1이 NULL일 경우 인수2 반환, 아닐 경우 인수1 반환
  - **NULLIF(인수1, 인수2)**: 인수1, 인수2가 같으면 NULL 반환, 아닐 경우 인수1 반환
  - **COALESCE(인수1, 인수2)**: NULL이 아닌 최초의 인수 반환
  - **NVL2(인수1, 인수2, 인수3)**: 인수1이 NULL일 경우 인수3 반환, 아닐 경우 인수2 반환
 
- **CASE**
  - 파이썬에 if, elif, else절과 유사하다고 보면 됨
    > <img width="646" height="326" alt="image" src="https://github.com/user-attachments/assets/35d672ce-f535-4f06-8acb-4c010b1c257f" />
</details>

<details>
  <summary><strong> 4️⃣ WHERE 절 </stong></summary>

- 원하는 파트만 골라 수행할 수 있는 조건문

- **비교 연산자**
  - `=, <, <=, >, <=`: 같음, 작음, 작거나 같음, 큼, 크거나 같음
    > `where col = 10` 등

- **부정 비교 연산자**
  - `!=, ^=, <>, not 칼럼명=` : 같지 않음
  - `not 칼럼명 >` : 크지 않음
 
- **SQL 연산자**
  - `BETWEEN A AND B` : A와 B사이 포함 여부
  - `LIKE '비교 문자열'` : 비교 문자열 포함 여부
  - `IN (LIST)` : LIST 중 하나의 값과 일치 여부
  - `IS NULL` : NULL 값

- **부정 SQL 연산자**
  - `NOT BETWEEN A AND B` : A와 B사이 포함 아님 여부
  - `NOT IN (LIST)` : LIST 값중 일치하는 것 없음 여부
  - `IS NOT NULL` : NULL 값 아님

- **논리 연산자**
  - `AND`: 모든 조건 TRUE여야
  - `OR`: 하나 이상의 조건이 TRUE여야
  - `NOT`: TRUE면 FALSE, FALSE면 TRUE 
</details>

<details>
  <summary><strong> 5️⃣ GROUP BY, HAVING 절 </stong></summary>

- **GROUP BY**: 데이터를 그룹별로 묶을 수 있게 해줌

- **집계 함수**: 그룹별로 나눈 후 그룹별 집계 데이터 도출에 사용되는 함수
  - `COUNT, SUM, AVG, MIN, MAX`: 총계, 총합, 평균, 최소, 최대
  - `COUNT(DISTINCT 칼럼)`: 칼럼에서 NULL이 아닌 행에서 중복제거한 총계
 
- **HAVING**: GROUP BY절 사용할 때 WHERE절 처럼 사용하는 조건절
  - 쿼리 수행 순서에 따라 알맞게 사용해야 함
    > <img width="207" height="193" alt="image" src="https://github.com/user-attachments/assets/eda1e9dc-6d36-430e-ae28-e278441dd72d" />

</details>

<details>
  <summary><strong> 6️⃣ ORDER BY 절 </stong></summary>

- **ORDER BY**: 데이터 정렬
  - **ASC, DECS**: 오름차순, 내림차순
</details>

<details>
  <summary><strong> 7️⃣ JOIN </stong></summary>

- **JOIN**: 각기 다른 테이블을 한 번에 보여줄 때

- **EQUI JOIN**: Equal(=)을 조건으로 JOIN하는 가장 흔한 JOIN 방식
  > <img width="630" height="462" alt="image" src="https://github.com/user-attachments/assets/f93a1ee1-09fb-4d4e-8ee0-f3f48cb4e87a" />

- **Non EQUI JOIN**: Equal이 아닌 다른 조건 (BETWEEN, >, < 등)으로 JOIN하는 방식
  > <img width="604" height="446" alt="image" src="https://github.com/user-attachments/assets/72b143fd-6cf7-48a2-a9d6-68c10c9fc675" />

- **3개 이상 TABLE JOIN**
  > <img width="533" height="241" alt="image" src="https://github.com/user-attachments/assets/c612d53f-725d-4a28-ad21-95ee7ec12b7a" />

- **OUTER JOIN**: JOIN 조건에 만족하지 않는 행들도 출력되는 형태
  > <img width="485" height="323" alt="image" src="https://github.com/user-attachments/assets/852adc97-d2b4-476d-92bf-bce56015bd3d" />
  > <img width="613" height="460" alt="image" src="https://github.com/user-attachments/assets/0e31e8a9-6ab2-4b23-8bf4-a450ac489aff" />

</details>

<details>
  <summary><strong> 8️⃣ STANDARD JOIN </stong></summary>

- **STANDARD JOIN**: 표준이 되는 ANSI SQL중 하나로 어느 RDBMS에서든 사용 가능

- **INNER JOIN**: JOIN 조건에 충족하는 데이터만 출력되는 방식
  > <img width="232" height="141" alt="image" src="https://github.com/user-attachments/assets/55bcd769-150b-416c-88dd-1e0cfb38ad41" />

- **OUTER JOIN**: JOIN에 충족하는 데이터가 아니어도 출력될 수 있는 방식
  - **LEFT OUTER JOIN**: 왼쪽에 표기된 테이블의 데이터는 무조건 출력되는 JOIN
    > <img width="616" height="384" alt="image" src="https://github.com/user-attachments/assets/088d3577-eaad-4121-9ab6-36782a3462f3" />
    > <img width="658" height="230" alt="image" src="https://github.com/user-attachments/assets/04334e7f-63b9-475f-915d-7519784cb631" />

  - **RIGHT OUTER JOIN**: 오른쪽에 표기된 테이블의 데이터는 무조건 출력되는 JOIN
    > <img width="650" height="610" alt="image" src="https://github.com/user-attachments/assets/714a5d0f-908b-4801-9cd6-2562d69408c1" />

  - **FULL OUTER JOIN**: 왼쪽, 오른쪽 테이블 데이터가 모두 출력되는 JOIN
    > <img width="239" height="150" alt="image" src="https://github.com/user-attachments/assets/972bc683-9493-4cdc-b342-388586068bd9" />
    > <img width="327" height="245" alt="image" src="https://github.com/user-attachments/assets/7aa0017f-31f0-455f-bb6c-3c2c53c397dc" />
    > <img width="611" height="578" alt="image" src="https://github.com/user-attachments/assets/2da82a3d-4bdf-4357-a729-f787834806b1" />

- **NATURAL JOIN**: A 테이블과 B 테이블에서 같은 이름을 가진 칼럼들이 모두 동일한 데이터를 가지고 있을 경우 JOIN되는 방식
  > <img width="562" height="585" alt="image" src="https://github.com/user-attachments/assets/1b7fdc1f-efa5-435f-a111-43fe62ac6ff2" />

- **CROSS JOIN**: A 테이블과 B 테이블 사이 JOIN 조건이 없는 경우 조합할 수 있는 모든 경우를 출력
  > <img width="563" height="679" alt="image" src="https://github.com/user-attachments/assets/a3878c55-9033-4d52-a212-eba6f31eb2e0" />
</details>

---
