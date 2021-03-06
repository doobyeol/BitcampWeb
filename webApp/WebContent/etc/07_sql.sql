select *from member;

select*from user_constraints where table_name='EMPLOYEE';

--서브쿼리
SELECT *FROM(SELECT EMPNO, ENAME, SAL FROM EMP);
--괄호안에 있는게 하나의 테이블이라고 생각하고 하면된다. 

--
--단일행 서브 쿼리 :사원번호 SCOTT과 같은 업무를 하는 사원을 선택하라
SELECT EMPNO, ENAME, SAL, JOB DEPTNO FROM EMP 
WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');

--10부서의 급여평균보다 많이 받는 사원은?
SELECT AVG(SAL) FROM EMP WHERE DEPTNO ='10';

SELECT *FROM EMP WHERE SAL>2916.66666666;

SELECT *FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO ='10');

--사원 7698과 같은 업무를 하는 사원중 급여가 2500불 이상인 사원을 선택하라.
SELECT *FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO =7698) AND SAL>=2500;

--문제 1 사원테이블에서 사원명 입사일 담당업무 부서코드를 선택하되 
--'ADAMS'와 같은 업무를 하는 사원이거나 'scott'과 같은 부서인 사원을 선택하라
SELECT * FROM EMP;

SELECT ENAME,HIREDATE, JOB,DEPTNO FROM EMP
WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME ='ADAMS') OR
DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

--문제 2 사원테이블에서 사원번호가 7521인 사원과 업무가 같고 급여가 7934인 사원보다
--많은 사원의 사번, 이름, 업무, 입사일자,급여를 출력하세요

SELECT EMPNO,ENAME, JOB,HIREDATE, SAL FROM EMP
WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNO=7521) OR
SAL>(SELECT SAL FROM EMP WHERE EMPNO =7934);

SELECT *FROM EMP WHERE SAL<(SELECT AVG(SAL) FROM EMP);

SELECT DEPTNO, MIN(SAL) FROM EMP GROUP BY DEPTNO
HAVING MIN(SAL)>(SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 20);

--문제 3 사원 테이블의 사원의 급여가 10번부서의 평균 급여보다 많이 받는 업무를 하는 
--업무별 평균급여를 선택하라
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB
HAVING AVG(SAL)>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10);

SELECT ENAME, SAL FROM EMP WHERE SAL = 2450 OR SAL =5000 OR SAL =1300;
SELECT ENAME, SAL FROM EMP WHERE SAL IN(2450,5000,1300);
SELECT ENAME, SAL FROM EMP WHERE SAL IN( SELECT SAL FROM EMP WHERE DEPTNO=10);
--위 3 개는 모두 같은 결과값을가진다.
--20번 부서의 급여와 다른 사원을 선택하라
SELECT ENAME, SAL FROM EMP WHERE SAL NOT IN (SELECT SAL FROM EMP WHERE DEPTNO=20);

--부서별로 급여를 가장 많이 받는 사원의 사원번호, 사원명 급여 부서코드를 출력하라
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--업무별로 최대 급여를 받는 사원의 사원번호와 이름, 업무, 급여를 출력하세요
SELECT MAX(SAL) FROM EMP GROUP BY JOB;

SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY JOB);

--ANY : 여러개 데이터중 하나만 참이되도 참이된다고 한다. OR 연산과 비슷하다.

SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';--1600 1250 1500

--업무가 'SALESMAN인 사운의 최소급여보다 많으면서 부서번호가 20번이 아닌 사원의 이름 급여, 부서코드를 출력하라
SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE SAL> ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');

--문제 사원테이블 사원중 KIG속한 부서의 사원보다 늦게 입사한 사원의 사원명, 업무, 급여, 입사일을 선택하라
SELECT ENAME, JOB,SAL, HIREDATE FROM EMP 
WHERE HIREDATE > 
ANY(SELECT HIREDATE FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME ='KING'));


--ALL :모든 조건에 다 만족되어야 참 AND연산과 비슷핟.

--업무가 'SALESMAN'인 사원의 최대급여보다
--많으면서 부서번호가 20번이 아닌 사원의 이름과 급여를 출력하라

SELECT ENAME, SAL,JOB FROM EMP WHERE SAL >ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN')AND DEPTNO!=20;

--다중 열 서브쿼리
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE (SAL, DEPTNO)IN (SELECT SAL, DEPTNO FROM EMP WHERE DEPTNO =30 AND COMM IS NOT NULL);

--업무별로 최소 급여를 받는 사원의 사번, 이름, 업무, 부서번호를 출력하세요
--단, 업무별로 정렬하세요 

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP 
WHERE (JOB,SAL) IN (SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB);






