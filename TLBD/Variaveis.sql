use master;

drop database variaveis;

create database variaveis;
go 

use variaveis;
go 

--Primeira Variavel
declare @mycounter int;

set @mycounter = 0;
select @mycounter
set @mycounter = 1;
select @mycounter
go 

--Para mostrar aonde uma palavra expecifica esta 
declare @document varchar(64);
select @document = 'Reflector are vital safety' + ' components of your bicicle.';

select CHARINDEX('bicycle' ,@document); 

select CHARINDEX('are' ,@document);

select CHARINDEX('ARE' ,@document);

select CHARINDEX('Ref' ,@document);

select CHARINDEX('ect' ,@document);
go

--select CONCAT ('Happy','Birthday',11,'/','25')as Result;

select LTRIM ('      five space are at the beginnig of this string')from sys.databases;

select REPLACE ('ABCDEFGHIJKLM' ,'CDE','XXX');

select CEILING($123.45), CEILING($-123.45), CEILING($0.0); 

select STR(123.45, 6, 1);
go

declare @DTA DATETIME;
SELECT @DTA = GETDATE();


SELECT @DTA AS '@DTA e GETDATE()'

DECLARE @DTAMAIS30 date;
select @DTAMAIS30 = DATEADD(DAY, 30,GETDATE())
SELECT @DTAMAIS30 AS 'DATA + 30 dias'


declare @QTS_DIAS_DESSE_ANO INT;
SELECT @QTS_DIAS_DESSE_ANO = DATEDIFF(DAY, '01/01/2018', GETDATE())
SELECT @QTS_DIAS_DESSE_ANO AS 'N DE DIAS DESSE ANO'


DECLARE @DATE_PART_MES INT;
DECLARE @DATE_PART_ANO INT;
DECLARE @DATE_PART_DIA INT;
DECLARE @DATE_PART_HORA INT;
DECLARE @DATE_PART_MIN INT;
DECLARE @DATE_PART_SEG INT;

SELECT @DATE_PART_ANO = DATEPART (YEAR,@DTA)
SELECT @DATE_PART_MES = DATEPART (MONTH,@DTA)
SELECT @DATE_PART_DIA = DATEPART (DAY,@DTA)
SELECT @DATE_PART_HORA = DATEPART (HOUR,@DTA)
SELECT @DATE_PART_MIN = DATEPART (MINUTE,@DTA)
SELECT @DATE_PART_SEG = DATEPART (SECOND,@DTA)


SELECT @DATE_PART_ANO AS 'PARTE DO ANO DE GETDATE()'
SELECT @DATE_PART_MES AS 'PARTE DO MES DE GETDATE()'
SELECT @DATE_PART_DIA AS 'PARTE DO DIA DE GETDATE()'
SELECT @DATE_PART_HORA AS 'PARTE DO HORAS DE GETDATE()'
SELECT @DATE_PART_MIN AS 'PARTE DO MINUTOS DE GETDATE()'
SELECT @DATE_PART_SEG AS 'PARTE DO SEGUNDOS DE GETDATE()'
GO 

CREATE FUNCTION SOMA (@a int , @b int )	 RETURNS int 
		AS 
		BEGIN 
			RETURN @a+@b
		end 
go
