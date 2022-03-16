-- ---------- 2번 ---------------------------------------------------
DROP DATABASE IF EXISTS 학사관리_db;
DROP USER IF EXISTS haksa@localhost;
CREATE DATABASE 학사관리_db;
CREATE USER haksa@localhost IDENTIFIED WITH mysql_native_password BY 'qwer1234!';
GRANT ALL PRIVILEGES ON 학사관리_db.* TO haksa@localhost WITH GRANT OPTION; 

SHOW DATABASES;

USE 학사관리_db;

SHOW TABLES;

CREATE TABLE 학과(
	학과번호 VARCHAR(5) NOT NULL,
    학과명 VARCHAR(50) NOT NULL,
    학과전화번호 VARCHAR(20) NOT NULL,
	PRIMARY KEY (학과번호)
);
DESC 학과;

CREATE TABLE 학생(
	학생번호 VARCHAR(10) NOT NULL,
    학생이름 VARCHAR(50) NOT NULL,
    학생주민번호 VARCHAR(14) NOT NULL UNIQUE,
    학생주소 VARCHAR(50) NOT NULL,
    학생전화번호 VARCHAR(20) NOT NULL,
    학생이메일 VARCHAR(50) NOT NULL,
    소속학과번호 VARCHAR(5) NOT NULL,
    PRIMARY KEY (학생번호),
    FOREIGN KEY (소속학과번호) REFERENCES 학과(학과번호)
);
DESC 학생;

CREATE TABLE 교수(
	교수번호 VARCHAR(5) NOT NULL,
    교수이름 VARCHAR(50) NOT NULL,
    교수주민번호 VARCHAR(14) NOT NULL UNIQUE,
    교수주소 VARCHAR(50) NOT NULL,
    교수전화번호 VARCHAR(20) NOT NULL,
    교수이메일 VARCHAR(50) NOT NULL,
    소속학과번호 VARCHAR(5) NOT NULL,
    PRIMARY KEY (교수번호),
    FOREIGN KEY (소속학과번호) REFERENCES 학과(학과번호)
);
DESC 교수;

CREATE TABLE 학기정보(
	학생번호 VARCHAR(10) NOT NULL,
    교수번호 VARCHAR(5) NOT NULL,
    학년학기정보 VARCHAR(20) NOT NULL,
    PRIMARY KEY (학생번호, 교수번호),
    FOREIGN KEY (학생번호) REFERENCES 학생(학생번호),
    FOREIGN KEY (교수번호) REFERENCES 교수(교수번호)
);
DESC 학기정보;

CREATE TABLE 강좌(
	강좌번호 VARCHAR(3) NOT NULL,
    교수번호 VARCHAR(5) NOT NULL,
    강좌명 VARCHAR(50),
    취득학점 VARCHAR(20),
    강의시간 DATE,
    강의실 VARCHAR(20),
    PRIMARY KEY (강좌번호, 교수번호),
    FOREIGN KEY (교수번호) REFERENCES 교수(교수번호)
);
DESC 강좌;

CREATE TABLE 수강내역(
	출석점수 INTEGER,
    중간고사점수 VARCHAR(45),
    기말고사점수 VARCHAR(45),
    기타점수 VARCHAR(45),
    총점 VARCHAR(45),
    평점 VARCHAR(45),
    학생번호 VARCHAR(10) NOT NULL,
    강좌번호 VARCHAR(3) NOT NULL,
    교수번호 VARCHAR(5) NOT NULL,
    PRIMARY KEY (학생번호, 강좌번호, 교수번호),
    FOREIGN KEY (학생번호) REFERENCES 학생(학생번호),
    FOREIGN KEY (강좌번호, 교수번호) REFERENCES 강좌(강좌번호, 교수번호)
);
DESC 수강내역;

