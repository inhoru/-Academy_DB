SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR; 
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_GRADE;

-- 1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
--      ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME AS �л��̸�,STUDENT_ADDRESS AS �ּ���
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY SUBSTR(STUDENT_SSN,1,6) DESC;

-- 3. �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸��� �й�,
--      �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�.
--      ��, ���������� "�л��̸�", "�й�", "������ �ּ�"�� ��µǵ��� �Ѵ�.
SELECT STUDENT_NAME AS �л��̸�, STUDENT_NO AS �й� , STUDENT_ADDRESS AS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE '%A%' AND (STUDENT_ADDRESS LIKE '%������%' OR STUDENT_ADDRESS LIKE '%��⵵%')
ORDER BY 1;

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL������ �ۼ��Ͻÿ�.
--      (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ����� ����)
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = 05
ORDER BY SUBSTR(PROFESSOR_SSN,1,6);
    
-- 5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�.
--      ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��غ��ÿ�.
SELECT STUDENT_NO,POINT
FROM TB_GRADE
    JOIN TB_CLASS USING(CLASS_NO)
WHERE CLASS_NO = 'C3118100' AND TERM_NO=200402
ORDER BY 2 DESC, SUBSTR(STUDENT_NO,2,6);

-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME , DEPARTMENT_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);
    
-- 8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME,PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING(PROFESSOR_NO);
-- 9. 8���� ��� �� '�ι���ȸ' �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�.
--      �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME,PROFESSOR_NAME
FROM TB_CLASS S
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING(PROFESSOR_NO)
    JOIN TB_DEPARTMENT D ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
WHERE CATEGORY ='�ι���ȸ';

-- 10. '�����а�' �л����� ������ ���Ϸ��� �Ѵ�.
--      �����а� �л����� "�й�", "�л��̸�", "��ü ����"�� ����ϴ� SQL���� �ۼ��Ͻÿ�.
--      (��, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT STUDENT_NO AS �й�,STUDENT_NAME AS "�л� �̸�",ROUND(AVG(POINT),1) AS "��ü ����"
FROM TB_STUDENT
    JOIN TB_GRADE USING(STUDENT_NO)
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'    
GROUP BY STUDENT_NO,STUDENT_NAME;

-- 11. �й��� A313047�� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� ����
--      �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL���� �ۼ��Ͻÿ�.
--      ��, �������� "�а��̸�", "�л��̸�", "�������� �̸�"���� ��µǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME AS �а��̸�, STUDENT_NAME AS �л��̸�, PROFESSOR_NAME AS ���������̸�
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON PROFESSOR_NO = COACH_PROFESSOR_NO
WHERE STUDENT_NO = 'A313047';    

-- 12. 2007�⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���ϴ�
--      SQL���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
    JOIN TB_GRADE USING(STUDENT_NO)
    JOIN TB_CLASS USING(CLASS_NO)
WHERE TERM_NO LIKE '2007%' AND CLASS_NAME = '�ΰ������';    
    
-- 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã��
--      �� ���� �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME,DEPARTMENT_NAME
FROM TB_CLASS C
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    LEFT JOIN TB_CLASS_PROFESSOR  P ON C.CLASS_NO=P.CLASS_NO
WHERE CATEGORY = '��ü��'AND P.CLASS_NO IS NULL;
    

-- 14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�. �л��̸��� �������� �̸��� ã��
--      ���� ���� ������ ���� �л��� ��� "�������� ������"���� ǥ���ϵ��� �ϴ� SQL���� �ۼ��Ͻÿ�.
--      ��, �������� "�л��̸�", "��������"�� ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.
SELECT S.STUDENT_NAME,NVL(PROFESSOR_NAME,'�������� ������')
FROM TB_STUDENT S
    LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
    JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE DEPARTMENT_NAME = '���ݾƾ��а�'
ORDER BY ENTRANCE_DATE;
    
-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�, �̸�, ������
--       ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO AS �й�,STUDENT_NAME AS �̸�,DEPARTMENT_NAME AS "�а� �̸�",AVG(POINT) AS ����
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    JOIN TB_GRADE USING(STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0;

-- 16. ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL���� �ۼ��Ͻÿ�.
SELECT CLASS_NO, CLASS_NAME,AVG(POINT)
FROM TB_CLASS
    JOIN TB_GRADE USING(CLASS_NO)
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�'  AND CLASS_TYPE LIKE '����%'  
GROUP BY CLASS_NO, CLASS_NAME;


-- 17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_STUDENT WHERE STUDENT_NAME = '�ְ���');

    
-- 18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT *
FROM(
    SELECT STUDENT_NO,STUDENT_NAME
    FROM TB_STUDENT
        JOIN TB_GRADE  USING(STUDENT_NO)
        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    WHERE DEPARTMENT_NAME = '������а�'   
    GROUP BY STUDENT_NO,STUDENT_NAME
    ORDER BY AVG(POINT) DESC )
WHERE ROWNUM = 1;


-- 19. �� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������ �ľ��ϱ� ����
--      ������ SQL���� ã�Ƴ��ÿ�. �� �������� "�迭 �а���", "��������"���� ǥ�õǵ��� �ϰ�,
--      ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME,AVG(POINT)
FROM TB_DEPARTMENT
    JOIN TB_CLASS USING(DEPARTMENT_NO)
    JOIN TB_GRADE USING(CLASS_NO)
WHERE CLASS_NAME = '�ڿ�����' AND CLASS_TYPE LIKE '����%'
GROUP BY DEPARTMENT_NAME
    
-- 1. �л��̸��� �ּ����� ǥ���ϱ�
-- ��, �̸����� �������� ���� ǥ��

SELECT STUDENT_NAME AS �л��̸�, STUDENT_ADDRESS AS �ּ���
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ���

SELECT STUDENT_NAME AS �л��̸�, STUDENT_SSN AS �ֹι�ȣ
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3. �ּ����� ������, ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸�, �й�, �ּҸ� ������������ ���

SELECT STUDENT_NAME AS �л��̸�, STUDENT_NO AS �й�, STUDENT_ADDRESS AS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%' AND STUDENT_ADDRESS LIKE '��⵵%' OR STUDENT_ADDRESS LIKE '������%' 
ORDER BY �л��̸�, �й�, "������ �ּ�";

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� ���

SELECT PROFESSOR_NAME AS ������, PROFESSOR_SSN AS �ֹι�ȣ
FROM TB_PROFESSOR JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '���а�'
ORDER BY PROFESSOR_SSN;

-- 5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ��
-- ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ���

SELECT STUDENT_NO AS �й�, POINT AS ����
FROM TB_STUDENT JOIN TB_GRADE USING(STUDENT_NO)
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO;

-- 6. �л���ȣ, �л��̸�, �а����� �л��̸����� ������������ ����

SELECT STUDENT_NO AS �л���ȣ, STUDENT_NAME AS �л���, DEPARTMENT_NAME AS �а���
FROM TB_STUDENT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-- 7. �� ������ �����̸��� �а��̸��� ���

SELECT CLASS_NAME AS �����, DEPARTMENT_NAME AS �а���
FROM TB_CLASS JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);

