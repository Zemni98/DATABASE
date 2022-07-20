USE sqldb;

-- 학생 테이블 생성
CREATE TABLE stdtbl(
	std_name VARCHAR(10) NOT NULL PRIMARY KEY,
    std_addr VARCHAR(5) NOT NULL
);

-- 동아리 테이블 생성
CREATE TABLE clubtbl(
	club_name VARCHAR(10) NOT NULL PRIMARY KEY,
    club_room VARCHAR(5) NOT NULL
);

-- 학생 동아리 테이블 생성
CREATE TABLE stdclubtbl(
	num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	std_name 	VARCHAR(10) NOT NULL ,
	club_name 	VARCHAR(10) NOT NULL ,
    FOREIGN KEY(std_name) REFERENCES stdtbl(std_name),
    FOREIGN KEY(club_name) REFERENCES clubtbl(club_name)
);

-- 학생 테이블 데이터 삽입
INSERT INTO stdtbl VALUES ('김범수', '경남');
INSERT INTO stdtbl VALUES ('성시경', '서울');
INSERT INTO stdtbl VALUES ('조용필', '경기');
INSERT INTO stdtbl VALUES ('은지원', '경북');
INSERT INTO stdtbl VALUES ('바비킴', '서울');

-- 동아리 테이블 데이터 삽입
INSERT INTO clubtbl VALUES ('수영', '101');
INSERT INTO clubtbl VALUES ('바둑', '102');
INSERT INTO clubtbl VALUES ('축구', '103');
INSERT INTO clubtbl VALUES ('봉사', '104');

-- 학생 동아리 테이블 데이터 삽입
INSERT INTO stdclubtbl VALUES (NULL,'김범수', '바둑');
INSERT INTO stdclubtbl VALUES (NULL,'김범수', '축구');
INSERT INTO stdclubtbl VALUES (NULL,'조용필', '축구');
INSERT INTO stdclubtbl VALUES (NULL,'은지원', '축구');
INSERT INTO stdclubtbl VALUES (NULL,'은지원', '봉사');
INSERT INTO stdclubtbl VALUES (NULL,'바비킴', '봉사');


-- 학생을 기준으로 학생이름, 지역, 가입한 동아리, 동아리방 번호를 출력하세요!
SELECT S.std_name, S.std_addr, SC.club_name, C.club_room
FROM stdtbl S -- AS와 같이 한칸 띄고 입력하면 입력한 문자로 줄여서 쓸 수 있다.
	INNER JOIN stdclubtbl SC -- 이제 userTBL 대신 U를 사용하면된다.
    ON S.std_name = SC.std_name
    INNER JOIN clubtbl C
    ON SC.club_name = C.club_name
    ORDER BY S.std_name;