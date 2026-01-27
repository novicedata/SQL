# num function

## round

select round(82.662) from dual; # 반올림

select round(82.662, 1) from dual; # 반올린 (1의 자리)

select round(82.662, 2) from dual; # 반올림 (2의 자리)

select round(-82.662) from dual; # 반올림

## floor, ceil

select floor(82.662) from dual; # 소수점 버림

select floor(-82.662) from dual; # 소수점 버림

select ceil(82.662) from dual; # 소수점 올림

select ceil(-82.662) from dual; # 반내림

## abs, sign, mod

select abs(82.882) from dual; # 절대값

select abs(-82.882) from dual; # 절대값

select sign(82.882) from dual; # 양수면 1

select sign(-82.882) from dual; # 음수면 -1

select mod(40, 6) from dual; # 나머지

select mod(-40, 6) from dual; # 나머지