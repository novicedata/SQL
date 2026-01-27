# string function

## substring(규칙에 맞게 자름)

select substring('밤에 성시경이 두 명 있으면 야간투시경 입니다.', 1, 15) as test from dual; # 1부터 15 char 까지 자르기

select substring('밤에 성시경이 두 명 있으면 야간투시경 입니다.', 17) as test from dual; # 17 char 부터 끝까지 자르기

select substr('밤에 성시경이 두 명 있으면 야간투시경 입니다.', 1, 15) as test from dual;

select substr('밤에 성시경이 두 명 있으면 야간투시경 입니다.', 17) as test from dual;

## length, concat, upper, lower

select length('밤에 성시경이 두 명 있으면 야간투시경 입니다.') as test from dual; # 바이트 계산(길이) - 한글은 3바이트

select concat('밤에 성시경이 두 명 있으면', ' 그것은 야간투시경 입니다.') as test from dual; # 합치기

select upper('Holly Molly') as test from dual; # 대문자

select lower('Holly Molly') as test from dual; # 대문자

## trim, instr, replace, lpad

select trim(' 밤에 성시경이 두명 있다면 그것은 야간 투시경입니다. ') as test from dual; # 깔끔하게 앞뒤 공백 정리

select instr('밤에 성시경이 두명 있다면 그것은 야간 투시경입니다.', '야간 투시경') as test from dual; # 찾고자 하는거 몇번째 있는지

select replace('밤에 성시경이 두명 있다면 그것은 야간 투시경입니다.', '성시경', '신연우') as test from dual; # 원하는 부분 찾아서 바꿔주기

select lpad('밤에 성시경이 두명 있다면 그것은 야간 투시경입니다.', 33, '*') as test from dual; # input으로 주어진 문자열이 자리수 못채우면 원하는 값으로 채우기