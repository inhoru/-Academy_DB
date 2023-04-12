SELECT * FROM DBA_USERS;
SELECT * FROM TAB;

-- DATABASE����ϱ�
-- 1. ����� ������ ������(SYSTEM) �������� ��������
--     - �����ڷ� �����ؼ� ������ɾ �̿���.
-- 2. ������ ������ DATABASE�� �̿��ϱ� ���ؼ��� ���Ѻο� ����� �Ѵ�.
--    - �����ڷ� �����ؼ� ���� �ο���ɾ �̿�
--    - �ο����� : �����Ҽ��ִ� ����(CONNECT), ����� �� �ִ� ����(RESOURCE)

-- ���������ϴ� ��ɾ�
-- CREATE USER ����ڰ����� IDENTIFIED BY ��й�ȣ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-- 18C�������� ����ڰ����� ##�� �ٿ��� �����ؾ� �Ѵ�.
-- ##�Ⱥ��� �� �ְ� �����ϱ�
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- DB�� ��ϵǾ� �ִ� ����� ��ȸ�ϱ�
SELECT * FROM DBA_USERS;

-- ����ڸ� �����ϴ���� ������ ������ DB�� �̿��� �� ����.
-- ����ڿ��� ���Ѻο��ϱ�
-- GRANT ���� or ��(����) TO ����ڰ�����
GRANT CONNECT TO BS;
-- ���̺��� �̿��� �� �ִ� ������ �ο��ϱ�
GRANT RESOURCE TO BS;

GRANT CONNECT, RESOURCE TO BS;

-- BS�������� SQL�� �����غ���
SELECT * FROM TAB; --�������� �̿��ϰ� �ִ� ���̺��� ��ȸ�ϴ� ��ɾ�
CREATE TABLE TEST(
    TEST VARCHAR2(200)
);
-- USER01/USER01��� ������ �����ϰ� �����ϰ� �Ʒ� ��ɾ� �����ϱ�
--CREATE TABLE USER01(
-- AGE NUMBER
--); 

CREATE USER USER01 IDENTIFIED BY USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT RESOURCE, CONNECT TO USER01;

CREATE TABLE USER01 (
    AGE NUMBER
);
--
SELECT * FROM TAB;
SELECT * FROM BS.TEST;
SELECT * FROM USER01.USER01;

-- �⺻�ǽ� DB�� ���� �˾ƺ���.
-- ���, �μ�, ��å, �ٹ���, �޿�����, �ٹ����� ����
-- ������̺��� ����Ȯ���ϱ�
SELECT * FROM EMPLOYEE;
-- �μ����̺��� ����Ȯ���ϱ�
SELECT * FROM DEPARTMENT;
-- ��å�� ���� ����Ȯ���ϱ�
SELECT * FROM JOB;
-- �μ��� �ٹ���
SELECT * FROM LOCATION;
-- �ٹ����� ����������
SELECT * FROM NATIONAL;
-- �޿�����
SELECT * FROM SAL_GRADE;

-- SELECT���� Ȱ���ϱ�
-- �⺻����
-- SELECT �÷���,�÷���.... OR *
-- FROM ���̺��;

-- SELECT���� �̿��ؼ� EMPLOYEE���̺� ��ȸ�ϱ�
SELECT EMP_NAME, EMP_NO, EMAIL, PHONE
FROM EMPLOYEE;
-- SELECT���� �̿��ؼ� EMPLOYEE���̺��� ��ü �÷� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE;

-- ��ü ����� �̸�, ����, ���ʽ� �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE;

-- ��� ������ Ȯ���Ҷ��� SELECT���� �̿���.
-- SELECT���� �̿��ؼ� �������ó���ϱ�
-- +,-,*,/(��Ģ����) -> �ǿ����� ���ͷ�, �÷���
SELECT 10+20, 10-20, 20/3, 5*4
FROM DUAL;

-- ���ͷ�, �÷� ����
-- ��ü����� �޿��� 100 ���ϱ�
SELECT EMP_NAME, SALARY+100, SALARY
FROM EMPLOYEE;

-- �÷�, �÷� ����
SELECT EMP_NAME, SALARY+BONUS
FROM EMPLOYEE;
-- NULL���� ������ �Ұ����ϴ� -> ����� ������ NULL�� ��µ�.
SELECT SALARY, BONUS
FROM EMPLOYEE;

-- ��������� �������� �����ϴ�.
-- ����Ŭ���� ���ڿ� ���ͷ��� ''�� ����Ѵ�.
SELECT '���� ���ɸ���'+100
FROM DUAL;

SELECT EMP_NAME, SALARY, BONUS, 10+30
FROM EMPLOYEE;

-- ������̺���  �����, �μ��ڵ�, ����, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY, SALARY*12
FROM EMPLOYEE;
-- ������̺���  �����, �μ��ڵ�, ����, ���ʽ��� ���Ե� ���� ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_CODE, SALARY, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;

-- ���̺� �����ϴ� �÷��� ��ȸ�� �����ϴ�
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE;
--SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;
-- ��ȸ�� �÷��� ��Ī�� �ο��� �� �ִ�. -> �����÷��� ���� ���
-- AS ���� ����Ѵ�.
-- ��) SELECT EMP_NAME AS ����� FROM EMPLOYEE
SELECT EMP_NAME AS �����, SALARY AS ����, EMAIL AS �̸���
FROM EMPLOYEE;
-- AS �� �����ϰ� ����� �ο��� �� �ִ�.
SELECT EMP_NAME �����, SALARY ����, EMAIL �̸���
FROM EMPLOYEE;

-- ��Ī�� ����, Ư����ȣ�� �����ϴ�?
SELECT EMP_NAME AS "�� �� ��", SALARY AS "$��$��"
FROM EMPLOYEE;


-- ��ȸ�Ǵ� �������� �ߺ��� �������ִ� ��ɾ� : DISTINCT
-- �÷��� �տ� ���, SELECT���� �� �տ� �ۼ�
-- SELECT DISTINCT �÷���[,�÷���...] FROM ���̺��
SELECT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-- SELECT EMP_NAME, DISTINCT DEPT_CODE FROM EMEPLOYEE;
SELECT DISTINCT DEPT_CODE, EMP_NAME FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;

-- ����Ŭ���� ���ڿ��� �������ִ� ������ -> ||
SELECT '����'+'���ִ�' 
FROM DUAL;

SELECT '����'||'������ FEAT ����'
FROM DUAL;
-- || ������ �÷��� ���ļ� ����Ҷ��� ����Ѵ�.
SELECT EMP_NAME||EMP_NO||EMAIL AS INFO
FROM EMPLOYEE;
SELECT EMP_NAME||SALARY||BONUS
FROM EMPLOYEE;

SELECT EMP_NAME||'���� ������ '||SALARY||' ���ʽ�'||BONUS
FROM EMPLOYEE;

-- ���ϴ� ROW(DATA)�� ����ϱ�
-- ������ ���ǿ� �´� �����͸� ��������
-- WHERE ���ǽ� �̿��Ѵ�.
-- �����
-- SELECT �÷�, �÷�...... OR *
-- FROM ���̺��
-- WHERE ���ǽ�

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D9';
-- ��� �� ������ 200�����̻��� ����� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE SALARY>=2000000;

-- ��� �� ��å�� J2�� �ƴ� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE != 'J2';

-- �������� �񱳿��� ó���ϱ�
-- ��� �� �μ��� D5�̰� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- ��� �� �μ��� D5�̰ų� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR SALARY>=3000000;

SELECT * 
FROM EMPLOYEE
WHERE 1=2;

-- ��¥�� ��Һ��ϱ�
-- ��¥�� ��Һ��Ҷ��� ���ڷ� ��, ���ڿ� ������ ������.
-- �⺻���� ��¥�� ǥ���ϴ� ���ڿ� ���� : YY/MM/DD -> 'YY/MM/DD'
SELECT HIRE_DATE 
FROM EMPLOYEE;
-- �Ի����� 2000�� 01�� 01�� ������ ����� �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01';

-- �Ի����� 95�� 01�� 01�������� ����� ��ü���� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE < '95/01/01';

-- Ư�� ������ �ִ� ���� ��ȸ�ϱ�
-- ��� �� ���� 200�����̻� 300���� ���� ������ �޴� ����� �����, ����, ���ʽ�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY <=3000000;
-- ����� �Ի����� 00��01��01���� 02��12��31�� ������ ��� ��ü ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE>='00/01/01' AND HIRE_DATE<='02/12/31';

-- ������ ���� ��ȸ�Ҷ� BETWEEN AND ������ �̿��ϱ�
-- �÷��� BETWEEN �� AND �� ;
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '00/01/01' AND '02/12/31' AND DEPT_CODE ='D9';

-- LIKE������ �̿��ϱ�
-- �˻��� ���ڿ� �������� �˻��ϴ� ��� -> �κ���ġ, ���Կ���, ���ϴ� ���ڿ����ϰ˻�
-- ���ڿ� ������ ��Ÿ���� ��ȣ
-- % : ���ڰ� 0���̻� �ƹ����ڳ� ����Ҷ� ���
-- ��)  %��% : �� o, �Ѱ�, �ΰ�, �θ���, �Ѱ��ٸ�, �������� -> ���� ���ԵǾ��ִ� ���ڿ�
--      %�� : ������ ������ ��
--      ��% : ������ �����ϴ� ��
-- _ : ���ڰ� 1�� �ƹ����ڳ� ����Ҷ� ���
-- ��) _��_ : �߰��� ���� �ִ� ������
--    _�� : ������ ������ �α���
--    ��_ : ������ �����ϴ� �α���
--    _��% : �α��� �̻��� �ι�°�ڸ��� ���� �����ϴ� ����
-- �÷��� LIKE '����';

-- ��� �� �������� ���� ����� �̸�, ����, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��__';

-- �̸��� �ּҿ� yo�� �����ϰ� �ִ� ����� �����, �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL 
FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';

-- �̸����ּҿ� j�� �����ϰ� �������� ���� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '��__'; 

-- LIKE�� ��ġ���� �ʴ� ��� ã��
-- NOT����������
-- �达�� �ƴ� ����� ã��
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';

-- �̸����ּҿ� _�ձ��ڰ� 3������ ����� ����� �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___*_%' ESCAPE '*';

-- NULL���� ��ȸ�ϱ�
-- NULL -> ������, �ƹ��ǹ̾��� �� -> ������ �Ұ���
-- ����Ŭ�� �����ϴ� NULL�񱳿����ڸ� ���
-- IS NULL, IS NOT NULL
-- ���ʽ��� ���� �ʴ� �����ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
--WHERE BONUS='(null)';
WHERE BONUS IS NULL;

-- ���ʽ��� �ް��ִ� ����� �̸�, ��IS�ʽ��� ��ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


-- ��ȸ�� �÷����� NULL�϶� ��ü�ϱ�
-- NVL(�÷���,��ü��)�Լ��� �̿�
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE,'����') AS DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;
--CREATE TABLE NAMETEST(
--    NAME2 VARCHAR2(200),
--    AGE NUMBER
--);
--
--INSERT INTO NAMETEST VALUES('������', 19);
--
--SELECT * FROM NAMETEST
--WHERE NAME2 NOT LIKE '%��%' OR NAME2 IS NULL;
--
--DROP TABLE NAMETEST;

-- ���߰� ������ϱ�
-- IN / NOT IN : �������� ���� OR�� �����ؼ� ������Ҷ� ����ϴ� ������
-- ��� �� �μ��ڵ尡 D5,D6,D7,D8��  ������ϱ�
SELECT * 
FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6' OR DEPT_CODE='D7' OR DEPT_CODE='D8';
WHERE DEPT_CODE NOT IN ('D5','D6','D7','D8');

-- ����������
--SELECT EMP_NAME, DEPT_CODE
--FROM EMPLOYEE
--WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���' OR DEPT_TITLE LIKE '%�ؿ�%');

-- ������ �켱����
-- ��å�� J7�̰ų�  J2�� ��� �� �޿��� 200�����̻��� ����� ��ȸ�ϱ�
-- �̸�, ����, ��å�ڵ�
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J2') AND SALARY>=2000000;

--SCOTT/TIGER ������ ���� �� SCOTT_EN ���̺� �߰�

-- 1. ����Ŭ�� ��ġ�Ѵ�. 
-- 2. SQLDEVELOPER���� Ǭ�� -> EXE���� ����
-- 3. SYSTEM���� ���ӻ����ϱ� ->> DBA
-- 4. BS/BS ���� ����, ���� �ο�
-- 5. BS���� �����ϱ� 
-- 6. BS�������� BS.sql ��ũ��Ʈ�����ϱ�
-- 7. BS�������� �۾��ϱ�
-- 8. system�������� ����
-- 9. scott/tiger���� ���� �� ���Ѻο�
-- 10. scott���� ����
-- 11. scott �������� scott_en.sql���� ����

CREATE USER SCOTT IDENTIFIED BY TIGER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
 GRANT CONNECT, RESOURCE TO SCOTT;


-- ���ó�¥�� ����� �� ���� 
--SYSDATE
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE-10 FROM DUAL;
SELECT SYSDATE-HIRE_DATE
FROM EMPLOYEE;


