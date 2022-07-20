
USE sqldb;

-- 구매 테이블에서 'JYP'라는 아이디를 가진 사람이 구매한 물건을
-- 발송하기 위해서 이름과 주소가 필요하다. 이 정보는 usertbl에 존재한다.
-- 두 테이블을 결합해서 결과를 알아내야 한다.
-- 이것이 바로 JOIN!!!!!

-- 표준 방식
SELECT buyTBL.userID, name, addr
FROM buyTBL B -- AS와 같이 한칸 띄고 입력하면 입력한 문자로 줄여서 쓸 수 있다.
	INNER JOIN userTBL U -- 이제 userTBL 대신 U를 사용하면된다.
    ON buyTBL.usERID = userTBL.userID
WHERE buyTBL.USerID = 'JYP';

-- 비표준 방식
SELECT buyTBL.userID, name, addr
FROM buyTBL, userTBL
WHERE buyTBL.userID = USERTBL.UserID;

-- OUTER JOIN
-- usertbl과 buytbl을 이용해서 다음을 구해보아요!
-- 전체 회원의 구매기록을 조회하세요. 단, 구매기록이 없는 회원도
-- 출력되어야 해요!

SELECT U.userID, U.name, B.prodName, U.addr
FROM usertbl U
	LEFT OUTER JOIN buytbl B 
	ON U.userID = B.userID 
ORDER BY U.userID;

-- 한번도 구매한 적이 없는 회원의 목록을 출력하세요.
SELECT U.userID, U.name, B.prodName, U.addr
FROM usertbl U
	LEFT OUTER JOIN buytbl B
	ON U.userID = B.userID
WHERE B.prodName IS NULL -- IS NULL 구문을 이용해서 구매목록이 없는사람을 출력한다.
ORDER BY U.userID;