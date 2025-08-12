# SQL Practice

## SELECT: 데이터베이스에서 데이터 조회할 때 사용
- SELECT column1, column2, ... FROM table_name; (ex. SELECT * FROM 상품)
- 연산할 때에도 사용
  - SELECT 1 + 1; => 2
  - SELECT 가격 + 10 FROM 상품; => 가격에 +10을 한 값이 나
 
- DISTINCT: 중복된 데이터 제거
  - SELECT DISTINCT 상품 ID FROM 주문상세;
  - 중복이 얼마나 제거되었는지 확인하려면
    - SELECT COUNT(DISTINCT 상품 ID) FROM 주문상세;
   
- ORDER BY: 결과 정렬 기본적으로 어름차순
  - SELECT * FROM table_name ORDER BY column_name;
  - DESC: 내림차순, ASC: 오름차순
    - SELECT * FROM table_name ORDER BY column_namne ASC;(or DESC;)
    - 정렬 후 재정렬
      - SELECt * FROM 상품 ORDER BY 가격 DESC, 재고 ASC;

- AS: 열의 별칭 지정
  - SELECT column1 AS alias_name FROM table_name; => column_name을 alias_name으로 지칭할 수 있음
  - SELECT 상품명 AS product_name, 가격 AS price FROM 상품;
  - 연산도 가능
    - SELECT 상품명, 가격 + 1 AS price FROM 상품;
   
## 문자열
- ||: 문자열 연결
  - 수치와 다르게 +가 아닌 ||를 사용하여 문자열 연결
  - SELECT '안녕' || '하세요'; => '안녕하세요'
  - 활용
    - SELECT 상품명 AS 제품이름, 상품명 || '가 ' || (가격 * 0.2) || '할인되어 ' || (가격 * 0.8) || '에 판매합니다!' AS 홍보문구 FROM 상품;
   
## 비교 연산자 (참: 1, 거짓: 0)
- =: 두 값이 같으면 참
- !=, <>: 두 값이 다르면 참
- >, <, >=, <=: 부등호 충족 시 참

- WHERE: 조건 연산
  - SELECT column1, column2 FROM table WHERE column1 >= 500; => column1이 500이상 인것만 조회
  - SELECT column1 FROM table WHERE column1 <> 9; => colum1이 9가 아닌 것만 반환
 
## 논리 연선자 (참: 1, 거짓: 0)
- AND: 두 조건 모두 참일 때 참
  - SELECT column1, column2, column3 FROM table WHERE column2 = 9 AND column3 >= 1000;
    
- OR: 두 조건 중 하나라도 참일 때 참
  - SELECT column1, column2, column3 FROM table WHERE column2 = 9 OR column3 >= 100;
    
- NOT: 조건이 거짓일 때 참
  - SELECT column1, column2, column3 FROM table WHERE NOT colum2 = 9;
 
## BETWEEN
- BETWEEN: 특정 값이 두 값 사이에 있을 때 참 반환. 주로 필터링할 때 사용
- 수치
  - SELECT 상품명, 가격 FROM 상품 WHERE 가격 BETWEEN 5000 AND 10000;
- 날짜
  - SELECT 주문ID, 주문날짜 FROM 주문 WHERE 주문날짜 BETWEEN '2025-01-02' AND '2025-06-02';
- 문자
  - SELECT 상품명 FROM 상품 WHERE 상품명 BETWEEN 'A' AND 'T';
