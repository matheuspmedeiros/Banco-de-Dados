use master;

drop database db_hospital;


create database db_hospital;

use db_hospital;
go

create table tblCadAtendente(
	id_atendente int primary key,
	nome varchar(40),
	endereco nvarchar(40),
	cidade varchar(30),
	estado char(2),
	cpf char(11),
	fone char(15)
);

create table tblCadMedico(
	crm int primary key,
	nome varchar(40),
	endereco nvarchar(40),
	cidade varchar(30),
	estado char(2),
	cpf char(11),
	fone char(15)
);

create table tblCadEspecialidade(
	id_especialidade int primary key,
	especialidade varchar(20)
);

create table tblCadPaciente(
	id_paciente int primary key,
	nome varchar(40),
	endereco nvarchar(40),
	cidade varchar(30),
	estado char(2),
	cpf char(11),
	fone char(15)
);

create table tblConsultas(
	id_consulta int primary key,
	id_paciente int,
	crm int,
	id_especialidade int,
	data datetime,
	status varchar(300),
	CONSTRAINT FK_idPaciente FOREIGN KEY (id_paciente)
    REFERENCES tblCadPaciente(id_paciente),
    CONSTRAINT FK_crm FOREIGN KEY (crm)
    REFERENCES tblCadMedico(crm),
    CONSTRAINT FK_id_especialidade FOREIGN KEY (id_especialidade)
    REFERENCES tblCadEspecialidade(id_especialidade)
);

create table tblMedEspecialidade(
	id int,
	id_especialidade int,
	diasSemana nvarchar(11),
	IntervaloInicial time,
	IntervaloFinal time,
	crm int,
	CONSTRAINT FK_id_especialidade2 FOREIGN KEY (id_especialidade)
    REFERENCES tblCadEspecialidade(id_especialidade),
    CONSTRAINT FK_crm2 FOREIGN KEY (crm)
    REFERENCES tblCadMedico(crm)
);
go 

select * from tblCadAtendente;
select * from tblCadMedico;
select * from tblCadEspecialidade;
select * from tblCadPaciente;
select * from tblConsultas;
select * from tblMedEspecialidade;
