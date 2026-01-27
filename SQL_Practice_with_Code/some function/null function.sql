# null function

## ifnull, coalesce

select ifnull('실제데이터', '대체값') from dual; # null 이면 대체
select ifnull(null, '대체값') from dual;

select coalesce('데이터1', '데이터2', '데이터3') from dual; # 주어진 argument중 null이 아닌 최초 값 반환
select coalesce(null, '데이터2', '데이터3') from dual;
select coalesce(null,null, '데이터3') from dual;

## nullif, isnull

select nullif('데이터', '데이터') from dual; # 같으면 null
select nullif('데이터', '데이터1') from dual; # 다르면 첫번째 return

select isnull('데이터') from dual; # null1이면 1 반환
select isnull(null) from dual;