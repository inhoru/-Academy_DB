--1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. �� ��� ����� "�а� ��","�迭"���� ǥ���ϵ����Ѵ�.
SELECT DEPARTMENT_NAME AS "�а� ��",CATEGORY AS �迭
FROM TB_DEPARTMENT;

--2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT DEPARTMENT_NAME||'�� ������ '||CAPACITY||' �� �Դϴ�.'AS "�а��� ����"
FROM TB_DEPARTMENT;

--3. ������а� �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
-- �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ���������
SELECT STUDENT_NAME
FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN,8,1) IN ('2','4') 
AND DEPARTMENT_NAME = '������а�';    

--4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�.
-- �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079','A513090','A513091','A513110','A513119');

--5. ���������� 20���̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

--6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ��а��� ������ �ִ�.
--�׷� �� ������б� ������ �̸��� �˾Ƴ��� �ִ� SQL���� �ۼ�
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

--7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ����Ѵ�.
--��� SQL������ ����ϸ� �� ������ �ۼ��Ͻÿ�.