-- 8. ���� �����̸� ���

SELECT CLASS_NAME AS �����, PROFESSOR_NAME AS ������
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO);

-- 9. 8�� ��� �� '�ι���ȸ' �迭�� ���� ������ ���� �̸��� ã�� ���

SELECT CLASS_NAME AS �����, PROFESSOR_NAME AS ������
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO)
WHERE CATEGORY = '�ι���ȸ'
ORDER BY PROFESSOR_NAME;

-- 10. '�����а�' �л����� ������ ����, �й�, �л���, ��ü ������ ���

SELECT STUDENT_NO AS �й�, STUDENT_NAME AS �л���, TRUNC(AVG(POINT), 1) AS ����
FROM TB_STUDENT 
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME;

-- 11. �й��� 'A313047'�� �л��� �а��̸�, �л��̸�, ���������̸��� ���

SELECT DEPARTMENT_NAME AS �а���, STUDENT_NAME AS �л���, PROFESSOR_NAME AS ����������
FROM TB_DEPARTMENT
    JOIN TB_STUDENT USING(DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE STUDENT_NO = 'A313047';

-- 12 . 2007�⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б��̸� ǥ��

SELECT STUDENT_NAME AS �л���, TERM_NO AS �����б�
FROM TB_CLASS
    JOIN TB_GRADE USING(CLASS_NO)
    JOIN TB_STUDENT USING(STUDENT_NO)
WHERE CLASS_NAME = '�ΰ������' AND SUBSTR(TERM_NO, 1, 4) = '2007';

-- 13. ��ü�� �迭 ���� �� ���� ��米���� �Ѹ� �������� ���� ������ �а��� ���

SELECT CLASS_NAME AS �����, DEPARTMENT_NAME AS �а���
FROM TB_CLASS 
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    LEFT JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE PROFESSOR_NO IS NULL AND CATEGORY = '��ü��';

-- 14. �� ���� ���ݾƾ��а� �л����� ���� ������ �Խ��ϰ��� �Ѵ�.
-- �л���� ������������ ã�� ���������� ���� �л��� '�������� ������'���� ǥ���ؼ� ���
-- �� ��, ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.

SELECT STUDENT_NAME AS �л��̸�, NVL(PROFESSOR_NAME, '�������� ������') AS ��������
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    LEFT JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE DEPARTMENT_NAME = '���ݾƾ��а�';

-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �й�, �̸�, �а�, �̸�, ���� ���

SELECT STUDENT_NO AS �й�, STUDENT_NAME AS �̸�, DEPARTMENT_NAME AS �а���, TRUNC(AVG(POINT),1) AS ����
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING TRUNC(AVG(POINT),1) >= 4.0;

-- 16. ȯ�������а� ����������� ���� ������ ���

SELECT CLASS_NO AS �����ȣ, CLASS_NAME AS �����, TRUNC(AVG(POINT), 8) AS ����
FROM TB_CLASS
    JOIN TB_GRADE USING(CLASS_NO)
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�' AND CLASS_TYPE LIKE '����%'
GROUP BY CLASS_NO, CLASS_NAME;

-- 17. �� ������ �ٴϴ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ���

SELECT STUDENT_NAME AS �л���, STUDENT_ADDRESS AS �ּ�
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_STUDENT WHERE STUDENT_NAME = '�ְ���');

    
-- 18. ������а����� �� ������ ���� ���� �л���, �й��� ǥ��

SELECT STUDENT_NAME AS �л���, STUDENT_NO AS �й�
FROM (SELECT STUDENT_NAME, STUDENT_NO
        FROM TB_STUDENT
            JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
            JOIN TB_GRADE USING(STUDENT_NO)
        WHERE DEPARTMENT_NAME = '������а�'
        GROUP BY STUDENT_NO, STUDENT_NAME
        ORDER BY AVG(POINT) DESC)
WHERE ROWNUM = 1;

-- 19. �� ������ 'ȯ�������а�'�� ���� ���� �迭 �а����� �а� �� �������� ������ ���

SELECT DEPARTMENT_NAME AS �а���, ROUND(AVG(POINT),1) AS ��������
FROM TB_DEPARTMENT
        JOIN TB_CLASS USING(DEPARTMENT_NO)
        JOIN TB_GRADE USING(CLASS_NO)
WHERE CATEGORY = '�ڿ�����' AND CLASS_TYPE LIKE '����%'
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;