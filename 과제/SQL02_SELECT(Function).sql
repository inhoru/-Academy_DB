SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_GRADE;

-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵��
--      ���� �⵵�� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--      (��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT STUDENT_NO AS �й�,STUDENT_NAME AS �̸�,TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') AS ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY 3;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �ִٰ� �Ѵ�.
-- �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
-- (* �̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- �� �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�.
-- (�� ���� �� 2000�� ���� ����ڴ� ������ ��� ���� "�����̸�", "����"�� �Ѵ�. ���̴� '��'���� ����Ѵ�.)
SELECT PROFESSOR_NAME AS �����̸� ,EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(PROFESSOR_SSN,1,2))+
CASE
        WHEN SUBSTR(PROFESSOR_SSN,8,1)IN (1,2) THEN 1900
        WHEN SUBSTR(PROFESSOR_SSN,8,1)IN (3,4) THEN 2000
        END) AS ����
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN,8,1) IN (1,3)
ORDER BY 2;


-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
--      ��� ����� "�̸�"�� �������� �Ѵ�. (���� 2���� ����� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME,2,2) AS �̸�
FROM TB_PROFESSOR;

-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�? (********\ROW�� �ȸ���*******)
--      �̶�, 19�쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE (EXTRACT(YEAR FROM ENTRANCE_DATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6))))>19;

-- 6. 2020�� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(TO_DATE('20201225'), 'DAY')
FROM DUAL;


-- 7. TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11', 'YY/MM/DD')�� ���� �� �� �� �� ��ĥ�� �ǹ��ұ�?
--      �� TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD')�� ���� ��� ��� ��ĥ�� �ǹ��ұ�?
SELECT TO_DATE('99/10/11', 'YY/MM/DD'),TO_DATE('49/10/11', 'YY/MM/DD'),
TO_DATE('99/10/11', 'RR/MM/DD') , TO_DATE('49/10/11', 'RR/MM/DD')
FROM DUAL;

-- 8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�.
--      2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

-- 9. �й��� A517178�� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
--      ��, �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT ROUND(AVG(POINT),1) AS ����
FROM TB_STUDENT
    JOIN TB_GRADE USING(STUDENT_NO)
WHERE STUDENT_NO = 'A517178';

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)"�� ���·� ����� ����� ������� ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO AS �а���ȣ,COUNT(DEPARTMENT_NO) AS "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ��� �˾Ƴ��� SQL���� �ۼ��Ͻÿ�.
SELECT  COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
--      ��, �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�,
--      ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT SUBSTR(TERM_NO,1,4) AS �⵵,ROUND(AVG(POINT),1) AS "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

-- 13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣȭ ���л� ���� ǥ���ϴ� SQL������ �ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO AS �а��ڵ�� ,COUNT(CASE WHEN ABSENCE_YN='Y' THEN 1 END) AS "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 14. �� ���б��� �ٴϴ� �������� �л����� �̸��� ã���� �Ѵ�. � SQL������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME, COUNT(STUDENT_NAME)
FROM TB_STUDENT
HAVING COUNT(STUDENT_NAME)>1
GROUP BY STUDENT_NAME
ORDER BY 1;

-- 15. �й��� A112113�� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
--      (��, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT SUBSTR(TERM_NO,1,4) AS �⵵ , SUBSTR(TERM_NO,5,2) AS �б�,ROUND(AVG(POINT),1) AS ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP (SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO,5,2));

