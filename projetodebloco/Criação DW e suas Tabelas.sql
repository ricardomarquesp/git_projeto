/* Criação da Database Internet */

CREATE DATABASE [INTERNET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INTERNET', FILENAME = N'C:\MSQL\Data\INTERNET.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INTERNET_log', FILENAME = N'C:\MSQL\Log\INTERNET_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO





/*CRIANDO DIMENSÕES E TABELA FATO*/
create table dim_escola(
inep_id int primary key not null,
nome_escola varchar(250) not null,
tipo_escola varchar (20) not null)


create table dim_prestadora(
prestadora_id int identity (1,1) primary key not null,
prestadora varchar (20) not null)

select distinct [Mes] from [Stage].[PBLE_NETbr]

create table dim_data(
data_id int  primary key not null,
Dia int not null,
Mês int not null,
Mês_Nome varchar(15) not null,
Ano int not null,
Data_Completa date not null)

select * from dim_data


create table dim_municipio(
municipio_id int  identity (1,1)primary key not null,
municipio_name varchar (250) not null,
uf_name varchar(5) not null)


create table fato_internet(
fato_internet_id int  identity primary key not null,
inep_id int not null,
prestadora_id int not null,
data_id int not null,
municipio_id int not null,
velocidade_acesso decimal (16,1) not null)
select * from [dbo].[dim_data]

/*ATRIBUINDO FK'S */

ALTER TABLE fato_internet ADD CONSTRAINT escola_id_fk
FOREIGN KEY (inep_id) REFERENCES dim_escola (inep_id)
go

ALTER TABLE fato_internet ADD CONSTRAINT municipio_id_fk
FOREIGN KEY (municipio_id) REFERENCES dim_municipio (municipio_id)
go

ALTER TABLE fato_internet ADD CONSTRAINT data_id_fk
FOREIGN KEY (data_id) REFERENCES dim_data (data_id)
go

ALTER TABLE fato_internet ADD CONSTRAINT prestadora_id_fk
FOREIGN KEY (prestadora_id) REFERENCES dim_prestadora (prestadora_id)
go