-- ����Ŭ���� �����ϴ� �Լ��� ���� �˾ƺ���
-- �������Լ� :  ���̺��� ��� �࿡ ����� ��ȯ�Ǵ� �Լ�
--                  ����, ����, ��¥, ����ȯ, �����Լ�(����Ȱ��)
-- �׷��Լ� :  ���̺� �Ѱ��� ����� ��ȯ�Ǵ� �Լ�
--               : �հ� ��� ���� �ִ밪 �ּҰ�

-- ������ �Լ� Ȱ���ϱ�
-- ����ϴ� ��ġ
-- SELECT���� �÷��� �ۼ��ϴ� �κ�, WHERE��, 
-- INSERT, UPDATE, DELETE������ ����� ����

-- ���ڿ��Լ��� ���ؾ˾ƺ���
-- ���ڿ��� ó���ϴ±�� 
-- LENGTH : �������÷��̳�, ���ͷ����� ���� ���̸� ������ִ� �Լ�
-- LENGTH('���ڿ�'||�÷���)  - > ���ڿ��� ������ ���
SELECT LENGTH('���� ������ ������!')
FROM DUAL;
SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- �̸����� 16���� �̻��� ����� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

-- LENGTHB : �����ϴ� BYTE�� ���
-- EXPRESS�������� �ѱ��� 3BYTE�� ������. ENTERPRISE���������� 2BYTE
SELECT LENGTHB('ABCD'), LENGTHB('������')
FROM EMPLOYEE;

-- INSTR : JAVA�� INDEXOF �� ������ �����.
-- INSTR('���ڿ�'||�÷�,'ã�� ����'[,������ġ, ã����°(Ƚ��)]
-- ����Ŭ���� �ε�����ȣ�� 1���ͽ���
-- ���� ���� ã������ 0�̳��´�.
SELECT INSTR('GD��ī����','GD'), INSTR('GD��ī����','��'),INSTR('GD��ī����','��')
FROM DUAL;

SELECT EMAIL, INSTR(EMAIL,'j')
FROM EMPLOYEE;


--EMAIL �ּҿ� j�� ���ԵǾ��ִ� ���ã��
--������ 0�̳� ���ϰ� �Լ��� �̿��ؼ� ã�������ִ�.
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE INSTR(EMAIL,'j')>0;

-- ������ġ �� ���ؼ� �˻��ϱ�
-- �������� ��������� �ڿ�������ã�´�.
-- 1���� �����ؼ� 3��° �� ã�ƶ�
SELECT INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD'),
            INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',3),
            -- �������� ��������� �ڿ�������ã�´�.
            INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',-1),
            -- 1���� �����ؼ� 3��° �� ã�ƶ�
            INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',1,3)
FROM DUAL;

-- ������̺��� @�� ��ġ�� ã��
SELECT EMP_NAME, EMAIL, INSTR(EMAIL,'@')
FROM EMPLOYEE;

-- LPAD/RPAD : ���ڿ��� ���̰� ������ ���̸�ŭ ���� �ʾ����� ������� ä���ִ� �Լ�
-- LPAD/RPAD(���ڿ�||�÷�,�ִ����,��ü����)

--LPAD ���ʺ��� �����ä��
-- ��ü���ڸ� �������ʾѴٸ� �������� ���
SELECT LPAD('������',10,'*'), LPAD('������',10)
FROM DUAL;
--RPAD �����ʺ��� �����ä��
SELECT RPAD('������',10,'@')
FROM DUAL;

-- �÷��� �� �����ͼ� ��밡��
SELECT EMAIL, RPAD(EMAIL,20,'#')
FROM EMPLOYEE;

-- LTRIM/RTRIM : ������ �����ϴ� �Լ�, Ư�����ڸ� �����ؼ� ����
-- LTRIM/RTRIM('���ڿ�'||�÷�[,'Ư������'])
-- �������� ���޾��ִ� ���鸸�����
-- ���ڻ��̿� ������ ������������
SELECT '              ����',  LTRIM ('             ����') , RTRIM('                ����              ')
FROM DUAL;
-- Ư�����ڸ� �����ؼ� ������ �� �ִ�.
-- ���޾��ִ� ���� ����� �ٸ����������ִٸ��������ʴ´�.
SELECT ' ����2222', RTRIM('����2222','2'), RTRIM('����22122','2'),
RTRIM('����22122','12')
FROM DUAL;

-- TRIM : ���ʿ� �ִ� ���� �����ϴ� �Լ�, �⺻ : ����, �����ϸ� �������� ����(�ѱ��ڸ�)
-- TRIM(���ڿ�||�÷�)
--              ����      ������     ����
-- TRIM(LEADING||TRAILING||BOTH '�����ҹ���' FROM ���ڿ�||�÷���)
    -- ������ ���ڿ��� �ѱ��ڸ�����!

SELECT '                    ������                 ',TRIM( '                    ������                 ')
,'ZZZZZZ��¡��ZZZZZZ',TRIM('Z' FROM 'ZZZZZZ��¡��ZZZZZZ'),
TRIM(LEADING 'Z' FROM 'ZZZZZZ��¡��ZZZZZZ'),
TRIM(TRAILING 'Z' FROM 'ZZZZZZ��¡��ZZZZZZ'),
TRIM(BOTH 'Z' FROM 'ZZZZZZ��¡��ZZZZZZ')
FROM DUAL;

-- SUBSTR : ���ڿ��� �߶󳻴� ��� * JAVA SUBSTRING�޼ҵ�� ����
-- SUBSTR(���ڿ�||�÷���,�����ε�����ȣ,[,����])
SELECT SUBSTR('SHOWMETHEMONEY',5), 
-- 5��° �߿� 2���� �������ٴ�.
SUBSTR('SHOWMETHEMONEY',5,2),

SUBSTR('SHOWMETHEMONEY', INSTR('SHOWMETHEMONEY','MONEY')),

SUBSTR('SHOWMETHEMONEY',-5,2) 
FROM DUAL;

-- ����� �̸��Ͽ��� ���̵𰪸� ����ϱ�
-- ���̵� 7�����̻��� ����� ��ȸ
SELECT EMP_NAME, EMAIL,SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 
FROM EMPLOYEE
WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;



-- ����� ������ ǥ���ϴ� ��ȣ�� ���
-- ���ڻ���� ��ȸ
SELECT EMP_NAME , EMP_NO,SUBSTR(EMP_NO,8,1)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN (2,4);

-- �����ڸ� ó���ϴ� �Լ� : UPPER,LOWER, INITCAP
-- UPPER : ���� �빮�ڷ�ó��
-- LOWER : ���� �ҹ��ڷ� ó��
-- INITCAP : ���ڿ� ù�ڸ��� �빮��
SELECT UPPER('Welcome to oRACLE worLd'),
LOWER('Welcome to oRACLE worLd'),
INITCAP('Welcome to oRACLE worLd')
FROM DUAL;

-- CONCAT : ���ڿ��� �������ִ� �Լ�
-- | | �����ڿ� �����ϴ�.
SELECT EMP_NAME ||EMAIL, CONCAT(EMP_NAME, EMAIL)
,CONCAT(CONCAT(EMP_NAME, EMAIL),SALARY)
FROM EMPLOYEE;

-- REPLACE : ����ڿ��� �������ڸ� ã�Ƽ� Ư�����ڷ� �����ϴ� ��
-- PEPLACE(���ڿ�||�÷���,'ã������','��ü����')
SELECT EMAIL, REPLACE(EMAIL,'BS','GD')
FROM EMPLOYEE;
-- UPDATE�� ��� ��� �̸��� ����
-- UPDATE EMPLOYEE SET EMAIL = REPLACE(EMAIL,'BS','GD');

-- REVERSE : ���ڿ��� �Ųٷ� ������ִ� ���
SELECT EMAIL, REVERSE(EMAIL), EMP_NAME, REVERSE(EMP_NAME),REVERSE(REVERSE(EMP_NAME))
FROM EMPLOYEE;

-- TRANSLATE :  ��Ī�Ǵ� ���ڷ� �������ִ� �Լ�
SELECT TRANSLATE ('010-3644-6259','0123456789','�����̻�����ĥ�ȱ�')
FROM DUAL;


-- ����ó���Լ�
-- ABS : ���밪�� ó���ϴ� �Լ�
SELECT ABS(-10), ABS(10)
FROM DUAL;

-- MOD : �������� ���ϴ� �Լ� * �ڹ��� %�����ڿ� ������ �Լ�
SELECT MOD(3,2)
FROM DUAL;

-- ��ü�� ����ҷ��� ��Ī�� ���ؼ� ����� ����.
SELECT E.*, MOD(SALARY,3)
FROM EMPLOYEE E;

-- �Ҽ����� ó���ϴ� �Լ�
-- ROUND : �������� �ݿø��ϴ� �Լ�
-- ROUND (����||�÷���[,�ڸ���])
SELECT 126.567,ROUND(126.567), ROUND(126.467),ROUND(126.567,2)
FROM DUAL;

-- ���ʽ��� ������ ���ޱ��ϱ�
SELECT EMP_NAME, SALARY, (SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03)),
ROUND(SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03))
FROM EMPLOYEE;

--FLOOR : �������ڸ� ����
SELECT 126.567, FLOOR(126.567)
FROM DUAL;

--TRUNC : �Ҽ����ڸ��� ���� �ڸ����� ����
-- -2 �� �Ҽ��� ������ ���� 0���θ������� 
SELECT 126.567, TRUNC(126.567) , TRUNC(126.567,2) ,TRUNC(126.567,-2),
    TRUNC(2123456.32,-2)
FROM DUAL;

-- CEIL : �Ҽ��� �ø�
SELECT 126.567, CEIL(126.567),CEIL(126.111)
FROM EMPLOYEE;

-- ��¥ó���Լ� �̿��ϱ�
-- ����Ŭ���� ��¥�� ����Ҷ��� �ΰ��� ����� ����
-- 1. SYSDATE����� -> ��¥ ��/��/�� ���� ��¥(����Ŭ�� ��ġ�Ǿ��ִ� ��ǻ���� ��¥)�� �������.
-- 2. SYSTIMESTAMP����� -> ��¥+�ð����� �������
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

--��¥�� �������ó���� �����ϴ�, +,- ���� ���� -> �ϼ��� ����, �߰���.
SELECT SYSDATE, SYSDATE-2, SYSDATE+3,SYSDATE+30
FROM DUAL;

-- NEXT_DAY : �Ű������� ���޹��� ���� �� ���� ����� ���� ��¥ ���
--LOCALE�� ���� �ѱ����� �Ǿ��ֱ⿡ ������,��, ��� ����
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��'),NEXT_DAY(SYSDATE,'��')
FROM DUAL;

-- LOCALE�� ���� ������ ����
SELECT * FROM V$NLS_PARAMETERS;
ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MON'),NEXT_DAY(SYSDATE,'TUESDAY')
FROM DUAL;

-- LASY_DAY : �״��� ���������� ���
SELECT SYSDATE, LAST_DAY(SYSDATE), LAST_DAY(SYSDATE+30)
FROM DUAL;

-- ADD_MONTHS : �������� ���ϴ� �Լ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE,4)
FROM DUAL;

-- MONTHS_BETWEEN : �ΰ��� ��¥�� �޾Ƽ� �γ�¥�� �������� ������ִ� �Լ�
SELECT FLOOR (MONTHS_BETWEEN('23/08/17',SYSDATE))
FROM DUAL;

-- ��¥�� �⵵, ��, ���ڸ� ���� ����� �� �ִ� �Լ�
-- EXTRACT(YEAR||MONTH||DAY FROM ��¥)  : ���ڷ� �������.
-- ���糯¥�� ��, ��, �� ����ϱ�
SELECT EXTRACT(YEAR FROM SYSDATE) AS �� , EXTRACT(MONTH FROM SYSDATE) AS ��, EXTRACT(DAY FROM SYSDATE) AS ��
FROM DUAL;

-- ��� �� 12���� �Ի��� ������� ���Ͻÿ�
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE   EXTRACT(MONTH FROM HIRE_DATE)=12;

-- ��¥�� ���ڸ� ���Ҽ��ִ�.
SELECT EXTRACT(DAY FROM HIRE_DATE)+100
FROM EMPLOYEE;

-- ���úη� ���ֿ����� ����� �ٽò�������..? ���뺹���Ⱓ�� 1��6����
-- �������ڸ� ���ϰ�, ���������� �Դ� «���(�Ϸ缼��)�� ���ϱ� 

