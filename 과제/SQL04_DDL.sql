-- 1. �迭 ������ ������ ī�װ� ���̺��� ������� �Ѵ�.
-- ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);    
SELECT * FROM TB_CATEGORY;

-- 2.���� ������ ������ ���̺��� ������� �Ѵ�.
-- ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);    
SELECT * FROM TB_CLASS_TYPE;    
    
-- 3.TB_CATAGORY���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
--(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� �Ѵٸ� �̸��� ������
--�˾Ƽ� ������ �̸��� ����Ѵ�.)

ALTER TABLE TB_CATEGORY 
    ADD CONSTRAINT ����ȣ PRIMARY KEY(NAME);

DESC TB_CATEGORY;
    
-- 4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE
    MODIFY NAME CONSTRAINT ����ȣ1 NOT NULL;
    
    
DESC TB_CLASS_TYPE;

-- 5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷����� NAME �� ���� ���������� ����Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CATEGORY
    MODIFY NAME VARCHAR2(20);

ALTER TABLE TB_CLASS_TYPE
    MODIFY  NO VARCHAR2(10); 

ALTER TABLE TB_CLASS_TYPE
    MODIFY NAME VARCHAR2(20);    

DESC TB_CATEGORY;
DESC TB_CLASS_TYPE;

-- 6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_�� ������ ���̺� �̸��� �տ� ���� ���·� �����Ѵ�.
--(EX. CATEGORY_NAME)
ALTER TABLE TB_CATEGORY
    RENAME COLUMN NAME TO CATEGORY_NAME;
    
ALTER TABLE TB_CLASS_TYPE
    RENAME COLUMN NAME TO CLASS_TYPE_NAME;
ALTER TABLE TB_CLASS_TYPE
    RENAME COLUMN NO TO CLASS_TYPE_NO;
    
-- 7. TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ���� �����Ͻÿ�.
-- PRIMARY KEY �� �̸��� "PK_+�÷��̸�" ���� �����Ͻÿ�.(EX.PK_CATEGORY_NAME)
ALTER TABLE TB_CATEGORY 
    RENAME CONSTRAINT ����ȣ TO PK_CATEGORY_NAME;

ALTER TABLE TB_CLASS_TYPE 
    RENAME CONSTRAINT SYS_C008181 TO PK_CLASS_TYPE_NO;
    
    
--8.������ ���� INSERT ���� �����Ѵ�.
--INSERT INTO TB_CATEGORY VALUES ('����','Y')
--INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y')
--INSERT INTO TB_CATEGORY VALUES ('����','Y')
--INSERT INTO TB_CATEGORY VALUES ('��ü��','Y')
--INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y')
--COMMIT;

INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;

-- 9. TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺���
-- CATEGORY_NAME �÷��� �θ� ������ �����ϵ��� FOREIGH KEY �� �����Ͻÿ�.
-- �� �� KEY �̸��� FK_���̺��̸�_�÷��̸����� �����Ѵ�. (EX.FK_DEPARTMENT_CATEGORY)
ALTER TABLE TB_DEPARTMENT
    ADD CONSTRAINT FK_DEPARTMENT_CATEGORY_NAME
    FOREIGN KEY(CATEGORY)
    REFERENCES TB_CATEGORY(CATEGORY_NAME);

--10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW�� ������� �Ѵ�.
--�Ʒ� ������ �����Ͽ� ������ SQL���� �ۼ��Ͻÿ�.
CREATE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO,STUDENT_NAME,STUDENT_ADDRESS
FROM TB_STUDENT;

SELECT * FROM VW_�л��Ϲ�����;


--11. �� ������б��� 1�⿡ �ι��� ������ �л��� ���������� ���� ����� �����Ѵ�.
--�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW�� ����ÿ�.
--�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ�SELECT ���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)
CREATE VIEW VW_�������
AS SELECT STUDENT_NAME AS �л��̸�,DEPARTMENT_NAME AS �а��̸�,PROFESSOR_NAME AS ���������̸�
FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    LEFT JOIN TB_PROFESSOR ON PROFESSOR_NO = COACH_PROFESSOR_NO;

SELECT * FROM VW_�������;    
        

-- 12 .��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW�� �ۼ��� ����.
CREATE VIEW VW_�а����л���
AS SELECT DEPARTMENT_NAME,COUNT(STUDENT_NO) AS �л���
FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
GROUP BY DEPARTMENT_NAME;    

SELECT * FROM VW_�а����л���;  


-- 13. ������ ������ �л��Ϲ����� VIEW�� ���ؼ� �й��� A213046�� �л��� �̸��� ���� �̸����� �����ϴ� SQL���� �ۼ��Ͻÿ�.
UPDATE VW_�л��Ϲ����� SET STUDENT_NAME = '����ȣ' WHERE STUDENT_NO = 'A213046';
SELECT * FROM VW_�л��Ϲ����� WHERE STUDENT_NO = 'A213046';

-- 14.13�������� ���� VIEW�� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW�� ��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.
CREATE OR REPLACE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO,STUDENT_NAME,STUDENT_ADDRESS
FROM TB_STUDENT
WITH READ ONLY;

UPDATE VW_�л��Ϲ����� SET STUDENT_NAME = '����ȣ' WHERE STUDENT_NO = 'A213046';

-- 15. �� ������б��� �ų� ������û �Ⱓ�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ���� ������ �ǰ� �ִ�.
-- �ֱ� 3���� �������� ���� �ο��� ���� ���Ҵ� 3 ������ ã�� ������ �ۼ��غ��ÿ�.
SELECT *
FROM(
    SELECT C.CLASS_NO AS �����ȣ,C.CLASS_NAME AS �����̸�, COUNT(*) AS "����������(��)"
    FROM TB_CLASS  C
         JOIN TB_GRADE G ON C.CLASS_NO=G.CLASS_NO   
    WHERE TERM_NO LIKE '2005%' OR TERM_NO LIKE '2006%' OR TERM_NO LIKE '2007%' OR TERM_NO LIKE '2008%' OR TERM_NO LIKE '2009%' 
    GROUP BY C.CLASS_NO,C.CLASS_NAME
    ORDER BY 3 DESC)
WHERE ROWNUM <=3; 
