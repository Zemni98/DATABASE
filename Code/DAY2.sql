
USE sqldb;

CREATE TABLE testtbl1 (
	id 			INT,
    userName	CHAR(3),
    age			INT
);
SELECT * FROM testtbl1;
-- 일반적인 INSERT 구문
INSERT INTO testtbl1 VALUES(1, '아이유', 25); -- 모든 데이터를 다 삽입해야한다.
-- 필요한것만 선택해서 데이터 삽입
INSERT INTO testtbl1(id,userName) VALUES(2, '신재민'); -- 특정 데이터만 선택해서 삽입할 수 있다.
INSERT INTO testtbl1(userName,id) VALUES('위수민',3); -- 순서를 맞출 필요는 없다.

-- auto_increment : 숫자형식만 가능, PRIMARY KEY or UNIQUE한 값이여야 한다.
CREATE TABLE testtbl2 (
	id 			INT auto_increment PRIMARY KEY,
    userName	CHAR(3),
    age			INT
);
SELECT * FROM testtbl2;

INSERT INTO testtbl2 VALUES(NULL,'신재민',25);
INSERT INTO testtbl2(userName,age) VALUES('위수민',23);

ALTER TABLE testtbl2 AUTO_INCREMENT = 100; -- 현재 auto_incremetn값을 설정할 수 있다.
INSERT INTO testtbl2(userName,age) VALUES('아이유',30); -- id: 100으로 설정된다.

set @@auto_increment_increment = 5;
INSERT INTO testtbl2(userName,age) VALUES('김다미',30); -- id: 100으로 설정된다.

SET @@auto_increment_increment = 3;
INSERT INTO testtbl2(userName,age) VALUES('김다미',31); -- id: 100으로 설정된다.

SET @@auto_increment_increment = 20;
INSERT INTO testtbl2 VALUES(NULL,'김다미',32); -- id: 100으로 설정된다.

CREATE TABLE testtbl3 (
	id 		INT,
    fname	VARCHAR(50),
    lname	VARCHAR(50)
);

INSERT INTO testtbl3
SELECT emp_no, first_name, last_name
FROM employees.employees;

SELECT * FROM testtbl3;

START TRANSACTION;
-- UPDATE 구문
UPDATE testtbl3
SET lname = '없음'
WHERE fname = 'Kyoichi';
SELECT * FROM testtbl3 WHERE fname = 'Kyoichi';
ROLLBACK;

-- MySQL이 제공하는 문자열 실수
SELECT  CHAR_LENGTH('abcde'),
		CHAR_LENGTH('홍길동'), -- 문자열의 개수를 샐때는 CHAR_LENGTH를 써야한다.
		LENGTH('abcde'),
		LENGTH('홍길동'); -- LENGTH는 byte단위를 샌다 즉 9가 나옴.

SELECT CONCAT ('소리없는', '아우성'), -- 그냥 문자열 연결
		CONCAT_WS('-','2022','02','20'); -- 문자열을 '-'를 이용해서 연결한다.

SELECT FORMAT(1234567.1415234,3); -- 3자리마다 ',' 찍으면서 소수점 아래 3자리까지 반올림하여 표시한다.

SELECT TRIM('         소리없는 아우성                  '), -- 여백 제거
		REPLACE('이것은 소리없는 아우성','소리','양심'),
        SUBSTRING('이것은 소리없는 아우성',3,5); -- 3번째 부터 5글자 가지고 온다. DMBS는 첨자가 1부터 시작한다.

-- 날짜에 관련된 내장함수

SELECT CURDATE(), -- 현재 날짜만 가지고온다.
		NOW(), -- 현재 날짜 + 시,분,초까지 가지고온다.
        YEAR(CURDATE()); -- 현재 년도만 가지고온다.
        
CREATE DATABASE moviedb;
USE moviedb;
CREATE TABLE movieTBL (
	movie_id	INT,
    movie_title	VARCHAR(30),
    movie_script LONGTEXT,
    movie_film LONGBLOB
) DEFAULT CHARSET = utf8mb4;

-- 데이터를 입력!

INSERT INTO movieTBL VALUES(1,'쉰들러 리스트',
	LOAD_FILE('C:/MySQL/Schindler.txt'),
    LOAD_FILE('C:/MySQL/Schindler.mp4')
    );
SELECT * FROM movieTBL;
DELETE FROM movieTBL;
-- 환경설정이 안되어있기 때문에 정상적으로 동작하지 않는다.
-- LOAD_FILE의 크기, 어떤 FOLDER에서 LOADING하는지를 설정해주어야 한다.

SELECT movie_film
FROM movieTBL
WHERE movie_id =1
INTO DUMPFILE 'C:/MySQL/video.output.mp4'

