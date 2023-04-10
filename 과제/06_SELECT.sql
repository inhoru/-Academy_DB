--����1 ��������ο� ���� ������� ����� �̸�,�μ��ڵ�,�޿��� ����Ͻÿ�. 
SELECT *
FROM(
    SELECT EMP_NAME,DEPT_CODE,SALARY
    FROM EMPLOYEE
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID  
        WHERE DEPT_TITLE = '���������'
);
--����2
--��������ο� ���� ����� �� ���� ������ ���� ����� �̸�,�μ��ڵ�,�޿��� ����Ͻÿ�
SELECT *
FROM(
    SELECT EMP_NAME,DEPT_CODE,SALARY
    FROM EMPLOYEE
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID  
        WHERE DEPT_TITLE = '���������'
        ORDER BY SALARY DESC
)
WHERE ROWNUM = 1;

--����3
--�Ŵ����� �ִ� ����߿� ������ ��ü��� ����� �Ѱ� 
--���,�̸�,�Ŵ��� �̸�, ������ ���Ͻÿ�. 
--1. JOIN�� �̿��Ͻÿ�
SELECT E.EMP_ID,E.EMP_NAME,M.EMP_NAME,E.SALARY
FROM EMPLOYEE E
    JOIN EMPLOYEE M ON M.EMP_ID=E.MANAGER_ID
WHERE E.SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);
--2. JOIN���� �ʰ�, ��Į��������(SELECT)�� �̿��ϱ�
SELECT E.EMP_ID,E.EMP_NAME,(SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_ID = E.MANAGER_ID),E.SALARY
FROM EMPLOYEE E
WHERE MANAGER_ID IS NOT NULL AND E.SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);

--����4
--���� ������ ��ձ޿����� ���ų� ���� �޿��� �޴� ������ �̸�, �����ڵ�, �޿�, �޿���� ��ȸ
SELECT EMP_NAME,DEPT_CODE,SALARY,SAL_LEVEL
FROM EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE M WHERE E.DEPT_CODE = M.DEPT_CODE);

--����5
--�μ��� ��� �޿��� 2200000 �̻��� �μ���, ��� �޿� ��ȸ
--��, ��� �޿��� �Ҽ��� ����, �μ����� ���� ��� '����'ó��
SELECT NVL(DEPT_TITLE,'����'),FLOOR(AVG(SALARY))AS ��ձ޿�
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=2200000;

--����6
--������ ���� ��պ��� ���� �޴� ���ڻ����
--�����,���޸�,�μ���,������ �̸� ������������ ��ȸ�Ͻÿ�
--���� ��� => (�޿�+(�޿�*���ʽ�))*12    
-- �����,���޸�,�μ���,������ EMPLOYEE ���̺��� ���� ����� ������ 
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,(SALARY+(SALARY*NVL(BONUS,0)))*12
FROM EMPLOYEE 
   LEFT  JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
    JOIN JOB USING (JOB_CODE)
WHERE  SUBSTR(EMP_NO,8,1) IN ('2','4')AND (SALARY+(SALARY*NVL(BONUS,0)))*12 
<(SELECT AVG((SALARY+(SALARY*NVL(BONUS,0)))*12)FROM EMPLOYEE)
ORDER BY EMP_NAME; 
