use master;

drop database bancoloja


create database bancoloja;
--Exec sp_databases

use bancoloja 
GO

create table  tb_clientes(
       id_cliente int PRIMARY KEY identity(1,1),
       nome nvarchar(50) not null,
       endereco nvarchar(100),
       fone nvarchar(15),
       email nvarchar(70),
)


create table tb_hardware(
       id_hardware int PRIMARY KEY identity(1,1),
       descricao nvarchar(50) not null,
       preco_unit decimal,
       qtde_atual int,
       qtde_minima int,
       img image DEFAULT NULL
)


create table tb_vendas(
       id_venda int primary key identity(1,1),
       id_cliente int not null,
       data date not null,
       vlr_total decimal (8,2) not null,
       desconto decimal(8,2),
       vlr_pago decimal(8,2)
)


create table tb_vendas_itens(
       id_item int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_hardware int not null,
       qtde_item int not null,
       total_item decimal(8,2) not null
)

create table tb_clientes_auditoria(
		id_auditoria int PRIMARY KEY identity(1,1),
		id_cliente int,
		nome nvarchar (50) not null,
		endereco nvarchar (100),
		fone nvarchar (15),
		email nvarchar(70),
		acao_de_auditoria nvarchar (255),
		data_de_auditoria datetime
)

go

--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%'

select * from tb_hardware
GO
select * from tb_clientes


insert into tb_clientes values ('jeferson','av eteczl 1', '11-99999-9999','email...')
GO

insert into tb_hardware values ('gabinete', 50, 10, 10, NULL)
insert into tb_hardware values ('processador', 50, 10, 10, NULL)
insert into tb_hardware values ('placa mae', 50, 10, 10, NULL)


select * from tb_clientes

select * from tb_hardware
GO

insert into tb_vendas VALUES (500,'10/02/2018',80,10,70)
select * from tb_vendas;

GO


delete from tb_vendas where id_cliente = 500;

alter table tb_vendas
      ADD CONSTRAINT fk_vda_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)

alter table tb_vendas_itens
      ADD CONSTRAINT fk_itens_vda
      FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
      
--EXEC sp_help  'tb_vendas'
--EXEC sp_help  'tb_vendas_itens'
go

--insert into tb_vendas VALUES (500,'10/02/2018',80,10,70) *ERRO
select * from tb_vendas;
go

delete from tb_clientes;
delete from tb_hardware;
delete from tb_vendas;
delete from tb_vendas_itens;
GO

insert into tb_clientes values ('Jeferson','Aguia Haia 123','11-99999-9999','jef@dom.com'),
 ('Carlos','Aguia Haia 456','11-99999-9999','carlos@dom.com'),
 ('Ralf','Aguia Haia 789','11-99999-9999','ralf@dom.com');
GO

select * from tb_clientes;

insert into tb_hardware values
('gabinete',     60.50, 100, 10, NULL),
('processador', 300.50, 100, 10, NULL),
('placa mãe',   100.50, 100, 10, NULL),
('Dico Rígido',  80.90, 100, 10, NULL),
('Monitor',     300.20, 100, 10, NULL);
GO

select * from tb_hardware

insert into tb_vendas values (2,'2018-02-10', 8471, 100, 8371),
 (3,'2018-02-10',1086,0,1086);
GO
select * from tb_vendas

insert into tb_vendas_itens values (3,4,10, 600.50),
(3,5,10,3005),
(3,6,10,1050),
(3,7,10,809),
(3,8,10,3002);

/*insert into tb_vendas_itens values (4,4,1,600.50),
(4,5,1,300.50),
(4,6,1,105),
(4,7,1,80.9),
(4,8,1,3002);
GO*/

select * from tb_vendas_itens
GO
--select * from tb_vendas;



select * from tb_clientes c join tb_vendas v on c.id_cliente = v.id_cliente;

select c.id_cliente as IdClienteDaTblCliente,
       v.id_cliente as IdClienteDaTblVendas,
       c.nome from
       tb_clientes c
       left join tb_vendas v
       on c.id_cliente = v.id_cliente;


select c.id_cliente as IdClienteDaTblCliente,
       v.id_cliente as IdClienteDaTblVendas,
       c.nome as nomeCliente,
       v.id_venda as IdVendaDaTblVendas
       from
       tb_clientes c
       left join tb_vendas v
              on c.id_cliente = v.id_cliente

select * from tb_vendas_itens;

select c.id_cliente as IdClienteDaTblCliente,
       v.id_cliente as IdClienteDaTblVendas,
       c.nome as nomeCliente,
       v.id_venda as IdVendaDaTblVendas,
       i.id_item as idItem,
       i.id_hardware as idHardware,
       i.qtde_item as qtde,
       i.total_item as vlrTotItem
       from
       tb_clientes c
       left join tb_vendas v
              on c.id_cliente = v.id_cliente
       join tb_vendas_itens as i
              on v.id_venda = i.id_venda
              
select c.id_cliente as IdClienteDaTblCliente,
       v.id_cliente as IdClienteDaTblVendas,
       c.nome as nomeCliente,
       v.id_venda as IdVendaDaTblVendas,
       i.id_item as idItem,
       i.id_hardware as idHardware
       from
       tb_clientes c
       left join tb_vendas v
              on c.id_cliente = v.id_cliente
       left join tb_vendas_itens as i
              on v.id_venda = i.id_venda
GO              
select v.id_venda as IdVendaDaTblVendas,
       c.nome as nomeCliente,
       sum(i.total_item) as VlrDaVenda
       from
       tb_clientes c
       join tb_vendas v
              on c.id_cliente = v.id_cliente
       join tb_vendas_itens as i
              on v.id_venda = i.id_venda
       group by v.id_venda, c.nome
go
	CREATE TRIGGER trgAfterInsertCliente ON tb_clientes_auditoria
	FOR INSERT 
	AS
	declare @cliid int;
	declare @clinome varchar(100);
	declare @cliend varchar(100);
	declare @clifone varchar(100);
	declare @cliemail varchar(100);
	
	declare @audit_action varchar(100);
	
	select @cliid=i.id_cliente from inserted i;
	select @clinome=i.nome from inserted i;
	select @cliend=i.endereco from inserted i;
	select @clifone=i.fone from inserted i;
	select @cliemail=i.email from inserted i;
	
	set @audit_action = 'Registro Inserido -- [triger do tipo afet insert na tb_clientes].';
	
	insert into tb_clientes_auditoria (id_cliente,nome,endereco,fone,email,acao_de_auditoria,data_de_auditoria)
	values	(@cliid,@clinome,@cliend,@clifone,@cliemail,@audit_action,getdate());
	
	
	print 'fim da execução do triguer'
	go
	
	
	insert into tb_clientes values ('jeftri','av 1trig','11-99999trig','emailTrig...')
	
	
	select * from tb_clientes_auditoria;
	