select *from member;

select*from user_constraints where table_name='EMPLOYEE';

--��������
SELECT *FROM(SELECT EMPNO, ENAME, SAL FROM EMP);
--��ȣ�ȿ� �ִ°� �ϳ��� ���̺��̶�� �����ϰ� �ϸ�ȴ�. 

--
--������ ���� ���� :�����ȣ SCOTT�� ���� ������ �ϴ� ����� �����϶�
SELECT EMPNO, ENAME, SAL, JOB DEPTNO FROM EMP 
WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');

--10�μ��� �޿���պ��� ���� �޴� �����?
SELECT AVG(SAL) FROM EMP WHERE DEPTNO ='10';

SELECT *FROM EMP WHERE SAL>2916.66666666;

SELECT *FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO ='10');

--��� 7698�� ���� ������ �ϴ� ����� �޿��� 2500�� �̻��� ����� �����϶�.
SELECT *FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO =7698) AND SAL>=2500;

--���� 1 ������̺��� ����� �Ի��� ������ �μ��ڵ带 �����ϵ� 
--'ADAMS'�� ���� ������ �ϴ� ����̰ų� 'scott'�� ���� �μ��� ����� �����϶�
SELECT * FROM EMP;

SELECT ENAME,HIREDATE, JOB,DEPTNO FROM EMP
WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME ='ADAMS') OR
DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--���� 2 ������̺��� �����ȣ�� 7521�� ����� ������ ���� �޿��� 7934�� �������
--���� ����� ���, �̸�, ����, �Ի�����,�޿��� ����ϼ���

SELECT EMPNO,ENAME, JOB,HIREDATE, SAL FROM EMP
WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO=7521) OR
SAL>(SELECT SAL FROM EMP WHERE EMPNO =7934);

SELECT *FROM EMP WHERE SAL<(SELECT AVG(SAL) FROM EMP);

SELECT DEPTNO, MIN(SAL) FROM EMP GROUP BY DEPTNO
HAVING MIN(SAL)>(SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 20);

--���� 3 ��� ���̺��� ����� �޿��� 10���μ��� ��� �޿����� ���� �޴� ������ �ϴ� 
--������ ��ձ޿��� �����϶�
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB
HAVING AVG(SAL)>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10);

SELECT ENAME, SAL FROM EMP WHERE SAL = 2450 OR SAL =5000 OR SAL =1300;
SELECT ENAME, SAL FROM EMP WHERE SAL IN(2450,5000,1300);
SELECT ENAME, SAL FROM EMP WHERE SAL IN( SELECT SAL FROM EMP WHERE DEPTNO=10);
--�� 3 ���� ��� ���� �������������.
--20�� �μ��� �޿��� �ٸ� ����� �����϶�
SELECT ENAME, SAL FROM EMP WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO=20);

--�μ����� �޿��� ���� ���� �޴� ����� �����ȣ, ����� �޿� �μ��ڵ带 ����϶�
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--�������� �ִ� �޿��� �޴� ����� �����ȣ�� �̸�, ����, �޿��� ����ϼ���
SELECT MAX(SAL) FROM EMP GROUP BY JOB;

SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY JOB);

--ANY : ������ �������� �ϳ��� ���̵ǵ� ���̵ȴٰ� �Ѵ�. OR ����� ����ϴ�.

SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';--1600 1250 1500

--������ 'SALESMAN�� ����� �ּұ޿����� �����鼭 �μ���ȣ�� 20���� �ƴ� ����� �̸� �޿�, �μ��ڵ带 ����϶�
SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE SAL> ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

--���� ������̺� ����� KIG���� �μ��� ������� �ʰ� �Ի��� ����� �����, ����, �޿�, �Ի����� �����϶�
SELECT ENAME, JOB,SAL, HIREDATE FROM EMP 
WHERE HIREDATE > 
ANY(SELECT HIREDATE FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME ='KING'));


--ALL :��� ���ǿ� �� �����Ǿ�� �� AND����� �����.

--������ 'SALESMAN'�� ����� �ִ�޿�����
--�����鼭 �μ���ȣ�� 20���� �ƴ� ����� �̸��� �޿��� ����϶�

SELECT ENAME, SAL,JOB FROM EMP WHERE SAL >ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN')AND DEPTNO!=20;

--���� �� ��������
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE (SAL, DEPTNO)IN (SELECT SAL, DEPTNO FROM EMP WHERE DEPTNO =30 AND COMM IS NOT NULL);

--�������� �ּ� �޿��� �޴� ����� ���, �̸�, ����, �μ���ȣ�� ����ϼ���
--��, �������� �����ϼ��� 

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP 
WHERE (JOB,SAL) IN (SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB);






