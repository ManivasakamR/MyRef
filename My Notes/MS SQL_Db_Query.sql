create table dept(    
  deptno     numeric(2,0),    
  dname      varchar(14),    
  loc        varchar(13),    
  constraint pk_dept primary key (deptno)    
)

create table emp(    
  empno    numeric(4,0),    
  ename    varchar(10),    
  job      varchar(9),    
  mgr      numeric(4,0),    
  hiredate date,    
  sal      numeric(7,2),    
  comm     numeric(7,2),    
  deptno   numeric(2,0),    
  constraint pk_emp primary key (empno),    
  constraint fk_deptno foreign key (deptno) references dept (deptno)    
)

/* insert into emp    
values(    
 7839, 'KING', 'PRESIDENT', null,    
 '17-nov-1981',
 5000, null, 10    
)

insert into emp    
values(    
 7698, 'BLAKE', 'MANAGER', 7839,    
'1-Jun-1981',
 2850, null, 30    
)

insert into emp    
values(    
 7782, 'CLARK', 'MANAGER', 7839,    
 '9-may-1981',    
 2450, null, 10    
)

insert into emp    
values(    
 7566, 'JONES', 'MANAGER', 7839,    
 '2-Apr-1981',
 2975, null, 20    
)

insert into emp    
values(    
 7788, 'SCOTT', 'ANALYST', 7566,    
'13-JUL-87',
 3000, null, 20    
)


insert into emp    
values(    
 7902, 'FORD', 'ANALYST', 7566,    
'3-dec-1981',
 3000, null, 20    
)


insert into emp    
values(    
 7369, 'SMITH', 'CLERK', 7902,    
'17-dec-1980',
 800, null, 20    
)


insert into emp    
values(    
 7499, 'ALLEN', 'SALESMAN', 7698,    
'20-feb-1981',
 1600, 300, 30    
)

 insert into emp    
values(    
 7521, 'WARD', 'SALESMAN', 7698,    
'22-feb-1981',
 1250, 500, 30    
)


insert into emp    
values(    
 7654, 'MARTIN', 'SALESMAN', 7698,    
'28-sep-1981',
 1250, 1400, 30    
)


insert into emp    
values(    
 7844, 'TURNER', 'SALESMAN', 7698,    
'8-sep-1981',
 1500, 0, 30    
)


insert into emp    
values(    
 7876, 'ADAMS', 'CLERK', 7788,    
'13-JUL-87',   
 1100, null, 20    
)

insert into emp    
values(    
 7900, 'JAMES', 'CLERK', 7698,    
'3-Dec-1981',
 950, null, 30    
)

insert into emp    
values(    
 7934, 'MILLER', 'CLERK', 7782,    
 '23-JAN-1982',    
 1300, null, 10    
)
*/

select * from emp

use temp1

backup database temp1 to disk='D:\00 SQL\temp1.bak'

use master

restore database Temp1 from Disk='D:\00 SQL\temp1.bak' with 
move 'Temp1' TO 
   'D:\00 SQL\DATA\Temp1.mdf',
MOVE 'Temp1_Log' TO 
   'D:\00 SQL\DATA\Temp1_Log.ldf'
   
   
http://s1.downloadmienphi.net/file/downloadfile8/174/1318571.pdf


DECLARE @fixedlength        char(10),
        @variablelength     varchar(10)
SET @fixedlength = 'Test'
SET @variablelength = 'Test'
SELECT DATALENGTH(@fixedlength)
SELECT DATALENGTH(@variablelength)

sELECT * FROM sys.xml_schema_collections


/********************************* IMPORTANT ********************************************/

use temp1

