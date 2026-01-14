# window function (창문이라는 뜻)

select * from idol_member;

# 같은 멤버에 동일한 값
select group_name,
	count(*) over(partition by group_name) as member_cnt
from idol_member;
    
select group_name,
	min(birthdate) over(partition by group_name) as member_min
from idol_member;

# grourp by 구문 비교
select group_name, max(birthdate) from idol_member group by group_name;

# 순위 매기는 함수
## row_number, rank, dense_rank
## row_number는 동일 순위여도 랜덤으로 유니크 순위 부여
## rank는 동일 순위면 같은 순위로 부여 but 그 수만큼 다음 순위 건너뜀
## dense_rank는 동일 순위면 같은 순위 부여 건너뛰기 없음

select first_name, last_name, department_id, salary,
	row_number() over(partition by department_id order by salary desc) as row_no,
    rank() over(partition by department_id order by salary desc) as rank_no,
    dense_rank() over(partition by department_id order by salary desc) as dense_rank_no
from employees
order by department_id, row_no;
