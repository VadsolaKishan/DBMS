-- first time we dont know the system password so first we have to unlock the system or forgot the password of system user then write

/ as sysdba
SELECT username , account_status FROM dba_users WHERE username = "SYSTEM";
ALTER USER system ACCOUNT UNLOCK;
ALTER USER system IDENTIFIED BY "Oracle#123"
SELECT username , account_status FROM dba_users WHERE username = "SYSTEM";
EXIT

-- after this we have to just reopen the sql plus then we have to login with username system and password Oracle#123
-- now create local user 

CREATE user c##24CE127 IDENTIFIED BY "Darshan123";

-- C## prefix is a mandatory naming convention for common users and roles
-- now connect user witch is created 

connect c##24CE127/Darshan123;

-- this will fail becaue we are try on the system user so we have to first exit the sql puls then we have to login back to system user then we have to grant all privileges to that user 

GRANT ALL privileges TO c##24CE127;

-- now we will create table of employees

create table employees
  (
     emp_id NUMBER PRIMARY KEY,
     name VARCHAR2(100) NOT NULL
  );

-- do commit for store what you build
commit;

-- now we will use unique for give unique value in email collum 

create table employees_1
  (
       emp_id NUMBER PRIMARY KEY,
       email VARCHAR2(150) UNIQUE
  );

-- disply the table which is create
desc table name

-- for the insert data into table 
 insert into tablename values(134 , 'ce' , 500 , 510);
-- number must be without '' cort 
-- name is must be in '' cort


-- for the display table 
select * from tablename;

--user input 
 insert into job values('&id','&job_title','&min_sal','&max_sal');

--access specific column 
Select JOB_ID,MAX_SAL from job;

--create duplicate table
 Create Table JOB_SAL as select JOB_ID,MAX_SAL FROM job;