SELECT   SYSDATE AS ���糯¥, ADD_MONTHS(SYSDATE,18) AS ��������, (ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS «��
FROM DUAL;

-- ����ȯ �Լ�
-- ����Ŭ������ �ڵ�����ȯ�� �� �۵��� �Ѵ�.
-- ����Ŭ �����͸� �����ϴ� Ÿ���� ����
-- ���� : CHAR, VARCHAR2, NCHAR, NVARCHAR2 -> JAVA String�� �����ϴ�.
-- ���� : NUMBER
-- ��¥ : DATE, TIMESTAMP

-- TO_CHAR :  ����, ��¥�� ���������� �������ִ� �Լ�
-- ��¥�� ���������� �����ϱ�
-- ��¥���� ��ȣ��ǥ���ؼ� ���������� ������ �Ѵ�.
-- Y : ��, M : ��, D : �� , H : �� , MI : ��, ss : ��
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--�÷��� �ú��ʸ� ���������ؼ� �ȳ���
SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YYYY.MM.DD'), TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH24:MI:SS')
FROM EMPLOYEE;

-- ���ڸ� ���������� �����ϱ�
-- ���Ͽ� ���缭 ��ȯ -> �ڸ����� ��� ǥ������ ����
-- 0 :  ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ����������, ���� ���� �ڸ��� 0�� ǥ���ϴ� ����
-- 9 :  ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ����������, ���� ���� �ڸ��� �����ϴ� ���� 
-- ��ȭ�� ǥ���ϰ� �������� L�� ǥ��
-- FM�����̸� ��������
SELECT 1234567,TO_CHAR(1234567,'000,000,000'), TO_CHAR(1234567,'999,999,999'),
TO_CHAR(500,'L999,999')

FROM DUAL;


SELECT 180.5, TO_CHAR(180.5,'000,000.00'), TO_CHAR(180.5,'FM999,999.00') AS Ű
FROM DUAL;

-- ������ ��ȭǥ���ϰ� , �� �����ؼ� ����ϰ� �Ի����� 0000.00.00���� ����ϱ�
SELECT EMP_NAME ,TO_CHAR(SALARY,'FML999,999,999') AS �޿� ,TO_CHAR(HIRE_DATE,'YYYY.MM.DD')AS �Ի���
FROM EMPLOYEE;

-- ���������� �����ϱ�
-- TO_NUMBER�Լ��� �̿�
-- ���ڸ� ���������� �����ϱ�
SELECT 1000000+1000000,TO_NUMBER('1,000,000','999,999,999')+1000000,
TO_CHAR(TO_NUMBER('1,000,000','999,999,999')+1000000,'FML999,999,999')
FROM DUAL;

-- ��¥������ �����ϱ�
-- ���ڸ� ��¥�� ����
-- ���ڿ��� ��¥�� ����
SELECT TO_DATE('23/12/25','YY/MM/DD')-SYSDATE, TO_DATE('241225','YYMMDD'),TO_DATE('25-12-25','YY-MM-DD')
FROM DUAL;

-- ������� �����?? �տ� 000�̺����� �����ؾ��Ѵ� 000�� �����ʱ⶧���̴� �׷��� ���ڿ��� �����ؼ�����Ѵ�.
SELECT TO_DATE(20230405,'YYYY/MM/DD'), TO_DATE(230505,'YYMMDD'), TO_DATE (TO_CHAR(00224,'000000'),'YYMMDD')
FROM DUAL;

--NULL���� ó�����ִ� �Լ�
--NVL�Լ� : NVL(�÷�,��ü��)
--NVL2�Լ� : NVL2(�÷�,NULL�ƴҶ�, NULL�϶�)
SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE,'����'),
NVL2(DEPT_CODE,'����','����')
FROM EMPLOYEE;

-- ���ǿ� ���� ����� ���� �������ִ� �Լ�
-- 1. DECODE
-- DECODE(�÷��� || ���ڿ�, '����','��ü��','����2','��ü��2',.....)
-- �ֹι�ȣ���� 8��°�ڸ� ���� 1�̸� ����, 2�̸� ���ڸ� ����ϴ� �÷��߰��ϱ�
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','����','2','����') AS GENDER
FROM EMPLOYEE;
--WHERE GENDER = '����';

-- �� ��å�ڵ��� ��Ī�� ����ϱ�
-- J1�� ��ǥ, J2 �λ���, J3 ����, J4 ����
-- �Ǹ��������� ���������Ʈ���̵ȴ�.
SELECT EMP_NAME, DECODE(JOB_CODE,'J1','��ǥ','J2','�λ���','J3','����','J4','����','���') AS ��å
FROM EMPLOYEE;

-- 2. CASE WHEN THEN ELSE 
-- CASE
--             WHEN ���ǽ� THEN ���೻��
--             WHEN ���ǽ� THEN ���೻��
--             WHEN ���ǽ� THEN ���೻��
--             ELSE ���೻�� 
-- END

SELECT EMP_NAME, JOB_CODE,
            CASE
                    WHEN JOB_CODE = 'J1' THEN '��ǥ'
                    WHEN JOB_CODE = 'J2' THEN '�λ���'
                    WHEN JOB_CODE = 'J3' THEN '����'
                    WHEN JOB_CODE = 'J4' THEN '����'
                    ELSE '���'
            END AS ��å,
            CASE JOB_CODE
                    WHEN 'J1' THEN '��ǥ'
                    WHEN 'J2' THEN '�λ���'
            END
FROM EMPLOYEE;

-- ������ �������� ��׿����ڿ� �߰������� �׿ܸ� ������ ����ϱ�
-- ������ 400���� �̻��̸� ���
-- ������ 400�̸� 300�̻��̸� �߰�������
-- �������� �׿ܸ� ����ϴ� �����÷� �����
-- �̸� , ���� ,���

SELECT EMP_NAME, SALARY,
            CASE
                    WHEN SALARY >=4000000 THEN '���'
                    WHEN SALARY <4000000 AND  SALARY >=3000000 THEN '�߰�������'
                    ELSE '�׿�'
                    END AS ���
FROM EMPLOYEE;

-- ������̺��� ���糪�� ���ϱ�
-- YY�������ö� ������ �����⸦ �����´� EX) 2064,, 2085, 2077.....
-- RR �������ö� 
SELECT EMP_NAME, EMP_NO, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY')) ||'��' AS YY��,
EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR')) ||'��' AS RR��,
EXTRACT(YEAR FROM SYSDATE) -(
TO_NUMBER(SUBSTR(EMP_NO,1,2))+
CASE
        WHEN SUBSTR(EMP_NO,8,1)IN (1,2) THEN 1900
        WHEN SUBSTR(EMP_NO,8,1)IN (3,4) THEN 2000
        END
        ) AS ��
FROM EMPLOYEE;

                    
insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('251','������','020808-2123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');
SELECT * FROM EMPLOYEE;


UPDATE EMPLOYEE SET EMP_NO = '320808-1123341' WHERE EMP_ID = '252';
COMMIT;

-- �׷��Լ� Ȱ���ϱ�
-- ���̺��� �����Ϳ� ���� �����ϴ� �Լ��� �հ�, ���, ����, �ִ밪, �ּҰ��� ���ϴ� �Լ�
-- �׷��Լ��� ����� �⺻������ �Ѱ��� ���� ������
-- �߰� �÷��� �����ϴ°��� ����
-- ����
-- SUM : ���̺��� Ư���÷��� ���� ���� -> SUM(�÷�(NUMBER))
-- AVG :  ���̺��� Ư���÷��� ���� ��� -> AVG(�÷�(NUMBER))
-- COUNT : ���̺��� �����ͼ�(ROW��) -> COUNT(* | | �÷�)
-- MIN :  ���̺��� Ư���÷��� ���� �ּҰ� -> MIN(�÷���)
-- MAX :  ���̺��� Ư���÷��� ���� �ִ밪 -> MAX(�÷���)

-- ����� ������ ���հ踦 ���غ���
SELECT TO_CHAR (SUM(SALARY),'FML999,999,999') FROM EMPLOYEE;

-- D5 �μ��� ������ ���հ踦 ���غ���
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- ���ڴ� �Ұ���
--SELECT SUM(EMP_NAME)
--FROM EMPLOYEE;

--J3����� �޿� �հ踦 ���Ͻ�?
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE JOB_CODE ='J3';

-- ��ձ��ϱ� AVG�Լ�
-- ��ü����� ���� ��ձ��ϱ�
SELECT AVG(SALARY)FROM EMPLOYEE;
-- D5�� �޿� ����� ���ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

-- D5�μ��� �޿��հ�� ��ձ��ϱ�
-- �׷��Լ� ���� �����ü������� �����÷��� �����ü�������.
SELECT SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- NULL���� ���ؼ��� ��� ó���� �ɱ�?
-- NULL���� �����͸� �����ع�����.
SELECT SUM(BONUS),AVG(BONUS),AVG(NVL(BONUS,0))
FROM EMPLOYEE;

-- ���̺��� �����ͼ� Ȯ���ϱ�
SELECT COUNT(*)
FROM EMPLOYEE;

-- ���̺��� �����ͼ� Ȯ���ϱ�
-- ���̺��մ°� ��� ����
--Ư�����÷��� ����Ѵٸ� NULL?�� ���� �����´�.
SELECT COUNT(*),COUNT(DEPT_CODE), COUNT(BONUS)
FROM EMPLOYEE;

-- D6�μ��� �ο� ��ȸ�ϼ���
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';

-- 400���� �̻� ������ �޴� �����
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY>=4000000;

-- D5�μ����� ���ʽ��� �ް� �ִ� ����Ǽ���?
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND  BONUS IS NOT NULL ;

-- �μ��� D6, D5, D7�� ����� ��, �޿� �հ�, ����� ��ȸ�ϼ���
SELECT COUNT(*) AS ����Ǽ� ,SUM(SALARY) AS �޿��հ�,AVG(SALARY) AS ���
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D7');

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

-- GROUP BY �� Ȱ���ϱ�
-- �׷��Լ��� ��������� Ư���������� �÷����� ��� ó���ϴ� �� -> ���� �׷캰 �׷��Լ��� ����� ��µ�.
-- SELECT �÷�
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���[,�÷���,�÷���,..... ]]
-- [ORDERY BY �÷���]

-- �μ��� �޿� �հ踦 ���Ͻÿ�
SELECT DEPT_ID,SUM(SALARY)
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
GROUP BY DEPT_ID;

-- ��å�� �޿��� �հ�, ����� ���Ͻÿ�
SELECT JOB_CODE,SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- �μ��� ����� ���ϱ�
SELECT DEPT_CODE , COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- GROUP BY ������ �ټ��� �÷��� ���� �� �ִ�.
SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- GROUP BY�� ����� ������ WHERE �� ����� �����ϴ�.
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;

-- �μ��� �ο��� 3���̻��� �μ��� ����ϱ�
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE

-- WHERE �� �׷��Լ��� ����Ҽ�������.
--WHERE COUNT(*) >=3
 -- HAVING ����Ѵ�.   HAVING COUNT(*) >=3; 
GROUP BY DEPT_CODE
HAVING COUNT(*) >=3;

-- ��å�� �ο����� 3���̻��� ��å ����ϱ�
SELECT JOB_CODE , COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*)>=3;

-- ��� �޿��� 300���� �̻��� �μ�����ϱ�
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000 AND COUNT(*)>=4;

-- �Ŵ����� �����ϴ� ����� 2���̻��� �Ŵ��� ���̵� ����ϱ�

SELECT MANAGER_ID , COUNT(*)
FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING COUNT(*)>=2 AND MANAGER_ID IS NOT NULL;

-- ����, ������ �޿� ����� ���ϰ� �ο����� ���ϱ�
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','��','3','��','2','��','4','��') AS ����, AVG(SALARY) , COUNT(*)
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','��','3','��','2','��','4','��');

-- �� �׷캰 ����� �� ���踦 �ѹ��� ������ִ� �Լ�
-- ROLLUP(), CUBE()
-- GROUP BY ROLLUP(�÷���)
-- GROUP BY CUBE(�÷���)
--�μ��� �޿��հ�� ���հ踦 ��ȸ�ϴ� ����
SELECT SUM(SALARY)
FROM EMPLOYEE;
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE);

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
--GROUP BY ROLLUP(JOB_CODE);
GROUP BY CUBE(JOB_CODE);

-- ROLLUP, CUBE �Լ��� �μ��� �Ѱ��̻��� �÷��� ���� �� �ִ�.
-- ROLLUP : �ΰ��̻��� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ��÷��� �Ұ�, ��ü �Ѱ�
-- CUBE : �ΰ��̻� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ��÷��� �Ұ�, �ι�° �μ��÷��� �Ұ� , ��ü �Ѱ�

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL 
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL 
GROUP BY CUBE(DEPT_CODE, JOB_CODE);


-- �μ��� , ��å��, �ѻ���� �ѹ��� ��ȸ�ϱ�
SELECT DEPT_CODE,JOB_CODE, COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- GROUPING�Լ��� �̿��ϸ� ������ ����� ���� �б�ó���� �� �� �ִ�.
-- ROLLUP, CUBE�� ����� ROW�� ���� �б�ó��
-- GROUPING �Լ��� �����ϸ�, ROLLUP, CUBE�� ����� ROW 1�� ��ȯ �ƴϸ� 0�� ��ȯ

