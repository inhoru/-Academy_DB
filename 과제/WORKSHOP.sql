--1. 4개 테이블에 포함된 데이터 건 수를 구하는 SQL 구문을 만드는 SQL 구문을 작성하시오.
SELECT COUNT(*) FROM TB_BOOK;
SELECT COUNT(*) FROM TB_WRITER;
SELECT COUNT(*) FROM TB_PUBLISHER;
SELECT COUNT(*) FROM TB_BOOK_AUTHOR;

-- 3. 도서명이 25자 이상인 책 번호와 도서명을 화면에 출력하는 SQL 문을 작성하시오.
SELECT BOOK_NM,ISBN
FROM TB_BOOK
WHERE LENGTH(BOOK_NM)>=25;

-- 4. 휴대폰 번호가 ‘019’로 시작하는 김씨 성을 가진 작가를 이름순으로 정렬했을 때 가장 먼저 표시되는 작가
--이름과 사무실 전화번호, 집 전화번호, 휴대폰 전화번호를 표시하는 SQL 구문을 작성하시오

SELECT *
        FROM(SELECT WRITER_NM,NVL(OFFICE_TELNO,'없음'),NVL(HOME_TELNO,'없음'),MOBILE_NO
                FROM TB_WRITER
                WHERE MOBILE_NO LIKE '019%'
                ORDER BY WRITER_NM)
WHERE ROWNUM =1;

--5. 저작 형태가 “옮김”에 해당하는 작가들이 총 몇 명인지 계산하는 SQL 구문을 작성하시오. 
--(결과 헤더는 “작가(명)”으로 표시되도록 할 것)

SELECT  COUNT(DISTINCT WRITER_NO) AS "작가(명)"
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '옮김';

-- 6. 300권 이상 등록된 도서의 저작 형태 및 등록된 도서 수량을 표시하는 SQL 구문을 작성하시오.
--(저작형태가 등록되지 않은 경우는 제외할 것)

SELECT COMPOSE_TYPE,COUNT(*)
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('지음','엮음')
GROUP BY COMPOSE_TYPE;


-- 7. 가장 최근에 발간된 최신작 이름과 발행일자, 출판사 이름을 표시하는 SQL 구문을 작성하시오
SELECT * 
FROM(SELECT BOOK_NM,ISSUE_DATE,PUBLISHER_NM FROM TB_BOOK ORDER BY 2 DESC)
WHERE ROWNUM =1;

-- 8. 가장 많은 책을 쓴 작가 3명의 이름과 수량을 표시하되, 많이 쓴 순서대로 표시하는 SQL 구문을 작성하시오.
--단, 동명이인(同名異人) 작가는 없다고 가정한다. 
--(결과 헤더는 “작가 이름”, “권 수”로 표시되도록 할것)
SELECT *
FROM(SELECT WRITER_NM,COUNT(WRITER_NO)
FROM TB_BOOK_AUTHOR
    JOIN TB_WRITER USING(WRITER_NO)
GROUP BY WRITER_NM
ORDER BY 2 DESC)
WHERE ROWNUM <=3;

-- 9. 작가 정보 테이블의 모든 등록일자 항목이 누락되어 있는 걸 발견하였다. 누락된 등록일자 값을 각 작가의
--‘최초 출판도서의 발행일과 동일한 날짜’로 변경시키는 SQL 구문을 작성하시오. (COMMIT 처리할 것)
UPDATE TB_WRITER 
SET REGIST_DATE =
(SELECT * FROM(SELECT ISSUE_DATE FROM TB_BOOK ORDER BY 1)WHERE ROWNUM = 1)
WHERE 


                

