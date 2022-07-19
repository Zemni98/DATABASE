USE sqldb;

SELECT * FROM usertbl;
-- SELECT * FROM usertbl WHERE name = '김경호';
-- -- 1970년 이후에 출생하고 신장이 182인 사람의 아이디로 이름일 조회하세요!
SELECT userID, name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;
    
-- 1970년 이후에 출생하거나 신장이 182인 사람의 아이디로 이름일 조회하세요!
SELECT userID, name FROM usertbl WHERE birthYear >= 1970 OR height >= 182;

-- 키가 180 ~ 183인 사람의 이름과 키를 조회하세요!
SELECT name, height FROM usertbl WHERE height >= 180 AND height <= 183;
SELECT name, height FROM usertbl WHERE height  BETWEEN 180 AND 183;

-- 지역이 경남, 전남, 경북인 사람의 이름과 지역만 조회하세요!
SELECT name,addr FROM usertbl WHERE addr = '경남' OR addr = '전남' OR addr = '경북';
SELECT name,addr FROM usertbl WHERE addr in ('경남','전남','경북');

-- 성이 김씨인 사람들의 이름과 키를 조사하세요!
SELECT name,height FROM usertbl WHERE name LIKE '김%';
-- "%"는 0개 이상의 글자를 지칭한다. "_"는 한글자를 지칭한다.

-- 김경호보다 키가 크거나 같은 사람의 이름과 키를 조회하세요!
SELECT name,height FROM usertbl WHERE height >= (SELECT height FROM usertbl WHERE name = '김경호');
-- 서브쿼리 이용하는 방법

-- 지역의 '경남'인 사람의 키보다
-- 키가 크거나 같은 사람을 조회하세요!
SELECT name,height FROM usertbl WHERE height >= (SELECT MIN(height) FROM usertbl WHERE addr = '경남');
-- 지역이 경남인 사람의 키중 최솟값 추출
SELECT name,height FROM usertbl WHERE height >= ANY(SELECT height FROM usertbl WHERE addr = '경남');
-- ANY 경남권인 사람의 키인 177이나 173보다 크거나 같은 경우의 로우들을 모두 불러오게 된다. 

-- 가입한 순서대로 출력하세요!
SELECT name, mDate FROM usertbl ORDER BY mDate ASC ;

-- 회원들의 지역을 중복을 제거하고 출력하세요!
SELECT distinct addr FROM usertbl; -- distinct 중복배제

-- 먼저 가입한 순으로 4명만 출력하세요!
SELECT name, mDate FROM usertbl ORDER BY mDate ASC LIMIT 4 ;
-- LIMIT 상위 4명만 출력
SELECT name, mDate FROM usertbl ORDER BY mDate ASC LIMIT 1,2 ;
-- 0번부터 시작하는 1번째 부터 2개 들고오라는 뜻

-- 테이블을 복사하는 전형적인 방법
CREATE TABLE buytbl2(SELECT * FROM buytbl);
-- 기본키,외래키같은 제약조건들은 복사 안되고 data만 복사된다!

-- 구매테이블에서 각 사용자별로 구매한 물품의 개수를 출력하세요!
SELECT userID, SUM(amount)
FROM buytbl
GROUP BY userID;
 
-- 구매테이블에서 각 사용자별 구매액의 총합을 출력하세요!
SELECT userID, SUM(amount * price)
FROM buytbl
GROUP BY userID;