SELECT COUNT(*),DEPT_CODE, JOB_CODE,
CASE
WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '�μ����ο�'
WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '��å���ο�'
WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=0 THEN '�μ�_��å�ο�'
WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '���ο�'
END AS ���
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- ���̺��� ��ȸ�� ������ �����ϱ�
-- ORDER BY ������ �����.
-- SELECT �÷���.....
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���]
-- [HAVING ���ǽ�]
-- ���Ĺ���� �������� ����Ʋ������ ���� ����Ʈ�� = ��������
-- [ORDER BY �÷��� ���Ĺ��(DESC(����),ASC(����, DEFAULT)]

-- �̸��� �������� �����ϱ�
--��������
SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME;

--��������
SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME DESC;

-- ������ ����������� ����������� �����ϱ�
-- �̸� , �޿�, ���ʽ�
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- �μ��ڵ带 �������� �������������ϰ� ���� ������ ������ ������������ �����ϱ�
SELECT *
FROM EMPLOYEE
ORDER BY DEPT_CODE ASC, SALARY DESC, EMP_NAME ASC;

-- ���������� NULL���� ���� ó��
-- BONUS�� ���� �޴� ������� ����ϱ�
SELECT *
FROM EMPLOYEE
--ORDER BY BONUS  DESC; -- NULL�� ���� ���� ����Ѵ�.
--ORDER BY BONUS  ASC; -- NULL�� ���� ���߿� ����Ѵ�.
-- �ɼ��� �����ؼ� NULL�������ġ�� ������ �� �ִ�.
ORDER BY BONUS ASC NULLS FIRST;
--ORDER BY BONUS ASC NULLS LAST;


-- ORDER BY �������� ��Ī�� ����� �� ����
SELECT EMP_NAME, SALARY AS ����, BONUS
FROM EMPLOYEE
-- WHERE ���� �������Ѵ�'����'  FROM������ �״��� ���� �״����� ��Ī�� �ο��ϱ⶧���� �Ұ����ϴ�.
ORDER BY ����;


-- SELECT���� �̿��ؼ� �����͸� ��ȸ�ϸ� RESULT SET �� ��µǴµ�
-- RESULT SET �� ��µǴ� �÷����� �ڵ����� INDEX��ȣ�� 1���� �ο��� �ȴ�.
SELECT *
FROM EMPLOYEE
-- SELECT �� ��½� �÷��� ������� �ε����ο��Ѵ� ���ε�����ȣ�� ����Ҽ��ִ�.
ORDER BY 2;


--  ���տ�����
-- �������� SELECT���� �Ѱ��� ���(RESULT SET)���� ������ִ� ��
-- ù��° SELECT���� �÷����� ���� SELECT���� �÷����� ���ƾ��Ѵ�.
-- �� �÷��� ������ Ÿ�Ե� �����ؾ��Ѵ�.

-- UNION : �ΰ��̻��� SELECT���� ��ġ�� ������
-- SELECT �� UNION SELECT��

-- UNION : �ߺ����� ������ �ϳ��� ��µȴ�.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- UNION ALL :  �ߺ������ִٸ� �ߺ��� ���Խ�Ų��
-- MINUIS : �ߺ��� ���� �����ʴ´�.
-- INTERSECT :  �ߺ����� ��������.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;



SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
-- �� SELECT���� �÷��� ���� �ٸ��� �ȵȴ�.
--SELECT EMP_ID,EMP_NAME,SALARY,BONUS
--FROM EMPLOYEE
--WHERE SALARY>3000000;

-- �ΰ��� SELECT���� �÷��� Ÿ�Ե� ����� �Ѵ�.
SELECT EMP_ID,EMP_NAME,EMP_NO
FROM EMPLOYEE
WHERE SALARY>3000000;

-- �ٸ� ���̺� �ִ� �����͸� ��ġ��
-- �´� �÷��̾������ ������(���ͷ���)�� ���ؼ� ���������ִ�.
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE , 10
FROM DEPARTMENT;

SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
UNION
SELECT JOB_CODE, JOB_NAME
FROM JOB
MINUS
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D7');

-- GROUPING SET
-- ���� GROUP BY ���� �ִ� ������ �ϳ��� �ۼ��ϰ� ���ִ� ���
-- �μ�, ��å, �Ŵ����� �޿����
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID , AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE, MANAGER_ID;
-- �μ�, ��å��, �޿����
SELECT DEPT_CODE, JOB_CODE , AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE;
-- �μ�, �Ŵ����� �޿����
SELECT DEPT_CODE,  MANAGER_ID , AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, MANAGER_ID;

-- GROUPING SET �� �̿��ؼ� ��� ������ټ��ִ�.
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY GROUPING SETS((DEPT_CODE,JOB_CODE,MANAGER_ID),(DEPT_CODE,JOB_CODE),(DEPT_CODE, MANAGER_ID));


 --  JOIN�� ���� �˾ƺ���
 -- �ΰ��̻��� ���̺��� Ư���÷��� �������� ��������, ���
 -- JOIN�� �� ������ ����
 -- 1. INNER JOIN : ���صǴ� ���� ��ġ�ϴ� ROW�� �������� JOIN
 -- 2. OUTER JOIN :  �����̵Ǵ� ���� ��ġ���� ���� ROW�� �������� JOIN * ������ �ʿ�
 
 -- JOIN�� �ۼ��ϴ� ��� 2����
 -- 1. ����Ŭ ���ι�� :  , �� WHERE�� �ۼ�
 -- 2. ANSI ǥ�� ���ι�� :  JOIN, ON | | USING ���� ����ؼ� �ۼ�
 
 -- EMPLOYEE���̺�� DEPARTMENT���̺� JOIN�ϱ�
 SELECT* FROM EMPLOYEE;
 SELECT* FROM DEPARTMENT;
 
 -- ����Ŭ������� JOIN�ϱ�
 SELECT *
 FROM EMPLOYEE;
 
 SELECT*
 FROM EMPLOYEE, DEPARTMENT
 WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID;
 
 -- ANSI ǥ������ JOIN�ϱ�
 SELECT *
 FROM EMPLOYEE 
 JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID;
 
-- ����� ���� �����, �̸���, ��ȭ��ȣ, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL, PHONE,DEPT_TITLE
FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; 

 -- JOIN �������� WHERE�� ����ϱ�
 -- �μ��� �ѹ����� ���  �����, ����, ���ʽ�, �μ��� ��ȸ�ϱ�
 SELECT EMP_NAME, SALARY,BONUS, DEPT_TITLE
 FROM EMPLOYEE
 JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
 WHERE DEPT_TITLE = '�ѹ���';
 
 -- JOIN ������ GROUP BY �� ����ϱ�
 -- �μ��� ��ձ޿��� ����ϱ� �μ���, ��ձ޿�
 SELECT DEPT_TITLE,AVG(SALARY)
 FROM EMPLOYEE
 JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
 GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000;

-- JOIN�Ҷ� �����̵Ǵ� �÷����� �ߺ��ȴٸ� �ݵ�� ��Ī�� �ۼ��ؾ��Ѵ�.
-- �����, �޿�, ���ʽ�, ��å���� ��ȸ�ϱ�
-- �ٸ� ���̺������� �÷����� ��������� ���������. 
-- ambiguously ������������ ���̺�տ� ��Ī�� �ο��ϴ� ��Ī�� �ο��ؾ��Ѵ�.
SELECT * --EMP_NAME ,SALARY, BONUS, JOB_NAME
FROM EMPLOYEE E
    JOIN JOB J ON E.JOB_CODE=J.JOB_CODE;

-- �ߺ��Ǵ� �÷������� ������ ���� USING�� �̿��� �� �ִ�.
-- �ߺ��Ǵ� �ڵ尡 �ϳ��� ����̵ȴ�.
-- �ϳ��� ��µǱ⶧���� ��Ī�ο��ؼ� �������ʿ䰡����.
-- USING ������Ҷ� �ĺ���(��Ī)�� �����ʴ´�.
SELECT * --EMP_NAME, SALARY, BONUS, JOB_NAME
FROM EMPLOYEE
    JOIN JOB  USING(JOB_CODE)
WHERE JOB_CODE='J3'; 
SELECT * FROM JOB;

-- ��å�� ������ ����� �̸�, ��å��, ��å�ڵ�, ������ ��ȸ�ϼ���.
SELECT  EMP_NAME, JOB_NAME,JOB_CODE, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '����';

-- JOIN �� NULL���� �����Ѵ�.
SELECT COUNT(*)
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

SELECT * FROM EMPLOYEE;

-- OUTER JOIN����ϱ�
-- �÷��� ���� ���Ϻ񱳸� ������ ���� ROW�� ������ִ� JOIN
-- ������ �Ǵ� ���̺�(��絥���͸� �����)�� ����������Ѵ�.
-- LEFT OUTER JOIN : JOIN�� �������� ���ʿ� �ִ� ���̺��� �������� ����
-- RIGHT OUTER JOIN : JOIN�� �������� �����ʿ� �ִ� ���̺��� �������� ����
-- ��ġ�Ǵ� ROW�� ���� ��� ��� �÷��� NULL�� ǥ���Ѵ�.
-- OUTER �� �����ص� �������
SELECT *
FROM EMPLOYEE LEFT  JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

SELECT *
FROM EMPLOYEE RIGHT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- CROSS JOIN : ��� ROW�� �������ִ� JOIN
-- 
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 1;

-- SELF JOIN : �Ѱ��� ���̺� �ٸ� �÷��� ���� ������ �ִ� �÷��� �ִ� ��� �׵ΰ� �÷��� �̿��ؼ� JOIN
SELECT * FROM EMPLOYEE;
-- MANAGER�� �ִ� ����� �̸�, �Ŵ��� ���̵�, �Ŵ��� �����ȣ, �Ŵ��� �̸� ��ȸ
SELECT E.EMP_NAME,E.MANAGER_ID,M.EMP_ID,M.EMP_NAME
FROM EMPLOYEE E
JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

-- ����̸�, �Ŵ������̵�, �Ŵ��������ȣ, �Ŵ��� �̸� ��ȸ
-- �Ŵ����� ������ ���� ����ϱ�
SELECT E.EMP_NAME,NVL(E.MANAGER_ID,'����'),NVL(M.EMP_ID,'����') ,NVL(M.EMP_NAME,'����')
FROM  EMPLOYEE E
         LEFT   JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

SELECT * FROM EMPLOYEE;


-- �������� ����񱳸� �ؼ� ó����. ON �÷���=�÷���
-- �񵿵����ο� ���� �˾ƺ���
-- ������ ���̺��� �������� �������Ѵ�.
SELECT * FROM SAL_GRADE;
SELECT * 
FROM EMPLOYEE
        JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND  MAX_SAL;
-- ȸ����� ����ư���, ��ǰ���(����) , ��� ���� ���� ȸ�����

-- ���������� �� �� �ִ�.
-- 3���̻��� ���̺��� �����ؼ� ����ϱ�
--����� �����, ��å��, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME,JOB_NAME,DEPT_TITLE
FROM EMPLOYEE
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB  USING(JOB_CODE);
        
-- ����� �����, �μ���, ��ì��, �ٹ�����(LOCALNAME)��ȸ�ϱ�
-- �μ����� ������ ���, �ٹ������� ������ ���߷��� ���
SELECT EMP_NAME,NVL(DEPT_TITLE,'���'),JOB_NAME,NVL(LOCAL_NAME,'���߷�')
FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        LEFT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
        JOIN JOB USING(JOB_CODE);
        
        

-- ��������  : SELECT �� �ȿ� SELECT���� �ϳ� �� �ִ� �������� ����.
-- ���������� �ݵ�� ��ȣ�ȿ� �ۼ��� �ؾ��Ѵ�.
-- ����������� ������ �޿��� �ް��ִ� ����� ��ȸ�ϱ�
SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������';
SELECT *
FROM EMPLOYEE
WHERE SALARY = 2000000;

SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '������');

-- D5�μ��� ��ձ޿����� ���� �޴� ������ϱ�
SELECT *
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5');

-- 1. �����༭������
-- �������� SELECT���� �����  1����, 1������ ��
-- �����մ°͵������� ������ ����������.
-- �÷�(SELECT), WHERE���� �񱳴�� ��
-- ������� �޿� ��պ��� ���� �޿��� �޴� ����� �̸�, �޿� , �μ��ڵ带 ����ϱ�
SELECT EMP_NAME, SALARY, DEPT_CODE,(SELECT AVG(SALARY)FROM EMPLOYEE) AS AVG
FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);
  
  -- �μ��� �ѹ����� ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_ID FROM DEPARTMENT WHERE  DEPT_TITLE='�ѹ���');

-- ������ �����ؼ� ����Ҽ����ִ�.
SELECT *
FROM EMPLOYEE
        JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE DEPT_TITLE = '�ѹ���';

-- ��å�� ������ ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE = (SELECT JOB_CODE FROM JOB WHERE JOB_NAME = '����');

-- 2. ������ ��������
-- ���������� ����� �Ѱ��� �ټ� ��(ROW) �� ���� ��
-- ��å�� ����, ������ ����� ��ȸ�ϱ�
SELECT JOB_CODE
FROM JOB
WHERE JOB_NAME IN('����','����');

-- �������� ������Ҷ� = �� ���Ұ���
-- OR �� IN ���� �����ؼ� ����Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN( SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN ('����','����'));

