SQL> create table MENU (
  2  ID number(10),
  3  Name_of_food varchar(47),
  4  Rate number(7)
  5  );

Table created.

SQL> alter table MENU add type_of_food varchar(30);

Table altered.

SQL> alter table MENU add place varchar(77);

Table altered.

SQL> select * from MENU;

no rows selected

SQL> desc MENU;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER(10)
 NAME_OF_FOOD                                       VARCHAR2(47)
 RATE                                               NUMBER(7)
 TYPE_OF_FOOD                                       VARCHAR2(30)
 PLACE                                              VARCHAR2(77)

SQL> insert into MENU values(1,'chicken',5,'NON_VEG','AndhraPradesh');

1 row created.

SQL> insert into MENU values(2,'Gobi',4,'VEG','Anantapur');

1 row created.

SQL> insert into MENU values(3,'Fish',4,'NON_VEG','Karnataka');

1 row created.

SQL> insert into MENU values(4,'EGG',3,'VEG','Telangana');

1 row created.

SQL> insert into MENU values(5,'Mutton',5,'NON_VEG','Anantapuramu');

1 row created.


SQL> select * from menu;

        ID NAME_OF_FOOD                                          RATE TYPE_OF_FOOD                   PLACE
---------- ----------------------------------------------- ---------- ------------------------------
         1 chicken                                                  5 NON_VEG                        AndhraPradesh
         2 Gobi                                                     4 VEG                            Anantapur
         3 Fish                                                     4 NON_VEG                        Karnataka
         4 EGG                                                      3 VEG                            Telangana
         5 Mutton                                                   5 NON_VEG                        Anantapuramu


SQL> select NAME_OF_FOOD from MENU
  2  where TYPE_OF_FOOD = 'VEG';

NAME_OF_FOOD
-----------------------------------------------
Gobi
EGG


SQL> 1  select NAME_OF_FOOD from MENU
     2  where RATE in (select RATE from MENU
     3 where TYPE_OF_FOOD='NON_VEG');

NAME_OF_FOOD
-----------------------------------------------
Mutton
chicken
Fish
Gobi

SQL>  1  select NAME_OF_FOOD from MENU
      2  where RATE in (select RATE from MENU
      3 where TYPE_OF_FOOD='NON_VEG' and RATE=5);

NAME_OF_FOOD
-----------------------------------------------
Mutton
chicken

SQL> select TYPE_OF_FOOD from MENU
  2  where id = (select id from MENU
  3  where TYPE_OF_FOOD='VEG' and RATE=4);

TYPE_OF_FOOD
------------------------------
VEG


SQL> select NAME_OF_FOOD from MENU
  2  where PLACE in (select PLACE from Menu
  3  where PLACE='Anantapuramu' and ID=5);

NAME_OF_FOOD
-----------------------------------------------
Mutton

SQL> 1  select * from menu
     2  where place in (select place from menu
     3 where place='Karnataka');

        ID NAME_OF_FOOD                                          RATE TYPE_OF_FOOD                   PLACE
---------- ----------------------------------------------- ---------- ------------------------------
         3 Fish                                                     4 NON_VEG                        Karnataka


SQL  1   select place from menu
     2  where rate in (select rate from menu
     3 where rate=4 and TYPE_OF_FOOD='NON_VEG');

PLACE
---------------------------------------------------------
Karnataka
Anantapur

----------------------------------------------------------------------------------
JOINS=>


INNERJOIN=>

SQL> SELECT E1.ENAME,E1.EMPNO,E2.ENAME,E2.EMPNO
  2   FROM EMP E1,EMP E2
  3   WHERE E1.MGR =E2.EMPNO;

ENAME           EMPNO ENAME           EMPNO
---------- ---------- ---------- ----------
SMITH            7369 FORD             7902
ALLEN            7499 BLAKE            7698
WARD             7521 BLAKE            7698
JONES            7566 KING             7839
MARTIN           7654 BLAKE            7698
BLAKE            7698 KING             7839
CLARK            7782 KING             7839
SCOTT            7788 JONES            7566
TURNER           7844 BLAKE            7698
ADAMS            7876 SCOTT            7788
JAMES            7900 BLAKE            7698
FORD             7902 JONES            7566
MILLER           7934 CLARK            7782

13 rows selected.

SQL> select ename,sal,loc from emp,dept
  2  where emp.deptno=emp.deptno and sal>1600;

ENAME             SAL LOC
---------- ---------- -------------
JONES            2975 NEW YORK
BLAKE            2850 NEW YORK
CLARK            2450 NEW YORK
SCOTT            3000 NEW YORK
KING             5000 NEW YORK
FORD             3000 NEW YORK
JONES            2975 DALLAS
BLAKE            2850 DALLAS
CLARK            2450 DALLAS
SCOTT            3000 DALLAS
KING             5000 DALLAS
FORD             3000 DALLAS
JONES            2975 CHICAGO
BLAKE            2850 CHICAGO
CLARK            2450 CHICAGO
SCOTT            3000 CHICAGO
KING             5000 CHICAGO
FORD             3000 CHICAGO
JONES            2975 BOSTON
BLAKE            2850 BOSTON
CLARK            2450 BOSTON
SCOTT            3000 BOSTON
KING             5000 BOSTON
FORD             3000 BOSTON