-- ---------- 3번 ----------
INSERT INTO 학과 VALUES ('10010', '체육학과', '02-1521-1881');
INSERT INTO 학과 VALUES ('10020', '컴퓨터학과', '02-1522-2882');
INSERT INTO 학과 VALUES ('10030', '종교학과', '02-1523-3883');
INSERT INTO 학과 VALUES ('10040', '음악학과', '02-1524-4884');
INSERT INTO 학과 VALUES ('10050', '사회복지학과', '02-1525-5885');
INSERT INTO 학과 VALUES ('10060', '투자전문학과', '02-1526-6886');
INSERT INTO 학과 VALUES ('10070', '철학과', '02-1527-7887');
INSERT INTO 학과 VALUES ('10080', '경제학과', '02-1528-8888');
INSERT INTO 학과 VALUES ('10090', '미술학과', '02-1529-9889');
INSERT INTO 학과 VALUES ('10100', '국어국문학과', '02-1530-0880');
SELECT * FROM 학과;

INSERT INTO 학생 VALUES ('2022010111', '김연아', '030129-2665513', '서울시 관악구 1-9', '010-1577-2255', 'yeonA03@gmail.com', '10010');
INSERT INTO 학생 VALUES ('2022010112', '박찬호', '021231-1395567', '서울시 강남구 160-6', '010-3557-4567', 'chano@gmail.com', '10010');
INSERT INTO 학생 VALUES ('2022010121', '빌 게이츠', '030609-1254561', '뉴욕시 맨하튼 55-1405', '010-1588-6875', 'bill@naver.com', '10020');
INSERT INTO 학생 VALUES ('2022010122', '안철수', '030505-1153731', '인천시 남구 101-55', '010-4949-7221', 'chulsoo0505@naver.com', '10020');
INSERT INTO 학생 VALUES ('2022010131', '간디', '031111-1595361', '부산시 중구 557-44', '010-8135-6672', 'gandi79@naver.com', '10030');
INSERT INTO 학생 VALUES ('2022010141', '모짜르트', '030229-1658731', '인천시 계양구 12-13', '010-2288-6436', 'bachBWV1007@naver.com', '10040');
INSERT INTO 학생 VALUES ('2022010161', '워렌 버핏', '030808-1455375', '부천시 원미동 575-5531', '010-8731-1177', 'samsung44@google.com', '10060');
INSERT INTO 학생 VALUES ('2022010162', '피터 린치', '040120-1854475', '서울시 강북구 1-1', '010-8131-2775', 'kiahyundai2004@google.com', '10060');
INSERT INTO 학생 VALUES ('2022010171', '니체', '041103-1858855', '광주시 남구 441-17', '010-1857-0374', 'abcccnichi@naver.com', '10070');
INSERT INTO 학생 VALUES ('2022010181', '애덤 스미스', '030301-1451875', '인천시 서구 17-1', '010-8135-1857', 'iadam21@naver.com', '10080');
INSERT INTO 학생 VALUES ('2022010182', '이명박', '030714-1224573', '서울시 강남구 99-315', '010-5677-9880', 'primemb4979@naver.com', '10080');
INSERT INTO 학생 VALUES ('2022010191', '백남길', '030928-1664508', '서울시 마포구 55-1313', '010-0753-1752', '100southroad1004@gmail.com', '10090');
INSERT INTO 학생 VALUES ('2022010192', '반 고흐', '030125-1678201', '인천시 연수구 23-4', '010-8221-9006', 'noneleftear@gmail.com', '10090');
INSERT INTO 학생 VALUES ('2022010101', '김소월', '040130-1915867', '서울시 동대문구 1007-5', '010-5199-4987', 'sowalkim0401@naver.com', '10100');
SELECT * FROM 학생;