-- �����࿡ ���� ��Һ��ϱ�
-- >=, >, <, <=
--������ ��Һ���??�� ���¸�ɾ�
-- ANY : OR�� ROW�� ����
-- ALL  :  AND�� ROW�� ����
-- �÷� >(=) ANY(��������) :  ������ ���������� ��� �� �ϳ��� ũ�� �� -> ������ ���������� ����� �ּҰ����� ũ��
-- �÷�<(=) ANY(��������) :  ������ ���������� ��� �� �ϳ��� ������ �� -> ������ ���������� ����� �ִ밪���� ������ ��


SELECT *
FROM EMPLOYEE
WHERE SALARY >=  (SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));

SELECT *
FROM EMPLOYEE

--WHERE SALARY >= (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6'));
WHERE SALARY >= ANY (SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6'));

-- �÷� >(=) ALL(��������) : ������ ���������� ����� ��� Ŭ �� �� -> ������ ���������� ��� �� �ִ� ������ ũ�� ��
-- �÷� <(=) ALL(��������) : ������ ���������� ����� ��� ���� �� �� -> ������ ���������� ��� �� �ּҰ����� ������ ��
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
-- WHERE SALARY < (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6')); 
WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6')); 

-- 2000�� 1�� 1�� ���� �Ի��� �� ���� ���� �޴� �ͺ��� 2000�� 1�� 1�� ����  �޿��� ���� �޴� ����� �����, �޿�, ��ȸ
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE HIRE_DATE < '00/01/01'
          AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE HIRE_DATE > '00/01/01');


-- 3. ���߿� �������� : ���� �ټ�, ���� 1���� ������
-- ������ ������� �����μ�, �������޿� �ش��ϴ� ��� ��ȸ
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y' AND SUBSTR(EMP_NO, 8, 1) = '2';

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN = 'Y' AND SUBSTR(EMP_NO, 8, 1) = '2')
            AND ENT_YN = 'N';

-- ����������̸鼭 �޿��� 200���� ����� �ִ�.
-- �� ����� �̸�, �μ�, �޿� ���
SELECT DEPT_CODE, DEPT_TITLE, DEPT_ID FROM DEPARTMENT, EMPLOYEE;

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN (SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_ID = 'D8')
           AND SALARY >= 2000000;

-- 4. ������ ���߿� ��������
-- ����� �ѹ����̰� 300���� �̻� ������ �޴� ���
SELECT DEPT_CODE, SALARY
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE DEPT_TITLE = '�ѹ���' AND SALARY >= 3000000;

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN
        (SELECT DEPT_CODE, SALARY
         FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
         WHERE DEPT_TITLE = '�ѹ���' AND SALARY >= 3000000);

-- ������, ���߿� ���������� �÷����� ������� ����
-- WHERE, FROM���� ��� 
-- FROM���� ��� : INLINE VIEW

SELECT EMP_NAME,  (SELECT DEPT_CODE, SALARY
         FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
         WHERE DEPT_TITLE = '�ѹ���' AND SALARY >= 3000000) AS TEST
FROM EMPLOYEE;

-- ��� ��������
-- ���������� �����Ҷ� ���� ������ ���� ������ ����ϰԼ���
-- ���������� ���� ���������� ����� ������ �ְ�, ���������� ����� ���������� ����� ������ �ִ� ������
-- ������ ���� �μ��� ������� ��ȸ�� �ϱ� 
-- �����, �μ��ڵ�, �����
SELECT EMP_NAME, DEPT_CODE, (SELECT COUNT(*)  FROM EMPLOYEE WHERE DEPT_CODE = E.DEPT_CODE) AS �����
FROM EMPLOYEE E ;

-- WHERE �� ����������� �̿��ϱ�
-- EXISTS (��������) : ���������� ����� 1�� �̻��̸� TRUE, 0���̸� FALSE

SELECT *
FROM EMPLOYEE E
--WHERE EXISTS (SELECT DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE ='D9');
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- �ּұ޿��� �޴� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT SALARY FROM EMPLOYEE WHERE SALARY<E.SALARY);

-- ������� �����ȣ, �̸�, �Ŵ������̵�, �Ŵ��� �̸� ��ȸ�ϱ�
-- ���������� Ǯ���
SELECT EMP_ID, EMP_NAME, MANAGER_ID ,(SELECT EMP_NAME FROM EMPLOYEE M WHERE E.MANAGER_ID=M.EMP_ID)  AS �Ŵ����̸�
FROM EMPLOYEE E;


-- ����� �̸� , �޿� , �μ���, �ҼӺμ��޿� ��� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, DEPT_TITLE, TO_CHAR(FLOOR((SELECT AVG(SALARY)  FROM EMPLOYEE  WHERE E.DEPT_CODE = DEPT_CODE)))
FROM EMPLOYEE E
        JOIN DEPARTMENT  ON DEPT_CODE =DEPT_ID;

-- ������ J1�� �ƴ� ����߿��� �ڽ��� �μ��� ��� �޿����� �޿��� ���� �޴� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
WHERE JOB_CODE != 'J1'
    AND SALARY<(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.DEPT_CODE = DEPT_CODE);

-- �ڽ��� ���� ������ ��ձ޿����� ���� �޴� ������ �̸�, ��å��, �޿��� ��ȸ�ϱ�
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
        JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
        WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.JOB_CODE=JOB_CODE);
        
-- FROM ���� �������� �̿��ϱ�
-- INLINE VIEW
-- FROM���� ����ϴ� ���������� ��κ� ������ ���߿��������� ���
-- RESULT SET�� �ϳ��� ���̺�ó�� ����ϰ� �ϴ� ��
-- �����÷��� �����ϰ� �ְų�, JOIN�� ����� SELECT���� ���
-- VIEW : INLINE VIEW, STORED VIEW

-- EMPLOYEE���̺� ����(��,��)�� �߰��ؼ� ����ϱ�
SELECT E.*, 
    CASE
            WHEN  SUBSTR(EMP_NO,8,1) ='1' THEN '��'
            WHEN  SUBSTR(EMP_NO,8,1) ='3' THEN '��'
            WHEN  SUBSTR(EMP_NO,8,1) ='2' THEN '��'
            WHEN  SUBSTR(EMP_NO,8,1) ='4' THEN '��'
            END AS����

FROM EMPLOYEE E;

-- ������ ���ڸ� ����ϱ�
SELECT E.* ,DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') AS GENDER
FROM EMPLOYEE E
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');


-- INLINE VIEW
-- FROM ���� ���������� �̿��Ѵ�.
-- ��Ī�� �̿��ؼ� WHERE���� ����̰����ϴ�.
SELECT *
FROM(
        SELECT E.*, DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��') AS ����
        FROM EMPLOYEE E
) WHERE ���� = '��';

-- JOIN,���տ����� Ȱ��������
SELECT *
FROM (
        SELECT * 
        FROM EMPLOYEE
            LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
            JOIN JOB USING(JOB_CODE)
)
WHERE DEPT_TITLE='�ѹ���' AND JOB_NAME = '�λ���';

SELECT *
FROM (SELECT E.*,D.*,
            (SELECT TRUNC(AVG(SALARY)-1)FROM EMPLOYEE WHERE DEPT_CODE = E.DEPT_CODE) AS DEPT_SAL_AVG
            FROM EMPLOYEE E
            LEFT JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID)
WHERE DEPT_SAL_AVG > 3000000;    

-- ���տ������̿��ϱ�
SELECT *
FROM (SELECT EMP_ID AS CODE, EMP_NAME AS TITLE
        FROM EMPLOYEE
        UNION
        SELECT DEPT_ID, DEPT_TITLE
        FROM DEPARTMENT
        UNION
        SELECT JOB_CODE, JOB_NAME
        FROM JOB
)
WHERE CODE LIKE '%1%';

--SELECT *
--        FROM (SELECT ROWNUM AS RNUM,E.*
--                FROM (SELECT * FROM EMPLOYEE)E);

-- ROW�� ������ ���ϰ� ����ϱ�
-- TOP-N����ϱ� 
-- �޿��� ���� �޴� ��� 1~3������ ����ϱ�
SELECT EMP_NAME, SALARY
FROM (SELECT ROWNUM,E.* FROM EMPLOYEE E ORDER BY SALARY DESC)
--WHERE ROWNUM<=3
 WHERE ROWNUM BETWEEN 1 AND 3;

-- 1. ����Ŭ�� �����ϴ� ����Ŀ�� ROWNUM �� �̿��ϱ�
SELECT ROWNUM, E.* 
FROM EMPLOYEE E
WHERE ROWNUM BETWEEN 1 AND 3;

-- SELECT ���� �����Ҷ����� ROWNUM�� ������ ��,
SELECT ROWNUM,T.*
FROM(
            SELECT ROWNUM AS INNERNUM, E.*
            FROM EMPLOYEE E
            ORDER BY SALARY DESC
)T
WHERE ROWNUM<=3;


-- 5~10 �������ϱ�
--���߿� ����¡ó����?? ����ѵ� ����Ϸ��ƾƤ�������������������������
SELECT *
FROM(
    SELECT ROWNUM AS RNUM,T.*
    FROM( SELECT *
                FROM EMPLOYEE 
                ORDER BY SALARY DESC ) T)
WHERE RNUM  BETWEEN 5 AND 10;

-- 2. RANK_OVER()�Լ� �̿��ϱ�
-- �ߺ� ���� ������ŭ ���� ���� ���� ���� ��Ŵ
SELECT *
FROM(SELECT EMP_NAME, SALARY,RANK() OVER(ORDER BY SALARY DESC) AS NUM
FROM EMPLOYEE
)
WHERE NUM BETWEEN 5 AND 10;

-- DENSC_RANK() OVER �̿�
-- �ߺ� ������ �����ص� ���������� ���� ���� ���� ǥ���� 
SELECT *
FROM(SELECT EMP_NAME, SALARY,RANK() OVER(ORDER BY SALARY DESC) AS NUM,
DENSE_RANK() OVER(ORDER BY SALARY DESC) AS NUM2
FROM EMPLOYEE
)
WHERE NUM BETWEEN 1 AND 23;

-- ��ձ޿��� ���� �޴� �μ� 3�� ����ϱ�
--SELECT DEPT_CODE, AVG(SALARY)
--FROM(SELECT * FROM EMPLOYEE ORDER BY AVG(SALARY) DESC)
--WHERE ROWNUM <=3
--GROUP BY DEPT_CODE;


SELECT *
FROM(
    SELECT ROWNUM AS RNUM,D.*
    FROM(
        SELECT DEPT_TITLE,AVG(SALARY)AS SAL_AVG
        FROM DEPARTMENT
                JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
                GROUP BY DEPT_TITLE
        ORDER BY 2 DESC
    )   D
)
WHERE RNUM<=3;

-- DDL�� ���� �˾ƺ���
-- ������ ���Ǿ��� ����Ŭ���� ����ϴ� ��ü�� ����, ���� , �����ϴ� ��ɾ�
-- ���� : CREATE ������Ʈ�� ......
-- ���� : ALTER ������Ʈ�� ......
-- ���� : DROP ������Ʈ�� 

-- ���̺��� �����ϴ� ������� �˾ƺ���....
-- ���̺���� :  �����͸� ������ �� �ִ� ������ �����ϴ°�
-- ���̺��� �����ϱ� ���ؼ��� ��������� Ȯ���ϴµ� Ȯ���Ҷ� TYPE�� �ʿ�
-- ����Ŭ�� �����ϴ� Ÿ���� ���� ���� Ÿ�Կ� ���� �˾ƺ���.
-- ������Ÿ�� :  CHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB
-- ������Ÿ�� :  NUMBER
-- ��¥��Ÿ�� :  DATA, TIMESTAMP

-- ������Ÿ�Կ� ���� �˾ƺ���
-- CHAR(����) : ������ ���ڿ� ����Ÿ������ ���̸�ŭ ������ Ȯ���ϰ� �����Ѵ�. * �ִ� 2000����Ʈ���尡��
-- VARCHAR2(����) : ������ ���ڿ� ���� Ÿ������ ����Ǵ� �����͸�ŭ ����Ȯ���ϰ� �����Ѵ�. *�ִ� 4000����Ʈ���尡��
CREATE TABLE TBL_STR(
-- 6����Ʈ����
    A CHAR(6),
    B VARCHAR2(6),
    C NCHAR(6),
    D NVARCHAR2(6)
);

-- ���� ������� �����̵ȴ�.
SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('����','����','����','����');
-- �ڵ�����ȯ���� ���ڿ��� �ڵ�����ȯ���� ����.
INSERT INTO TBL_STR VALUES(12,'����','����','����');
-- NCHAR �� ����Ʈ���
-- VARCHAR�� ���ڼ����
--2000�����ϸ� �׳� VARCHAR2���� �ȴ�.
INSERT INTO TBL_STR VALUES('����','����','����','�����ٶ󸶹�');
SELECT LENGTH(A),LENGTH(B),LENGTH(C),LENGTH(D)
FROM TBL_STR;


