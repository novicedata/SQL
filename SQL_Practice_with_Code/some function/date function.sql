# date function

## now, sysdate, current_date

select now() from dual; # 현재 시간
select sysdate() from dual; # 시스템 시간

select now(), sleep(5), now() from dual; # sleep 차이 확인
select sysdate(), sleep(5), sysdate() from dual;

select current_date() from dual; # 년월일

## adddate, last_dat

select adddate(now(), 10) from dual; # 일 수 더하기
select adddate('20230901', 3) from dual; # 일 수 더하기

select last_day(now()) from dual; # 현재 월 마지막 날
select last_day('20231225') from dual; # 지정 월 마지막 날

## year, month, day

select year(now()) from dual;
select month(now()) from dual;
select day(now()) from dual;

select year('20230123') from dual;
select month('20230123') from dual;
select day('20230123') from dual;