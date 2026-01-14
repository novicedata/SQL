# case when 구문
## 상황에 따라 데이터를 분기 처리 -> if then else와 비슷

# 단순 case 표현식
## case col
## when val1 then result1
## when val2 then result2
## ...
## else val end

# 검식 case 표현식
## case when col=val1 then res1
##      when col2=val2 then res2
## ...
## else val end

# 단순 case 표현식 (employees 커밋)
select * from employees;
select emp_nm,
case gender
when 'F' then '여자'
when 'M' then '남자'
else '해당없음' end as gender
from employees;

# 검식 case 표현식
select emp_nm,
	case when gender = 'F' then '여자'
		 when gender = 'M' then '남자'
	else '해당없음' end as gender
from employees;

# 범위 조건
select emp_nm, hire_dt,
	case when hire_dt > '20230101000000' then '신규사원'
		 else '기존사원' end as emp_type
from employees;

# 심화
## 위에 있는 줄에 걸리면 아랫줄은 스킵해버림
## 그래서 아래처럼 하면 안됨
select emp_nm, hire_dt,
	case when hire_dt < '20230101' then '기존사원'
		 when hire_dt < '20220101' then '옛날사원'
	else '신규사원' end as emp_type
from employees;

## 제대로된 순서
select emp_nm, hire_dt,
	case when hire_dt < '20220101' then '옛날사원'
		 when hire_dt < '20230101' then '기존사원'
	else '신규사원' end as emp_type
from employees;