-- ������ �ڷ���
-- NUMBER : �Ǽ�, ���� ��� ������ ������.
-- ������
-- NUMBER : �⺻��
-- NUMBER(PRECISION, SCALE) : ������ ���� ����
--      PRECISION :  ǥ���� �� �ִ� ��ü �ڸ���(1~38)
--      SCALE : �Ҽ��������� �ڸ���(-84 ~ 127)

CREATE TABLE TBL_NUM(
    -- ��ü�����
    A NUMBER,
    -- �����ڸ��� �ݿø��ؼ� ������ǥ��
    B NUMBER(5),
    -- �Ҽ��� ���ڸ���ǥ���� �ݿø�
    C NUMBER(5,1),
    -- �Ҽ����� ���ְ� 2ĭ������ ���� �����¼��� 0���θ���
    D NUMBER(5,-2)
    
);

SELECT * FROM TBL_NUM;

INSERT INTO TBL_NUM VALUES(1234.567,1234.567,1234.567,1234.567);
-- ���� 5�� �����ϴ�. �Ҽ��� �ڸ������ 
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,0,0);
-- ���� 4�ڸ� �Ҽ��� 1�ڸ��������´� �Ҽ����ڸ������
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,1234.123,0);
-- -2�ϸ� �� 7�ڸ��� �������ִ�.
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,1234.123,1234567);
-- �ڵ�����ȯ�� �����Ӵ� 
INSERT INTO TBL_NUM VALUES('1234.567','1234.567','1234.567','1234.567');


-- ��¥
-- DATE, TIMESTAMP
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    TODAY TIMESTAMP
);
SELECT * FROM TBL_DATE;
INSERT INTO TBL_DATE VALUES('98/08/03','98/01/26 15:30:30');
INSERT INTO TBL_DATE VALUES(TO_DATE('98/08/03','RR/MM/DD'),
                TO_TIMESTAMP('98/01/26 15:30:30','RR/MM/DD HH24:MI:SS'));

CREATE TABLE TBL_STR2(
    TESTSTR CLOB,
    TESTVARCHAR VARCHAR2(2000)
);
-- 2�Ⱑ ���������ϴ�.
--SELECT * FROM TBL_STR2;
--INSERT INTO TBL_STR2 VALUES(  

-- �⺻���̺� �ۼ��ϱ�
-- CREATE TABLE ���̺��)BOARD_COMMENT ( �÷��� �ڷ���(����),�÷���2 �ڷ���....);
-- ȸ���� �����ϴ� ���̺� �����
-- �̸� : ����, ȸ����ȣ : ����||����, ���̵� : ����,�н����� : ����, �̸��� : ���� , ���� : ���� , ����� : ��¥
CREATE TABLE MEMBER(
-- �ѱ��� �ѱ��ڽ� 3����Ʈ ���� 3�ڸ� ������ 5�ڸ��ϰ� 20���� �˳��� ��
MEMBER_NAME VARCHAR2(20),
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(15),
MEMBER_PWD VARCHAR2(20),
EMAIL VARCHAR2(30),
AGE NUMBER,
ENROLL_DATE DATE
);
SELECT *
FROM MEMBER;
-- ������ ���̺��� �÷��� ����(COMMENT)�ۼ��ϱ�
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ���̸� �ּ�2�����̻�����';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵� �ּ�4�����̻�����';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ �ּ�8�����̻�����';

SELECT * 
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MEMBER';

-- ���̺� Ŀ�ǵ��ۼ��ϱ�
COMMENT ON TABLE MEMBER IS 'ȸ����������';
SELECT *
FROM USER_TAB_COMMENTS;

-- ���̺� �� �÷��� ����Ǵ� �������� Ư���� ���� ���������� ������ �� �ִ�.
-- ����Ŭ�� �����ϴ� ��������
-- NOT NULL(C)  : ������ �÷��� NULL���� ��������ʴ� �� *DEFAULT���� NULLABLE(NULL���� �����ϴ�)
-- UNIQUE(U) : ������ �÷��� �ߺ����� ������� �ʴ� �� 
-- PRIMARY KEY(P) /PK : ������(ROW) �����ϴ� �÷��� �����ϴ� �������� -> NOT NULL, UNIQUE�������Ǽ�(�ߺ����ȵǰ� NULL���ȵȴ�) �ڵ����� ����������������
                                    -- �Ϲ������� �Ѱ����̺� �Ѱ� PK�� �����Ѵ�.
                                    --�ټ��÷��� ������ ���� �ִ�.(����Ű����Ѵ�)
-- FOREGIN KEY(R) : ������ �÷��� ���� �ٸ� ���̺��� ������ �÷��� �ִ� ���� �����ϰ� �ϴ� ��������
                        --�ٸ� ���̺� ������ �÷��� �ߺ��� ������ȵȴ�. (UNIQUE���������̳� PK���������� �������÷��̿����Ѵ�)

-- CHECK(C) : ������ �÷��� ������ ���� �����ϱ� ���� ��������  
--���, �������� �����Ҽ����ִ�.

-- ���̺� ������ ���������� Ȯ���ϴ� ��ɾ�
-- �÷����� �������ʴ´�.
SELECT *
FROM USER_CONSTRAINTS;
--���������̰ɸ� �÷����� Ȯ���ҷ���?
-- �÷����� �������� ���������̾ȳ��´�
SELECT * 
FROM USER_CONS_COLUMNS;
-- �׷�?? �������� �����ؼ�����Ѵ�.
SELECT C.CONSTRAINT_NAME , CONSTRAINT_TYPE, C.TABLE_NAME, SEARCH_CONDITION, COLUMN_NAME
FROM USER_CONSTRAINTS C
    JOIN USER_CONS_COLUMNS CC ON C.CONSTRAINT_NAME=CC.CONSTRAINT_NAME;
    

-- ���̺� �������� �����ϱ�
-- �������� �����ϴ� ��� 2����
-- 1. ���̺� ������ ���ÿ� �����ϱ�
--          1)�÷��������� ����
--              ��) CREATE TABLE ���̺��( �÷��� �ڷ��� ��������, �÷���2 �ڷ��� ��������,......)                
--          2)���̺������� ����(�������� ���������� �����Ѵ�)
--              ��) CREATE TABLE ���̺��( �÷��� �ڷ���, �÷���2 �ڷ��� ��������,......)                
-- 2.������ ���̺� �������� �߰��ϱ� -> ALTER��ɾ��̿�

-- NOT NULL �������Ǽ����ϱ�
-- �÷����������� ������ ����
CREATE TABLE BASIC_MEMBER(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20),
MEMBER_PWD VARCHAR2(20),
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER
);
-- ���������� �������������� ��� �÷����� NULL���� ����Ѵ�.
INSERT INTO BASIC_MEMBER VALUES(NULL,NULL,NULL,NULL,NULL);
SELECT * FROM BASIC_MEMBER;
-- ID, PASSWORD�� NULL�� ����ϸ� �ȵǴ� �÷�

--�÷�����
CREATE TABLE NN_MEMBER(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20) NOT NULL,
MEMBER_PWD VARCHAR2(20) NOT NULL,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER
);
INSERT INTO NN_MEMBER VALUES(NULL,'ADMIN','1234',NULL,NULL);
SELECT * FROM NN_MEMBER;

--���̺���
CREATE TABLE NN_MEMBER(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20) ,
MEMBER_PWD VARCHAR2(20) ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER
-- NOT NULL(MEMBER_NO) ���̺��������� ���� �Ұ���
--NOT NULL�� �÷��� �����°��� �����ؾ��Ѵ�
);

-- UNIQUE ��������
--�÷��� �����Ѱ��� �����ؾ��Ҷ� ���
SELECT * FROM BASIC_MEMBER;
INSERT INTO BASIC_MEMBER VALUES(1,'ADMIN',1234,'������',48);
INSERT INTO BASIC_MEMBER VALUES(2,'ADMIN',3333,'����1',31);
-- �̷����ع����� ���̵� �ߺ��ǹ�����.(���̵�� ������ �÷��� �����ؾ��Ѵ�)
-- �̶� UNIQUE���������� ����ؼ� �����Ѱ��� ������Ų��.
CREATE TABLE NQ_MEMBER(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20) UNIQUE ,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER
);

SELECT * FROM NQ_MEMBER;
INSERT INTO NQ_MEMBER VALUES(1,'ADMIN',1234,'������',44);
-- ����ũ�� ���������� ������ �ߺ������ִٸ�˾Ƽ� �˷��ش�.
INSERT INTO NQ_MEMBER VALUES(2,'ADMIN',1234,'����1',33);

-- UNIQUE���������� ������ ���� NULL���� ���� ó���� ���??
-- UNIQUE�� �ߺ����� ã�� NULL���� ã���ʴ´�.
INSERT INTO NQ_MEMBER VALUES(3,NULL,1234,'����2',22);
INSERT INTO NQ_MEMBER VALUES(4,NULL,4444,'����3',11);

-- NULL���� ������� ��������?
-- ���������� �߰��ϸ�ȴ�.
-- �÷��ڿ� �Ѵٽ��ָ�ȴ�.
--�׷��� �ߺ����� ��������ʰ� NULL���� ��������ʴ´�.
CREATE TABLE NQ_MEMBER2(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER
);
SELECT * FROM NQ_MEMBER2;
INSERT INTO NQ_MEMBER2 VALUES(1,NULL,1234,'������',44);
INSERT INTO NQ_MEMBER2 VALUES(1,'ADMIN',1234,'������',44);
INSERT INTO NQ_MEMBER2 VALUES(2,'ADMIN',2222,'����2',2);

-- UNIQUE���������� ���̺��������� ������ ����
-- �ټ��� �÷��� UNIQUE���������� �����Ҷ� ����Ѵ�.
CREATE TABLE NQ_MEMBER3(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20)  NOT NULL ,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER,
UNIQUE(MEMBER_ID)
);
INSERT INTO NQ_MEMBER3 VALUES(1,'ADMIN','1234','������',45);
INSERT INTO NQ_MEMBER3 VALUES(2,'ADMIN','2222','������',45);

-- �ټ��÷��� UNIQUE�������� �����ϱ�
-- ��������  
--�ټ��÷��� ���� ��ġ�ؾ� �ߺ������� �ν� - >�������÷��� �ϳ��� �׷����� ����

CREATE TABLE NQ_MEMBER4(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20)  NOT NULL ,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER,
UNIQUE(MEMBER_ID,MEMBER_NAME)
);
SELECT * FROM NQ_MEMBER4;
INSERT INTO NQ_MEMBER4 VALUES(1,'ADMIN','1234','������',44);
-- ����ũ�� 2�����÷� ��� ��µ� 2���� �Ѱ��� ���̴�
-- 2�� ���ΰ� ���������� ��������ʴ´�
--�ٷιؿ��� ���̵�� �ߺ������� �̸��� �ߺ��̾ƴϱ⶧���� ����ũ�� �����̾ȵȴ�.
INSERT INTO NQ_MEMBER4 VALUES(2,'ADMIN','3333','����1',33);
INSERT INTO NQ_MEMBER4 VALUES(3,'ADMIN','4444','������',24);

--PRIMARY KEY 
-- ������ ���̺��� �÷� �� ������ �ߺ����� ����, NULL���� ������� ������ ���÷��� �����Ѵ�.
-- PK�� �÷��� �����ؼ� Ȱ�� -> IDX, SYUDENTNO, PRODUCTNO <- ROW�� �����ҷ��� �ƹ��ǹ̾��� ��ȣ��
-- ����Ǵ� ������ �� �ϳ��� ���� ���� 

--PK�� �����ϸ� �ڵ����� UNIQUE, NOT NULL��������,INDEX�� �ο��ȴ�.
CREATE TABLE PK_MEMBER(
MEMBER_NO NUMBER PRIMARY KEY,
MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL ,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER,
UNIQUE(MEMBER_ID,MEMBER_NAME)
);
INSERT INTO PK_MEMBER VALUES(NULL,'ADMIN,''1234','������',44);
INSERT INTO PK_MEMBER VALUES(1,'ADMIN,''1234','������',44);
INSERT INTO PK_MEMBER VALUES(1,'USER01','2222','����1',22);

SELECT * FROM PK_MEMBER;

SELECT * FROM PK_MEMBER 
WHERE MEMBER_NO=1;

-- PK ���̺������� ������ ����
CREATE TABLE PK_MEMBER1(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL ,
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER,
PRIMARY KEY (MEMBER_NO)
);

INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','������',44);
INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','������',44);
-- PRIMARY KEY�� �ټ��÷��� ������ ��  �ִ�. -> ����Ű
-- ���̺� �������� ����
CREATE TABLE PK_MEMBER2(
MEMBER_NO NUMBER,
MEMBER_ID VARCHAR2(20),
MEMBER_PWD VARCHAR2(20) NOT NULL ,
MEMBER_NAME VARCHAR2(10),
MEMBER_AGE NUMBER,
PRIMARY KEY (MEMBER_NO,MEMBER_ID)
);
INSERT INTO PK_MEMBER2 VALUES(1,'USER01','1111','����1',33);
INSERT INTO PK_MEMBER2 VALUES(2,'USER01','2222','����2',22);
-- ?Q���� �Ѵ� �Ȱ��ƾ� �ߺ����� �ȵ���.
INSERT INTO PK_MEMBER2 VALUES(NULL,'USER01','3333','����3',33);
INSERT INTO PK_MEMBER2 VALUES(3,NULL,'3333','����3',33);
SELECT * FROM PK_MEMBER2;

