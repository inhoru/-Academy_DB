--1. 4�� ���̺� ���Ե� ������ �� ���� ���ϴ� SQL ������ ����� SQL ������ �ۼ��Ͻÿ�.
SELECT COUNT(*) FROM TB_BOOK;
SELECT COUNT(*) FROM TB_WRITER;
SELECT COUNT(*) FROM TB_PUBLISHER;
SELECT COUNT(*) FROM TB_BOOK_AUTHOR;

-- 3. �������� 25�� �̻��� å ��ȣ�� �������� ȭ�鿡 ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT BOOK_NM,ISBN
FROM TB_BOOK
WHERE LENGTH(BOOK_NM)>=25;

-- 4. �޴��� ��ȣ�� ��019���� �����ϴ� �达 ���� ���� �۰��� �̸������� �������� �� ���� ���� ǥ�õǴ� �۰�
--�̸��� �繫�� ��ȭ��ȣ, �� ��ȭ��ȣ, �޴��� ��ȭ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�

SELECT *
        FROM(SELECT WRITER_NM,NVL(OFFICE_TELNO,'����'),NVL(HOME_TELNO,'����'),MOBILE_NO
                FROM TB_WRITER
                WHERE MOBILE_NO LIKE '019%'
                ORDER BY WRITER_NM)
WHERE ROWNUM =1;

--5. ���� ���°� ���ű衱�� �ش��ϴ� �۰����� �� �� ������ ����ϴ� SQL ������ �ۼ��Ͻÿ�. 
--(��� ����� ���۰�(��)������ ǥ�õǵ��� �� ��)

SELECT  COUNT(DISTINCT WRITER_NO) AS "�۰�(��)"
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '�ű�';

-- 6. 300�� �̻� ��ϵ� ������ ���� ���� �� ��ϵ� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--(�������°� ��ϵ��� ���� ���� ������ ��)

SELECT COMPOSE_TYPE,COUNT(*)
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('����','����')
GROUP BY COMPOSE_TYPE;


-- 7. ���� �ֱٿ� �߰��� �ֽ��� �̸��� ��������, ���ǻ� �̸��� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�
SELECT * 
FROM(SELECT BOOK_NM,ISSUE_DATE,PUBLISHER_NM FROM TB_BOOK ORDER BY 2 DESC)
WHERE ROWNUM =1;

-- 8. ���� ���� å�� �� �۰� 3���� �̸��� ������ ǥ���ϵ�, ���� �� ������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--��, ��������(��٣���) �۰��� ���ٰ� �����Ѵ�. 
--(��� ����� ���۰� �̸���, ���� ������ ǥ�õǵ��� �Ұ�)
SELECT *
FROM(SELECT WRITER_NM,COUNT(WRITER_NO)
FROM TB_BOOK_AUTHOR
    JOIN TB_WRITER USING(WRITER_NO)
GROUP BY WRITER_NM
ORDER BY 2 DESC)
WHERE ROWNUM <=3;

-- 9. �۰� ���� ���̺��� ��� ������� �׸��� �����Ǿ� �ִ� �� �߰��Ͽ���. ������ ������� ���� �� �۰���
--������ ���ǵ����� �����ϰ� ������ ��¥���� �����Ű�� SQL ������ �ۼ��Ͻÿ�. (COMMIT ó���� ��)
UPDATE TB_WRITER 
SET REGIST_DATE =
(SELECT * FROM(SELECT ISSUE_DATE FROM TB_BOOK ORDER BY 1)WHERE ROWNUM = 1)
WHERE 


                