INSERT INTO 교수 VALUES ('21000', '최체육', '580512-2559630', '서울시 강남구 12-980', '010-3314-2990', 'healthpower58@gmail.com', '10010');
INSERT INTO 교수 VALUES ('22000', '김퓨터', '650107-1256521', '인천시 계양구 31-44770', '010-2487-3215', 'computer486@naver.com', '10020');
INSERT INTO 교수 VALUES ('23000', '이교회', '800322-2325612', '서울시 마포구 88-113', '010-8321-4544', 'churchlove@naver.com', '10030');
INSERT INTO 교수 VALUES ('24000', '김뮤직', '901201-2662177', '부산시 중구 987-9912', '010-6548-6632', 'musicismylife33@gmail.com', '10040');
INSERT INTO 교수 VALUES ('25000', '이사회', '751109-1595530', '서울시 노원구 654-01', '010-5531-7731', 'shlee7511@naver.com', '10050');
INSERT INTO 교수 VALUES ('26000', '나투기', '890204-1536766', '천안시 서북구 321-33', '010-1575-8675', 'etf100per@naver.com', '10060');
INSERT INTO 교수 VALUES ('27000', '이철학', '600422-1357576', '서울시 은평구 777-120', '010-4582-1252', 'nanalike60@gmail.com', '10070');
INSERT INTO 교수 VALUES ('28000', '신경제', '710911-1987230', '서울시 도봉구 3-9', '010-5828-2457', 'kyungje500good@gmail.com', '10080');
INSERT INTO 교수 VALUES ('29000', '김그림', '910128-2872263', '서울시 강남구 5-77215', '010-6402-9167', 'grimniceart@naver.com', '10090');
INSERT INTO 교수 VALUES ('30000', '김한글', '761129-1876540', '서울시 송파구 22-8871', '010-5215-4333', 'sejongking10000se@gmail.com', '10100');
SELECT * FROM 교수;

INSERT INTO 학기정보 VALUES ('2022010111', '21000', '1학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010112', '21000', '2학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010121', '22000', '2학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010122', '22000', '1학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010131', '23000', '1학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010141', '24000', '1학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010161', '26000', '2학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010162', '26000', '1학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010171', '27000', '1학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010181', '28000', '1학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010182', '28000', '1학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010191', '29000', '3학년 2학기');
INSERT INTO 학기정보 VALUES ('2022010192', '29000', '4학년 1학기');
INSERT INTO 학기정보 VALUES ('2022010101', '30000', '3학년 2학기');
SELECT * FROM 학기정보;

INSERT INTO 강좌 VALUES ('110', '21000', '체력단련', '2', '2022-03-02', '제1강의실');
INSERT INTO 강좌 VALUES ('160', '26000', '스윙매매', '3', '2022-03-05', '제8강의실');
INSERT INTO 강좌 VALUES ('190', '29000', '풍경스케치', '1', '2022-03-18', '제5강의실');
SELECT * FROM 강좌;

INSERT INTO 수강내역 VALUES (75, '90', '70', '55', '290', '3', '2022010111', '110', '21000');
INSERT INTO 수강내역 VALUES (66, '87', '99', '80', '332', '4', '2022010112', '110', '21000');
INSERT INTO 수강내역 VALUES (50, '88', '87', '35', '260', '3', '2022010161', '160', '26000');
INSERT INTO 수강내역 VALUES (100, '100', '99', '99', '398', '5', '2022010162', '160', '26000');
INSERT INTO 수강내역 VALUES (80, '54', '99', '91', '324', '4', '2022010191', '190', '29000'); 
SELECT * FROM 수강내역;

-- ---------- 4번 ---------------------------------------------------
SELECT *
FROM 학생;

SELECT 학생.학생번호 학번, 학생.학생이름 성명
FROM 학생 LEFT OUTER JOIN 수강내역 ON 학생.학생번호=수강내역.학생번호
WHERE 수강내역.학생번호 IS NULL;

-- ---------- 5번 ---------------------------------------------------
SELECT 교수.교수번호 교번, 교수.교수이름 교수명, 학생.학생번호 학번, 학생.학생이름 학생명
FROM 교수 JOIN 학생 ON 교수.소속학과번호=학생.소속학과번호
ORDER BY 교수.교수이름;

-- ---------- 6번 ---------------------------------------------------
SELECT *
FROM 학과;

UPDATE 학과 SET 학과.학과명='컴퓨터공학과' WHERE 학과.학과명='컴퓨터학과';

SET foreign_key_checks = 0;
UPDATE 학과 SET 학과.학과번호='0111' WHERE 학과.학과번호='10020';
SET foreign_key_checks = 0;

SELECT *
FROM 학과;

-- ---------- 7번 ---------------------------------------------------
SELECT *
FROM 교수;

DELETE 교수.* FROM 교수 LEFT OUTER JOIN 강좌 ON 교수.교수번호=강좌.교수번호 WHERE 강좌.교수번호 IS NULL;

SELECT *
FROM 교수;