-- �������̺�, ��ٱ��� ���̺� � ���ձ⸦ ������ �� �ִ�.
CREATE TABLE CART(
    MEMBER_ID VARCHAR2(20),
    PRODUCT_NO NUMBER,
    BUY_DATE DATE,
    STOCK NUMBER,
    PRIMARY KEY(MEMBER_ID,PRODUCT_NO,BUY_DATE)
);
--������ ���� ���̵� �������ǳ��� ��Ƽ� �ߺ��ȴٸ� ��������ʵ��� �����.

-- FOREIGN KEY
-- �ٸ����̺� �ִ� �����͸� ������ ����ϴ°�(����)
-- �������踦 �����ϸ� �θ�(�����Ǵ����̺�)-�ڽ�(�����ϴ����̺�)���谡 ������ ��.
-- FK���������� �ڽ����̺� ����
-- FK���������� �����ϴ� Ŀ���� UNIQUE���������̳� PK���������� �����Ǿ��־�� �Ѵ�.

-- �Խ���
CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200),
    BOARD_CONTENT VARCHAR2(3000),
    BOARD_WRITER VARCHAR2(10) NOT NULL,
    BOARD_DATE DATE
);
-- ���
--���� ����������Ѵ�
--���۷����� ���踦 �����ؼ� �����´�
CREATE TABLE BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO)
);

INSERT INTO BOARD VALUES(1, '�ù�',NULL,'������',SYSDATE);
SELECT * FROM BOARD;
INSERT INTO BOARD VALUES(2, '���̾�...','�ʹ��ϼ���!!!','���α�',SYSDATE);
INSERT INTO BOARD VALUES(3, '������ ���� �ݿ���','�ݿ����ε� ������ �ð��̾���.','���ֿ�',SYSDATE);

INSERT INTO BOARD_COMMENT VALUES(1, '�� �����!!','������',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(2, '�� �׷��ǵ��� �����','�ּ�',SYSDATE,2);

INSERT INTO BOARD_COMMENT VALUES(3, '�� �׷��ǵ��� �����','�ּ�',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(4, 'ȣȣȣ �ݿ������','������',SYSDATE,3);
SELECT * 
FROM BOARD
    JOIN BOARD_COMMENT ON BOARD_NO=BOARD_REF;
    
-- FK�� ������ �÷��� NULL???    ����ȴ�. �������� ��������
-- NOT NULL���������� �����ؾ��Ѵ�.
INSERT INTO BOARD_COMMENT VALUES(5,'NULL����?','�ּ�',SYSDATE,NULL);

SELECT *
FROM BOARD_COMMENT;

-- FK�� �����ؼ� ���̺� ���谡 ������ �Ǹ� �����ǰ� �ִ� �θ����̺���
--ROW�� �Ժη� ������ �� ����.
DELETE FROM BOARD WHERE BOARD_NO=1;

SELECT * 
FROM BOARD;

-- FK�����Ҷ� ������ ���� �ɼ��� ������ �� �ִ�.
-- ON DELETE SET NULL : �θ𰡻����Ǿ����� �����÷�(�ڽ�)�� NULL������ ���� 
-- �������� �����÷�(�ڽ�)�� NOT NULL ���������� ������ �ȵȴ�.
-- ON DELETE CASCADE : �����Ǵ� �θ����Ͱ� �����Ǹ� ���� �����ع���

CREATE TABLE BOARD_COMMENT2(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    --BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE SET NULL
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);
INSERT INTO BOARD VALUES(1,'�ù�',NULL,'������',SYSDATE);
INSERT INTO BOARD_COMMENT2 VALUES(6,'SET NULL','������',SYSDATE,1);
SELECT * FROM BOARD_COMMENT2;
DELETE FROM BOARD WHERE BOARD_NO = 1;
DROP TABLE BOARD_COMMENT2;


-- �������踦 �����Ҷ� ����̵Ǵ� �÷����� �ݵ�� UNIQUE ,PK���������� �����Ǿ��־���Ѵ�.
CREATE TABLE FK_TEST(
    FK_NO NUMBER,
    PARENT_NAME VARCHAR2(20),-- REFERENCES BASIC_MEMBER(MEMBER_ID)
    FOREIGN KEY(PARENT_NAME) REFERENCES NQ_MEMBER2(MEMBER_ID)
);    
-- FK�� �Ѱ��� ���̺� ���� �ټ��÷��� ������ �� ����.
-- FK�����ϴ� �÷��� �����ϴ� �÷��� Ÿ��, ����(��Ŀ�� �������)�� ��ġ�ؾ��Ѵ�.

-- CHECK ��������
-- �÷��� ������ ���� ������ �� �ְ� �ϴ� ��������
-- �÷��������� ����
CREATE TABLE PERSON(
    NAME VARCHAR2(20),
    AGE NUMBER CHECK(AGE>0) NOT NULL,
    GENDER VARCHAR2(5)  CHECK(GENDER IN('��','��'))  
);
SELECT * FROM PERSON;
INSERT INTO PERSON VALUES('������',19,'��');
INSERT INTO PERSON VALUES('������',19,'��');--�ȵ� ���Ǵ¿�������

-- ���̺� ������ DEFAULT���� ������ �� ����
-- DEFAULT ����� ���
CREATE TABLE DEFAULT_TEST(
    TEST_NO NUMBER PRIMARY KEY,
    TEST_DATE DATE DEFAULT SYSDATE,
    TEST_DATA VARCHAR2(20) DEFAULT '�⺻��'
); 
INSERT INTO DEFAULT_TEST VALUES(1,DEFAULT,DEFAULT);
INSERT INTO DEFAULT_TEST VALUES(2,'23/02/04','������');
INSERT INTO DEFAULT_TEST (TEST_NO) VALUES(3);
SELECT * FROM DEFAULT_TEST;

-- ���༳���� �̸������ϱ�
-- �⺻������� ���������� �����ϸ� SYS00000���� �ڵ����� ������,
CREATE TABLE MEMBER_TEST(
    MEMBER_NO NUMBER  CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_ID_UQ UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_PWD_NN NOT NULL,
    CONSTRAINT COMPOSE_UQ UNIQUE(MEMBER_NO,MEMBER_ID)
);

SELECT * 
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='MEMBER_TEST';

-- ���̺��� �����Ҷ� SELECT���� �̿��� �� �ִ�.
-- ���̺� ���� ����
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP_COPY;

CREATE TABLE EMP_SAL
AS SELECT E.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS SAL_DEPT_AVG
    FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_ID=DEPT_CODE ;

CREATE TABLE EMP_SAL2
AS SELECT E.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS SAL_DEPT_AVG
    FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_ID=DEPT_CODE  WHERE 1=2;

SELECT *
FROM EMP_SAL;
DESC EMP_SAL2;

CREATE TABLE TEST_MEMBER(
    MEMBER_CODE NUMBER CONSTRAINT PK_MEMBER_CODE PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD CHAR(20) NOT NULL,
    MEMBER_NAME NCHAR(10) DEFAULT '�ƹ���',
    MEMBER_ADDR CHAR(50) NOT NULL,
    GENDER VARCHAR2(5) CHECK(GENDER IN('��','��')) ,
    PHONE VARCHAR2(20) NOT NULL,
    HEIGHT NUMBER(5,2) CHECK(HEIGHT>=130) 
);

COMMENT ON COLUMN TEST_MEMBER.MEMBER_CODE IS 'ȸ�������ڵ�';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_ADDR IS 'ȸ�� ������';
COMMENT ON COLUMN TEST_MEMBER.GENDER IS 'ȸ�� ����';
COMMENT ON COLUMN TEST_MEMBER.PHONE IS 'ȸ�� ����ó';
COMMENT ON COLUMN TEST_MEMBER.HEIGHT IS 'ȸ�� Ű';



-- DML������ ���� �˾ƺ���
-- ���̺� ����Ǵ� �����͸� �ٷ�� ��ɾ�
-- INSERT : ���̺� ������(ROW)�� �߰��ϴ� ��ɾ�
-- UPDATE : ���̺� �ִ� �������� Ư���÷��� �����ϴ� ��ɾ�
-- DELETE : ���̺� �ִ� Ư��ROW�� �����ϴ� ��ɾ�
-- INSERT�� Ȱ���ϱ�
-- 1. ��ü�÷��� ���� �����ϱ�
-- INSERT INTO ���̺�� VALUES(�÷��� ������ ��,�÷��� ������ ��....)
--���̺� ����� ��� �÷����� �����ؾ��Ѵ�
-- 2. Ư���÷��� ��� ���� �����ϱ�
-- INSERT INTO ���̺��( Ư���÷�, Ư���÷�.....) VALUES(Ư���÷��� �����Ұ�, .....)
-- ������ �÷��� ���� VALUES�� �ִ� ���� ���ƾ���.
-- ������������ �÷��� ���� NULL���Ե�. ����! ������ �÷��� NOT NULL���������� ������ �ȵȴ�.

CREATE TABLE TEMP_DEPT
AS SELECT * FROM DEPARTMENT WHERE 1=0;

SELECT *
FROM TEMP_DEPT;

-- �÷�������� ����.
INSERT INTO TEMP_DEPT VALUES('D0','�ڹ�','L1');
-- �÷����� ���� ������Ѵ�.
-- �÷��� Ÿ�Ե� ������Ѵ�.
INSERT INTO TEMP_DEPT VALUES('D1','����Ŭ');
-- �÷��� �����ؼ� ���� �����ϱ�
DESC TEMP_DEPT;
INSERT INTO TEMP_DEPT(DEPT_ID,LOCATION_ID) VALUES('D2','L3');
SELECT *
FROM TEMP_DEPT;
INSERT INTO TEMP_DEPT(DEPT_ID) VALUES('D3');
CREATE TABLE TESTINSERT(
    TESTNO NUMBER PRIMARY KEY,
    TESTCONTENT VARCHAR2(200) DEFAULT 'TEST' NOT NULL
);
INSERT INTO TESTINSERT(TESTNO) VALUES(1);

--SELECT���� �̿��ؼ� �� �����ϱ�
CREATE TABLE INSERT_SUB
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID WHERE 1=2;

SELECT * FROM INSERT_SUB;
INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE SALARY>=3000000
);
SELECT * FROM INSERT_SUB;
-- EMPLOYEE���̺��� �μ��� D6�� �������  INSERT_SUB�� �����ϱ�
INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    F  FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE DEPT_CODE = 'D6'
 );   
 SELECT * FROM INSERT_SUB;
 
 -- ������ �÷��� SELECT������ ������ �����ϱ�
 INSERT INTO INSERT_SUB(EMP_ID,EMP_NAME)(SELECT EMP_ID,EMP_NAME FROM EMPLOYEE);
 
 -- INSERT ALL
 -- SELECT���� �̿��ؼ� �ΰ��̻��� ���̺��� ���� ������ ����Ҽ��� �ִ�.
 
 CREATE TABLE EMP_HIRE_DATE
 AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;
 
 CREATE TABLE EMP_MANAGER
 AS SELECT EMP_ID,EMP_NAME,MANAGER_ID FROM EMPLOYEE WHERE 1=0;

--2���� 25���� ����ִ´�. 
 INSERT ALL 
 INTO EMP_HIRE_DATE VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
 INTO EMP_MANAGER VALUES(EMP_ID,EMP_NAME,MANAGER_ID)
 SELECT EMP_ID, EMP_NAME, HIRE_DATE,MANAGER_ID
 FROM EMPLOYEE;
 
 SELECT * FROM EMP_HIRE_DATE;
 SELECT * FROM EMP_MANAGER;
 
    
-- INSERT ALL �� ���ǿ����缭 �����Ű��
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

-- EMPLOYEE���̺��� 00�� ���� �Ի��ڴ� EMP_OLD������
-- ���� �Ի��ڴ� EMP_NEW�� �����ϱ�
INSERT ALL
WHEN HIRE_DATE<'00/01/01' THEN INTO EMP_OLD VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
WHEN HIRE_DATE>='00/01/01' THEN INTO EMP_NEW VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

--UPDATE�� Ȱ���ϱ�
-- UPDATE ���̺�� SET �������÷��� = �����Ұ�, �������÷���=�����Ұ�...[WHERE ����]

CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME,DEPT_CODE, JOB_CODE, SALARY,BONUS
FROM EMPLOYEE;
SELECT * FROM EMP_SALARY;
--�������� �޿��� 300�������� �����ϱ�
UPDATE EMP_SALARY SET SALARY=3000000 WHERE EMP_NAME='������';
-- �ټ��÷����� ������ ���� ,  �� �����ؼ� �����Ѵ�.
UPDATE EMP_SALARY SET SALARY=2500000,BONUS=0.5 WHERE EMP_NAME = '������';
-- �ټ��� ROW�� �÷��� �����ϱ�
-- �μ��� D5�� ����� �޿��� 100000������ �߰��ϱ�
UPDATE EMP_SALARY SET SALARY=SALARY+100000 WHERE DEPT_CODE = 'D5';
SELECT *  FROM  EMP_SALARY WHERE DEPT_CODE = 'D5';