CREATE TABLE OrderHeader
(OrderID        INT         IDENTITY(1,1),
OrderDate       DATE        NOT NULL,
SubTotal        MONEY       NOT NULL,
TaxAmount       MONEY       NOT NULL,
ShippingAmount  MONEY       NOT NULL CHECK (ListPrice > 0),--check constraints
GrandTotal      AS (SubTotal + TaxAmount + ShippingAmount),--Computed column
FinalShipDate   DATE        NOT NULL CONSTRAINT df_fsd DEFAULT GETDATE(),--Default
CONSTRAINT pk_customeraddress PRIMARY KEY (AddressID),--Primary key
CONSTRAINT fk_countrytostateprovince FOREIGN KEY (OrerID)--foreign key
REFERENCES LookupTables.Country(CountryID),
)
GO
--Unique key
CREATE TABLE Products.ProductDocument
(DocumentID     UNIQUEIDENTIFIER    ROWGUIDCOL UNIQUE,
DocumentType    VARCHAR(20)         NOT NULL,
Document        VARBINARY(MAX)      FILESTREAM NULL,
CONSTRAINT pk_productdocument PRIMARY KEY(DocumentID))
GO


insert into OrderHeader(OrderDate,SubTotal,TaxAmount,ShippingAmount,FinalShipDate) values('1-JAN-2017',100,100,100,'12-JAN-2018');
select * from OrderHeader

    use temp1
    
    select dname as depname,deptno,deptno*7 as val  from dept
    
    sp_help dept
 
    select CAST(OrderDate as varchar) as MyDate,CONVERT(varchar(30),GrandTotal)as GT from OrderHeader
    SELECT CONVERT(varchar(30),GETDATE(),105) as CurrentDate    
    --Concartenation
    select Cast(OrderId as varchar)+' and Date is'+cast(OrderDate as varchar) from OrderHeader
    
    select * from emp
    
    --ISNULL
    select ename,ISNULL(comm,00)as GP from emp
    -- COALESCE
    select ename, COALESCE(comm,01)as GP from emp
    --Max Value
    select max(sal) from emp
    select ename from emp where sal=(select max(sal) from emp)
    
    --CASE
    select ename,   case deptno 
					when 20 then 'Dept 20'
					when 30 then 'Dept 30'
					else 'Unknown'
					end
					from emp
					
	--Conditional
	select ename,   case  
					when deptno=20 then 'Dept 20'
					when deptno>20 and deptno<30 then 'Dept 30'
					else 'Unknown'
					end deptno
					from emp				
	
	--SORTING ORDER BY
	
	SELECT a.SKU, a.ProductID, b.Quantity
    FROM Products.ProductOptions a INNER JOIN Products.ProductInventory b 
    ON a.ProductID = b.ProductID
    
	select * from emp order by job ASC,ename DESC
	--FILTER with where
	select * from emp where (sal<3000 and sal>=800) OR sal=1000
	select * from emp where (sal between 801 and 3000)
	
	select * from emp where (sal between 801 and 2000) or
							(sal between 3000 and 4000)
	--IN
	select * from emp where deptno in (30,20)
	--%
	select * from emp where ename like '_A%'
	select * from emp where hiredate between '1980-01-17' and '1981-12-30'
	--NOT
	select * from emp where comm is not null
	select * from emp where deptno not in (30,20)
	
	select * from dept 
	select * from emp where deptno=40--ename='smith'
	
	/******************** JOINS *******************************************/
	--CRoss
	select a.ename,b.dname from emp a 
	cross join 
	dept b
	
	--Inner
	select a.ename,a.job,b.dname from emp a 
	inner join 
	dept b on a.deptno=b.deptno
	
	select a.ename,a.job,b.dname from emp a 
	inner join 
	dept b on a.deptno=b.deptno and a.job='clerk'
		
	--non equi
	select a.*,b.dname from emp a 
	inner join 
	dept b on a.deptno<>b.deptno
	
	--left outer
	select a.ename,a.job,b.dname from emp a 
	left outer join 
	dept b on a.deptno=b.deptno
	
	--right outer
	select a.ename,a.job,b.dname from emp a 
	right outer join 
	dept b on a.deptno=b.deptno
	
	--self join
	select e.ename,e1.ename as Manager from emp e,emp e1 where e.empno=e1.mgr
	
	--full outer
	SELECT a.ename, a.job, b.dname
    FROM emp a FULL OUTER JOIN dept b 
        ON a.deptno = b.deptno

	--union
	select ename from emp 
	union
	select dname from dept
	
	--intersect
	select empno from emp --parameter and data type must match
	intersect
	select deptno from dept
	
	--except
	select empno from emp 
	except
	select deptno from dept
	
	--JOIN DISTINCT
	select distinct job from emp
	
	--Aggrigate 
	select job,COUNT(*)as Employess from emp group by job
	
	SELECT b.empno,b.ename, b.Job
    FROM (SELECT Job, count(*) nutitles
        FROM emp
        GROUP BY Job) a INNER JOIN emp b ON a.job = b.job
        
    SELECT empno,hiredate,sal    
	FROM emp 
    GROUP BY empno,hiredate,sal WITH CUBE --ROLLUP
    
    select empno,sum(sal) from emp group by sal having sal>1000
    
    
    select * from emp
    
    --view 
    
    drop view ev
    
    CREATE VIEW ev AS
     SELECT CASE WHEN 
                      a.comm IS NOT NULL 
                      THEN a.empno
                      ELSE a.deptno
                      END comm,
              b.deptno, b.dname
              FROM emp a INNER JOIN dept b 
              ON a.deptno =b.deptno 
    GO
    
    use Temp1
    
    create table t1(no varchar(10))
    
    drop table t1;
    
    
    
    BEGIN TRY
    BEGIN TRAN
        INSERT INTO dbo.t1 VALUES(1)
        INSERT INTO dbo.t1 VALUES(1)
        INSERT INTO dbo.t1 VALUES(2)
    COMMIT TRAN
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
       PRINT 'Error'
    END CATCH
    
    exec('select * from emp')
    
    create table t1(no numeric(3),nam varchar(30))
    
    CREATE PROCEDURE Proc2 @no int, @nam varchar(30)
	AS
	DECLARE @job        Varchar(30),
			@mgr		int
	--Using a cursor for demonstration purposes.  
	--Could also do this with a table variable and a WHILE loop
	--DECLARE curemp CURSOR FOR 
	--SELECT job,mgr from emp    
	  --  WHERE empno=@empno and ename=@ename
	--OPEN curemp
	--FETCH curemp INTO @job,@mgr
	--WHILE @@FETCH_STATUS = 0
	BEGIN    
		BEGIN TRY
		--    EXEC('update emp set comm=1000 where empno=@empno')
		 Insert into t1 values(@no,@nam)
		END TRY
		BEGIN CATCH
			BEGIN            
				--EXEC Proc2 @cmd
				--EXEC('update emp set comm=2000 where empno=@empno')
				PRINT('Err')
			END
		END CATCH    
		--FETCH curemp INTO @job,@mgr
	END
	--CLOSE curemp
	--DEALLOCATE curemp

	drop procedure Proc2
	select * from emp
	exec Proc2 1,SMITH
	
	CREATE FUNCTION fn_emp()
	RETURNS TABLE
	AS
	RETURN (select * from emp)		
		
		drop function fn_emp
				
		select dbo.fn_emp()
    
    --TRIGGERS
    
    create table sales(pid numeric,qty numeric(10),price numeric(10))
    create table inv(pid numeric,qty numeric(10))
          
	CREATE TRIGGER StockUp ON sales
	FOR INSERT
	AS
	UPDATE s
	SET s.qty=s.qty - i.qty
	FROM inv as S JOIN inserted I 
	ON S.pid = i.pid
	
	insert into sales values(1,8,80)
	
	--2
	CREATE TRIGGER tiu_productdocuments ON Products.ProductDocument
	FOR INSERT, UPDATE
	AS
	IF EXISTS (SELECT 1 FROM SQL2008SBS.Products.Product a
				INNER JOIN inserted b ON a.ProductID = b.ProductID)
	BEGIN            
		RETURN
	END    
	ELSE
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Violation of foreign key',16,1)
	END
	GO
	
	
	--3
	CREATE TRIGGER td_product ON Products.Product
	FOR DELETE
	AS
	IF EXISTS (SELECT 1 FROM SQL2008SBSFS.Products.ProductDocument a
				INNER JOIN deleted b ON a.ProductID = b.ProductID)
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('You must first delete all documents for this product',16,1)
	END                
	ELSE
	BEGIN            
		RETURN
	END    
	
	
	CREATE TRIGGER tddl_preventdrop
	ON DATABASE
	FOR DROP_TABLE
	AS
		PRINT 'Please disable DDL trigger before dropping tables'
		ROLLBACK TRANSACTION
		
	--SNAPSHOT
	CREATE DATABASE Temp1Snap
    ON
    ( NAME = N'Temp1Snap', FILENAME = N'C:\Program Files\
           Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\tempdb')
    AS SNAPSHOT OF Temp1
    
    
    
    create table product(id numeric(10),nam varchar(30),cost numeric(10))
    create table salp(id numeric(10),pid numeric(10),qty numeric(10))
    
    create PROCEDURE Proc3 @tid numeric(10),@nam varchar(30),@qty numeric(10)
	AS
	DECLARE @pid	int	
	BEGIN    
		BEGIN TRY
		set @pid=(select id from product where nam=@nam)
		Insert into salp values(@tid,@pid,@qty)
		END TRY
		BEGIN CATCH
			BEGIN            
				PRINT('Err')
			END
		END CATCH    
		--FETCH curemp INTO @job,@mgr
	END
	
	exec proc3 1,FORK,10		
	
	
	select ename,getdate() as st from emp where Month(hiredate)=9

	select * from emp where sal>comm
	
	create table prod_fruits(id numeric(10),item varchar(25))
	create table prod_elect(id numeric(10),item varchar(25))
	create table prod_cotton(id numeric(10),item varchar(25))
	
	select * from prod_fruits union all (select * from prod_elect union select * from prod_cotton)
	
	SELECT COMPANY 
	FROM CUSTOMERS 
	WHERE CUST_REP IN (SELECT EMPL_NUM 
                      FROM SALESREPS 
                     WHERE REP_OFFICE IN (SELECT OFFICE
                                            FROM OFFICES
                                           WHERE REGION = 'Eastern'));
                                           
     SELECT NAME, AVG(AMOUNT) 
	  FROM SALESREPS, ORDERS  WHERE EMPL_NUM = REP 
	   AND MFR = 'ACI' 
	 GROUP BY NAME 
	  HAVING AVG(AMOUNT) > (SELECT AVG(AMOUNT) 
							FROM ORDERS)
							
	INSERT INTO OLDORDERS (ORDER_NUM, ORDER_DATE, AMOUNT)
     SELECT ORDER_NUM, ORDER_DATE, AMOUNT 
       FROM ORDERS 
      WHERE ORDER_DATE < '2008-01-01'
      
    select * from emp
    
    --Inline query  
    insert into emp values(8080,'Mani','IT',(select mgr from emp where empno=7369),'12-12-2010',18000,800,20)
   
	select * FROM PROD_ELECT
	
	create PROCEDURE Proc4 @id numeric(10)
	AS
	DECLARE @pid	int,
	        @total_tgt int	
	BEGIN    	
	select id into total_tgt from prod_elect; 
	while (total_tgt < 2400) 
	loop 
	   insert into prod_elect values(@
	   select id into total_tgt from prod_elect; 
	end loop
	
					 
					 
					 
--Procedure
					 
   create PROCEDURE xInsertUpdateDelete  
    (  
    @colx VARCHAR(50),  
    @coly VARCHAR(50),      
    @StatementType varchar(20) = ''  
    )  
    AS  
    BEGIN  
    IF @StatementType = 'Insert'  
    BEGIN  
    insert into xdata (colx,coly) values( @colx, @coly)  
    END  
    IF @StatementType = 'Select'  
    BEGIN  
    select * from xdata  
    END  
    IF @StatementType = 'Update'  
    BEGIN  
    UPDATE xdata SET  
    colx = @colx,coly = @coly  
    WHERE colx = @colx  
    END  
    else IF @StatementType = 'Delete'  
    BEGIN  
    DELETE FROM xdata WHERE colx = @colx
    END  
    end  
