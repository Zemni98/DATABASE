select distinct(userID)
from buytbl;
start transaction;

delete from buytbl; -- 삭제했지만 아직 저장소에는 반영이 안됬다.
commit; -- 커밋을 시키면 저장소에 반영되서 2차 저장소에도 저장된다.
rollback; -- 그래서 rollback으로 트렌젝션 실행 이후에 한 작업들을 원상태로 되돌릴 수 있다.
-- 우리가 했던 SQL문은 auto commit mode여서 실행하자마자 반영됬던것이다.