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


		begin if (exists(select matricula from professores
					group by matricula
					having count (*)>1))
				begin 
					RAISERROR ('matricula não pode ser igual!',15,0)
					rollback
				end 
			end 
			
go

create trigger contarid
on professores
after insert 
as 
	

				
			if (LEN((SELECT matricula from inserted))>3)
			BEGIN
			RAISERROR ('matricula deve haver apenas 3 digitos',15,0)
			rollback
			end
go			

create trigger contarnome
on professores
after insert 
as 
	

				
			if (LEN((SELECT nome from inserted))>8)
			BEGIN
			RAISERROR ('o Nome deve haver menos que 8 digitos',15,0)
			rollback
			end
go			

				



