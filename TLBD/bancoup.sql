use master

drop database Insercao

create database Insercao

use Insercao

go

create table funcionario (
id_func int primary key,
nome_func varchar (200),
cpf_func char (12),
rg_func char (12),
enderco varchar (150)
)

create table cliente (
id_cli int primary key,
nome_cli varchar (200),
cpf_cli char (12),
rg_cli char (12),
enderco varchar (150),
id_func int 

CONSTRAINT FK_id_func FOREIGN KEY (id_func)
REFERENCES funcionario(id_func)

)

select * from funcionario;
select * from cliente;

/*
select c.id_func as IdClienteDaTblCliente,
       v.id_cliente as IdClienteDaTblVendas,
       c.nome as nomeCliente,
       v.id_venda as IdVendaDaTblVendas
       from
       tb_clientes c
       left join tb_vendas v
              on c.id_cliente = v.id_cliente
*/