### 데이터 모델링과 SQL

---

<details>
  <summary><strong> 1️⃣ 정규화 </strong></summary>
  
- **정규화**: 데이터 정합성을 위해 엔터티를 작은 단위로 분리하는 과정
  > 정규화가 무조건 성능 향상 X. 무리한 정규화는 성능 저

- **제1정규형**: 모든 속성을 반드시 하나의 값만 가져야
  > <img width="598" height="217" alt="image" src="https://github.com/user-attachments/assets/eb25553a-64cc-421b-a527-5e826ae8f67c" />

- **제2정규형**: 엔터티의 모든 일반속성은 반드시 모든 주식별자에 종속되어야 한다.
  > <img width="648" height="295" alt="image" src="https://github.com/user-attachments/assets/7f75005b-1503-4905-b7a5-2edbc478e186" />

- **제3정규형**: 주식별자가 아닌 모든 속성간에는 서로 종속될 수 없다.
  > <img width="673" height="299" alt="image" src="https://github.com/user-attachments/assets/8a859b62-4640-4e6e-9588-bcc987159ced" />

</details>

<details>
  <summary><strong> 2️⃣ 반정규화 </strong></summary>

- **반정규화**: 데이터 조회 성능 향상위해 중복 허용, 데이터 그룹

- **1. 테이블 반정규화**
  - 테이블 병합
    > <img width="641" height="285" alt="image" src="https://github.com/user-attachments/assets/1a2b62bd-41c6-4d3d-b1f3-06247cd2e0de" />
    > <img width="644" height="266" alt="image" src="https://github.com/user-attachments/assets/6fae5659-38ab-44a3-b284-b8f80b9a5931" />

  - 테이블 분할
    > <img width="621" height="282" alt="image" src="https://github.com/user-attachments/assets/220eb785-2466-4b0f-897c-dec6f1dc63b5" />
    > <img width="647" height="303" alt="image" src="https://github.com/user-attachments/assets/64c90227-721d-4c2b-ac70-bf3f597a0bdd" />

  - 테이블 추가
    > <img width="651" height="351" alt="image" src="https://github.com/user-attachments/assets/9afad406-8777-4bf9-96b4-7b6c07397e49" />
    > <img width="537" height="181" alt="image" src="https://github.com/user-attachments/assets/0b7d8602-8921-48ca-9380-586a5ea59ec5" />
    > <img width="622" height="233" alt="image" src="https://github.com/user-attachments/assets/0df18b99-b94d-4150-8dc0-95979dfc1fac" />

- **2. 칼럼 반정규화**
  - 중복 칼럼 추가
    > 업무 프로세스상 JOIN이 필요한 경우가 많아 칼럼 추가
  - 파생 칼럼 추가
    > 부하가 염려되는 계산값을 미리 칼럼으로 추가
  - 이력 테이블 칼럼 추가
    > 대량의 이력 테이블을 조회할 때 속도 느려질 것 대비하여 추가

- **3. 관계 반정규화(중복 관계 추가)**
  : 업무 프로세스상 JOIN이 필요한 경우가 많아 칼럼 추
</details>

<details>
  <summary><strong> 3️⃣ 트랜잭션 </strong></summary>

- **트랜잭션**: 데이터를 조작하기 위한 하나의 논리적인 작업 단위
- **특징**
  - 1. 원자성: 더 이상 분리가 불가능한 업무의 최소단위
    2. 일관성: 하나의 트랜잭션이 완료된 후에도 데이터 베이스는 여전히 일관된 상태여야
    3. 고립성: 실행중인 트랜잭션의 중간 결과에 다른 트랜잭션이 접근 X
    4. 지속성: 트랜잭션이 성공적으로 실행 완료되면 결과는 영속적으로 저장

</details>

<details>
  <summary><strong> 4️⃣ NULL </stong></summary>

- 가로 연산(인스턴스 연산): NULL 포함되어 있으면 결과값 NULL
- 세로 연산(Feature 연산): NULL이 포함되어 있으면 빼고 결과냄

</details>

<details>
  <summary><strong> 5️⃣ 본질식별자 vs 인조식별자 </stong></summary>

- **본질식별자**: 업무 프로세스에 존재하는 식별자, 가공되지 않은 원래의 식별자, 원조식별자
- **인조식별자**: 주식별자의 속성이 두 개 이상인 경우 극 속성들을 하나로 묶어 사용하는 식별자, 대리식별자

- <img width="342" height="671" alt="image" src="https://github.com/user-attachments/assets/d9e8ca62-9911-4d05-9245-e3bbf7662808" />

</details>

---