-- �������� ���� ����� �޿��� 50���� �ø��� ���ʽ��� 0.4�����ϱ�
UPDATE EMP_SALARY SET SALARY=SALARY+500000,BONUS = 0.4 WHERE EMP_NAME LIKE '��%';
SELECT * FROM EMP_SALARY WHERE EMP_NAME LIKE '��%';

-- ������ ��������!!! �ݵ�� WHERE�� �ۼ��ؼ� Ÿ���� ��Ȯ�ϰ� �����ؾ��Ѵ�.
-- WHERE �� �ۼ����������� ��üROW�� �����Ǵ� �����ؾ��Ѵ�.
UPDATE EMP_SALARY SET EMP_NAME = '������';
SELECT * FROM EMP_SALARY;
-- ������Ʈ���� Ŀ���ϱ�������(Ȯ������������)��� ���� 
-- �׷��� �ѹ��� �ϸ� ������ �����͵��� ���������� ���ư���.
ROLLBACK;

-- UPDATE������ SELECT�� Ȱ���ϱ�
-- �ڸ���� �μ�, ���ʽ� �� �ɺ����� �����ϰ� ��������
UPDATE EMP_SALARY
SET DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '�ɺ���'),
    BONUS = (SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME='�ɺ���')
WHERE EMP_NAME = '����';

SELECT * FROM EMP_SALARY WHERE EMP_NAME IN('����','�ɺ���');

ROLLBACK;

UPDATE EMP_SALARY
SET (DEPT_CODE,BONUS) = (SELECT DEPT_CODE,BONUS FROM EMPLOYEE WHERE EMP_NAME = '�ɺ���')
WHERE EMP_NAME='����';

--DELETE Ȱ���ϱ�
-- ���̺��� ROW�� �����ϴ� ��ɾ�
-- DELETE FROM ���̺�� [WHERE ����]
--D9 �μ����� �����ϱ�
DELETE FROM EMP_SALARY WHERE DEPT_CODE = 'D9';
SELECT * FROM EMP_SALARY;
ROLLBACK;
-- �����ϱ� ���δٻ�����; WHERE �� �߾���
DELETE FROM EMP_SALARY;

-- TRUNCATE ���� -> ROLLBACK�̾ȵȴ� ;;;; �ѹ� ������ �ظ��ϸ� ��������
TRUNCATE TABLE EMP_SALARY;

-- MERGE
--Ư���� ���̺��� ���س��� �ٸ����̺��� ��ĥ��
-- ������ �������ؼ��� A���̺�� ��ĥ��B���̺����ĥ�� ���ϰ�
--���ο����̺� INSERT�� ���ش�.

CREATE TABLE EMP_M1
AS SELECT *  FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT * FROM EMPLOYEE WHERE JOB_CODE = 'J4';

INSERT INTO EMP_M2 VALUES(999,'���ο�','561014-123456','KWACK@DF.COM','010121314123','D5','J1','S1',90000,0.5
,NULL,SYSDATE,DEFAULT,DEFAULT);

UPDATE EMP_M2 SET SALARY  = 0;
COMMIT;
SELECT * FROM EMP_M1;
SELECT * FROM EMP_M2;

MERGE INTO EMP_M1 USING EMP_M2 ON(EMP_M1.EMP_ID=EMP_M2.EMP_ID)
WHEN MATCHED THEN 
    UPDATE SET
        EMP_M1.SALARY=EMP_M2.SALARY
WHEN NOT MATCHED THEN
INSERT VALUES(EMP_M2.EMP_ID, EMP_M2.EMP_NAME, EMP_M2.EMP_NO, EMP_M2.EMAIL, 
EMP_M2.PHONE, EMP_M2.DEPT_CODE, EMP_M2.JOB_CODE, 
EMP_M2.SAL_LEVEL, EMP_M2.SALARY, EMP_M2.BONUS, EMP_M2.MANAGER_ID, 
EMP_M2.HIRE_DATE, EMP_M2.ENT_DATE, EMP_M2.ENT_YN);


    
-- DDL(ALTER,DROP)
-- ALTRE : ����Ŭ�� ���ǵǾ��ִ� OBJECT�� �����Ҷ� ����ϴ� ��ɾ�
-- ALTRE TABLE : ���̺� ���ǵǾ��ִ� �÷�, ���������� �����Ҷ� ���
CREATE TABLE TBL_USERALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
SELECT * FROM TBL_USERALTER;
-- ������ TBL_USERALTER���̺� �÷��� �߰��ϱ�
-- ALTER TABLE ���̺�� ADD (�÷��� �ڷ��� [��������])
ALTER TABLE TBL_USERALTER ADD (USER_NAME VARCHAR2(20));
DESC TBL_USERALTER;
INSERT INTO TBL_USERALTER VALUES(1,'ADMIN','1234','������');

--���̺� �����Ͱ� �ִ� ���¿��� �÷��� �߰��Ҽ����ִ�.
--�̵̹����Ͱ� �������� ������ �����ʹ� NULL�̵���.
ALTER TABLE TBL_USERALTER ADD (NICKNAME VARCHAR2(30));
SELECT * FROM TBL_USERALTER;

-- �̸��� �ּ� �߰��Ҷ� NOT NULL �������Ǽ���
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(40) DEFAULT ' �̼���' NOT NULL);
ALTER TABLE TBL_USERALTER ADD(GENDER VARCHAR2(10) CONSTRAINT GENDER_CK CHECK (GENDER  IN('��','��')));
INSERT INTO TBL_USERALTER VALUES(2,'USER01','USER01','����1','����','USER01@USER01.COM','��');

-- �������� �߰��ϱ�
--ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� �������Ǽ���
ALTER TABLE TBL_USERALTER ADD CONSTRAINT USERID_UQ UNIQUE(USER_ID);
INSERT INTO TBL_USERALTER VALUES(3,'USER02','USER02','����2','����2','USER01@USER02.COM','��');

INSERT INTO TBL_USERALTER VALUES(4,'USER03',NULL,'����2','����2','USER01@USER02.COM','��');
DELETE FROM TBL_USERALTER WHERE USER_NO=4;
--NOT NULL���������� �̹� �÷��� NULLABLE�� ������ �Ǿ��ֱ� ������ ADD�� �ƴ� MODIFY�� ������Ѵ�...
--ALTER TABLE TBL_USERALTER ADD CONSTRAINT PASSWORD_NN NOT NULL(PASSWORD);
ALTER TABLE TBL_USERALTER MODIFY USER_PWD CONSTRAINT USER_PWD NOT NULL;

-- �÷������ϱ� -> �÷��� Ÿ��, ũ�⸦ �����ϴ°�
-- ALTER TABLE ���̺�� MODIFY�÷��� �ڷ���
DESC TBL_USERALTER;
ALTER TABLE TBL_USERALTER MODIFY GENDER CHAR(10);

--�������� �����ϱ�
ALTER TABLE TBL_USERALTER
MODIFY USER_PWD CONSTRAINT USER_PWD_UQ UNIQUE;

-- �÷��� �����ϱ�
-- ALTER TABLE ���̺�� RENAME COLUMN �÷��� TO ���÷���
ALTER TABLE TBL_USERALTER RENAME COLUMN USER_ID TO USERID;
DESC TBL_USERALTER;

-- �������Ǹ� �����ϱ�
--ALTER TABLE ���̺�� RENAME CONSTRAINT �������Ǹ� TO ���������Ǹ�
ALTER TABLE TBL_USERALTER RENAME CONSTRAINT SYS_C007472 TO USERALTER_PK;

-- �÷������ϱ�
--ALTER TABLE ���̺�� DROP �÷���;
ALTER TABLE TBL_USERALTER DROP COLUMN EMAIL;
DESC TBL_USERALTER;

--�������ǻ����ϱ�
--ALTER TABLE  ���̺�� DROP CONSTRAINT �������Ǹ�;
ALTER TABLE TBL_USERALTER DROP CONSTRAINT USERALTER_PK;

-- ���̺� �����ϱ�
DROP TABLE TBL_USERALTER;
SELECT * FROM TBL_USERALTER;


--���̺� �����Ҷ� FK���������� �����Ǿ��ִٸ� �⺻������ ������ �Ұ�����.
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;

ALTER TABLE EMP_COPY ADD CONSTRAINT EMP_ID_PK PRIMARY KEY(EMP_ID);
CREATE TABLE TBL_FKTEST(
    EMP_ID VARCHAR2(20) CONSTRAINT FK_EMPID REFERENCES EMP_COPY(EMP_ID),
    CONTENT VARCHAR2(20)
);

DROP TABLE EMP_COPY;
-- �ɼ��� �����ؼ� ������ �� �ִ�.
-- �θ� �����ص� �ڽĿ��մ� �����ʹ� ���������ʴ´�  ������ ��������.
DROP TABLE EMP_COPY CASCADE CONSTRAINT;

-- DCL�� ���� �˾ƺ���. -> SYSTEM������ ����
-- ������� ���Ѱ����ϴ� ��ɾ�.
-- GRANT ����, ���� TO ����ڰ�����
-- ���� : CREATE VIEW, CREATE TABLE, INSERT, SELECT ,UPDATE ���
-- ���� (ROLE) : ������ ���� 
-- �� ����(ROLE)�� �ο��� ���� Ȯ���ϱ�
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='RESOURCE';
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='CONNECT';

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER QWER IDENTIFIED BY QWER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT CONNECT TO QWER;

-- BS������ ���̺��� ��ȸ�� �� �ִ� ���� �ο��ϱ�
-- SELECT �� ���Ѹ� ����
GRANT SELECT ON BS.EMPLOYEE TO QWER;
-- UPDATE �� ������ ����
GRANT UPDATE ON BS.EMPLOYEE TO QWER;

-- ����ȸ���ϱ�
-- REVOKE ���� | | ROLE FROM ����ڰ�����
-- SELECT �� ������ ȸ����
REVOKE SELECT ON BS.EMPLOYEE FROM QWER;
-- UPADTE�� ������ ȸ����
REVOKE UPDATE ON BS.EMPLOYEE FROM QWER;

-- ROLE �����
CREATE ROLE MYROLE;

GRANT SELECT ON BS.EMPLOYEE,
SELECT ON BS.DEPARTMENT, UPDATE ON BS.DEPARTMENT,
      INSERT ON BS.DEPARTMENT TO MYROLE;

GRANT SELECT ON BS.EMPLOYEE TO MYROLE;

GRANT CREATE TABLE, CREATE VIEW TO MYROLE;

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'MYROLE';
GRANT MYROLE TO QWER;

-- TCL : Ʈ�������� ��Ʈ���ϴ� ��ɾ�
-- COMMIT : ���ݱ��� ������ ��������(DML)��ɾ ��� DB�� ����
-- ROLLBACK : ���ݱ��� ������ ��������(DML)��ɾ ��� ���
-- Ʈ������ : �ϳ��� �۾����� �Ѱ� ����
-- Ʈ�������� ���Ǵ� ��ɾ� : DML(INSERT, UPDATE, DELETE)

INSERT INTO JOB VALUES('J0','����');
SELECT * FROM JOB;
COMMIT;

-- ORACLE���� �����ϴ� OBJECTȰ���ϱ�
-- USER, TABLE, VIEW, SEQUENCE, INDEX, SYNONYM, FUNCTION, PROCEDURE, PACKAGE ���
CREATE TABLE EMP_M1
AS SELECT * FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT * FROM EMPLOYEE WHERE JOB_CODE='J4';

INSERT INTO EMP_M2 VALUES(999,'���ο�','561014-123456','KWACK@DF.COM','01021314123','D5','J1','S1',90000,0.5,
    NULL,SYSDATE,DEFAULT,DEFAULT);
UPDATE EMP_M2 SET SALARY=0;
COMMIT;
SELECT * FROM EMP_M1;
SELECT * FROM EMP_M2;

MERGE INTO EMP_M1 USING EMP_M2 ON(EMP_M1.EMP_ID=EMP_M2.EMP_ID)
WHEN MATCHED THEN
    UPDATE SET
        EMP_M1.SALARY=EMP_M2.SALARY
WHEN NOT MATCHED THEN
    INSERT VALUES(EMP_M2.EMP_ID,EMP_M2.EMP_NAME,EMP_M2.EMP_NO,EMP_M2.EMAIL,EMP_M2.PHONE,
        EMP_M2.DEPT_CODE,EMP_M2.JOB_CODE,EMP_M2.SAL_LEVEL,EMP_M2.SALARY,EMP_M2.BONUS,
        EMP_M2.MANAGER_ID,
        EMP_M2.HIRE_DATE,EMP_M2.ENT_DATE,EMP_M2.ENT_YN);
        
SELECT * FROM EMP_M1;      




    








