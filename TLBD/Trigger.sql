use master 
drop database exec_trigger

create database exec_trigger
use exec_trigger


create table professores(
id int identity,
nome nvarchar (200),
matricula varchar (10))

insert into professores values ('Matheus','959'),
								('Rafael','242'),
								('Darlinhos','696')
								
go 

create trigger colocavalores
on professores
after insert 
as 

		begin if (exists(select nome from professores
					group by nome
					having count (*)>1))
				begin 
					RAISERROR ('nome Ja Existe!',15,0)
					rollback
				end 
			end 
			
go


 


insert into professores values ('Darlinhos','696')
							

GO
create procedure consulta 
as 

select * from professores

CONSULTA