24 rows selected.


SQL> select ename,sal,dname,loc,grade from emp,dept,salgrade
  2  where emp.deptno=dept.deptno and sal between losal and hisal;

ENAME             SAL DNAME          LOC                GRADE
---------- ---------- -------------- ------------- ----------
SMITH             800 RESEARCH       DALLAS                 1
JAMES             950 SALES          CHICAGO                1
ADAMS            1100 RESEARCH       DALLAS                 1
WARD             1250 SALES          CHICAGO                2
MARTIN           1250 SALES          CHICAGO                2
MILLER           1300 ACCOUNTING     NEW YORK               2
TURNER           1500 SALES          CHICAGO                3
ALLEN            1600 SALES          CHICAGO                3
CLARK            2450 ACCOUNTING     NEW YORK               4
BLAKE            2850 SALES          CHICAGO                4
JONES            2975 RESEARCH       DALLAS                 4
SCOTT            3000 RESEARCH       DALLAS                 4
FORD             3000 RESEARCH       DALLAS                 4
KING             5000 ACCOUNTING     NEW YORK               5

14 rows selected.

SQL> SELECT DNAME,SUM(SAL)
  2   FROM EMP E INNER JOIN DEPT D
  3   ON E.DEPTNO=D.DEPTNO
  4   GROUP BY DNAME;

DNAME            SUM(SAL)
-------------- ----------
ACCOUNTING           8750
RESEARCH            10875
SALES                9400

RIGHT OUTER JOIN=>

SQL> SELECT ENAME,DNAME
  2   FROM EMP RIGHT OUTER JOIN DEPT
  3   ON EMP.DEPTNO=DEPT.DEPTNO
  4   WHERE ENAME IS NULL;

ENAME      DNAME
---------- --------------
           OPERATIONS

SQL> SELECT EMPNO,LOC,DNAME,SAL 
  2  FROM DEPT RIGHT OUTER JOIN EMP
  3  ON EMP.DEPTNO=DEPT.DEPTNO;

     EMPNO LOC           DNAME                 SAL
---------- ------------- -------------- ----------
      7369 DALLAS        RESEARCH              800
      7499 CHICAGO       SALES                1600
      7521 CHICAGO       SALES                1250
      7566 DALLAS        RESEARCH             2975
      7654 CHICAGO       SALES                1250
      7698 CHICAGO       SALES                2850
      7782 NEW YORK      ACCOUNTING           2450
      7788 DALLAS        RESEARCH             3000
      7839 NEW YORK      ACCOUNTING           5000
      7844 CHICAGO       SALES                1500
      7876 DALLAS        RESEARCH             1100
      7900 CHICAGO       SALES                 950
      7902 DALLAS        RESEARCH             3000
      7934 NEW YORK      ACCOUNTING           1300

14 rows selected.

FULL OUTER JOIN=>

SQL> SELECT ENAME,DNAME,LOC
  2  FROM EMP FULL OUTER JOIN DEPT
  3  ON EMP.DEPTNO=DEPT.DEPTNO;

ENAME      DNAME          LOC
---------- -------------- -------------
SMITH      RESEARCH       DALLAS
ALLEN      SALES          CHICAGO
WARD       SALES          CHICAGO
JONES      RESEARCH       DALLAS
MARTIN     SALES          CHICAGO
BLAKE      SALES          CHICAGO
CLARK      ACCOUNTING     NEW YORK
SCOTT      RESEARCH       DALLAS
KING       ACCOUNTING     NEW YORK
TURNER     SALES          CHICAGO
ADAMS      RESEARCH       DALLAS
JAMES      SALES          CHICAGO
FORD       RESEARCH       DALLAS
MILLER     ACCOUNTING     NEW YORK
           OPERATIONS     BOSTON

15 rows selected.


-------------------------------------------------------------------------------------


SUBQUERY=>


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME LIKE '%S');

ENAME
----------
ALLEN
WARD
MARTIN
BLAKE
TURNER
JAMES

6 rows selected.

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO
  4  FROM DEPT
  5  WHERE DNAME IN('OPERATIONS','ACCOUNTING'));

ENAME
----------
CLARK
KING
MILLER

SQL> SELECT JOB
  2  FROM EMP
  3  WHERE MGR=(SELECT EMPNO
  4  FROM EMP
  5  WHERE ENAME='JONES');

JOB
---------
ANALYST
ANALYST

SQL> 1  SELECT DNAME
     2  FROM DEPT
     3  WHERE DEPTNO in(SELECT DEPTNO
     4  FROM EMP
     5 WHERE COMM IS NOT NULL);


DNAME
--------------
SALES


SQL> SELECT *
  2  FROM EMP
  3  WHERE MGR=(SELECT EMPNO
  4  FROM EMP
  5  WHERE ENAME='BLAKE') AND COMM >=0;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE HIREDATE<(SELECT MAX(HIREDATE)
  4  FROM EMP);

ENAME
----------
SMITH
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
JAMES
FORD
MILLER

13 rows selected.

SQL> SELECT MIN(SAL)
  2  FROM EMP
  3  WHERE SAL>(SELECT MIN(SAL)
  4  FROM EMP
  5  WHERE SAL>(SELECT MIN(SAL)
  6  FROM EMP));

  MIN(SAL)
----------
      1100
