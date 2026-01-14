select * from book_list;

update book_list set reg_date = '20230815' where book_name = '도둑맞은 집중력';

commit;

# 항상 조건절 누락되지 않도록
# 변경할 데이터는 해당 칼럼의 데이터 타입과 사이즈에 맞게
# 꼭 커밋 해주기!
# 잘못하면 rollback 하자