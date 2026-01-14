select * from book_list;

delete from book_list where publisher = '북로망스';

# delete는 행단위 전체 삭제됨
# 원하는 곳만 하기 위해서는 update 시행

rollback;
update book_list set writer = null where book_name = '도둑맞은 집중력';

# 조건문 누락 x
# commit 꼭
# rollback 골든 타임안에 꼭!