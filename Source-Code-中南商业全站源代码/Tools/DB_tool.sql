--��������������SQL���ٿ������� Powered by ���Ļ���hx008.com���ݿ⿪���Ŷ�
--use Dbname
declare @Uname varchar(50),@password varchar(50) 
set @Uname ='Uname3'
set @password='password3'

--exec sp_addrolemember 'db_owner',@Uname
--��һ����󵥶�ִ��

exec sp_addlogin @Uname,@password  --������½
exec sp_adduser @Uname,@Uname      --�����û�

/*
EXEC sp_revokedbaccess N'Uname3'   --1���Ƴ��û������ݿ�ķ���Ȩ��
EXEC sp_droplogin N'Uname3'        --2��ɾ����¼�û�

--��ѯ��ǰ���ݿ�����ӵ��û�:
select DbRole = g.name, MemberName = u.name, MemberSID = u.sid
  from sys.database_principals u, sys.database_principals g, sys.database_role_members m
 where g.principal_id = m.role_principal_id
   and u.principal_id = m.member_principal_id
 order by 1, 2
 
--�����ض��û��ĵ�½����
ALTER LOGIN [�û���] WITH PASSWORD=N'����'

--�޸�����
USE [master]
GO
ALTER LOGIN [sa] WITH PASSWORD=N'xxxxxx'

--��ǰ���ݿ���ɾ���ض��û�
USE [�ض����ݿ�]
DROP USER [dbo]       --ɾ�������û�
DROP SCHEMA [�û���]  --�Ӽܹ���ɾ��

--��SQL����MSSQLʵ���г���ɾ���û�֮��
USE [master]
GO
DROP LOGIN [xxx]
GO

DROP SCHEMA [usname]  --ɾ���ܹ�
 
--�������������ﱸ�����ݿ⣺
BACKUP DATABASE "wawa" TO DISK ='D:\data.bak' with init

--�򵥻�ԭ���ݿ�
RESTORE DATABASE "iii" FROM DISK='D:\data.bak';

--��ԭ���ݿ⵽ָ��Ŀ¼
restore database [dbname] from disk='D:\data.bak'
 with move 'longbai' to 'D:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\text.MDF',
      move 'longbai_log' to 'D:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\text.ldf', REPLACE
      
--�鿴�����ļ��߼��ļ��� 
restore filelistonly from disk='D:/data.bak'

--��ѯ���ݿ��߼��ļ���
SELECT name FROM sys.database_files

--�޸������ļ�����־�ļ����߼�����
ALTER DATABASE ���ݿ��� MODIFY FILE (NAME = ԭʼ�߼��ļ���, NEWNAME = ���߼��ļ���) 

--�������������ｨ�����ݿ�
CREATE DATABASE DbName 
ON 
( NAME='��ʱ��_Data', 
FILENAME='D:\��ʱ��.mdf', 
SIZE=5MB, 
MAXSIZE=50MB, 
FILEGROWTH=10% 
) 
LOG ON 
( 
NAME='��ʱ��_LOG', 
FILENAME='D:\��ʱ��.ldf', 
SIZE=2MB, 
MAXSIZE=5MB, 
FILEGROWTH=1MB 
) 

--NAME=�߼����� 
--FILENAME=���ݿ�������ļ����� 
--SIZE=��ʼ��С 
--MAXSIZE=���ݿ����ߴ� 
--FILEGROWTH=�ļ������̶�
--��ϸ�����ο���http://www.jb51.net/article/28973.htm


drop database DbName             --ɾ�����ݿ�

EXEC sp_renamedb 'ԭ���ݿ���', '�����ݿ���'     --���ݿ����

USE [master]  --���ݿ���־ѹ�ɼ�ģʽ
GO
ALTER DATABASE [building] SET RECOVERY SIMPLE WITH NO_WAIT

update zl_manager set adminpassword='7fef6171469e80d32c0559f88b377245' where adminid=1  --�����̨admin����Ϊadmin888


--�߼��̳̣�http://www.zoomla.cn/help/tech/2035.shtml
*/