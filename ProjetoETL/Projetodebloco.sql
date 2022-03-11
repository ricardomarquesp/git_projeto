/*Analisando os dados, para vê se a coluna n_inep pode ser usada como
PK*/
SELECT  *
FROM [Stage].[PBLE]

SELECT DISTINCT [Velocidade de Acesso Instalada]
FROM [Stage].[PBLE]

select [Nº INEP],[Nome da Escola], [Tipo Escola]
from [Stage].[PBLE]

SELECT DISTINCT [Nº INEP]
FROM [Stage].[PBLE]

select [Nº INEP] from [Stage].[PBLE]


SELECT distinct [inep_id] , count(*) as QtdLinhas
FROM [dbo].[fato_internet]
GROUP BY [inep_id]
HAVING count(*) > 1

select distinct * from [dbo].[fato_internet]

/*DELETANDO DADOS DUPLICADOS*/

WITH CTE AS(
   SELECT [inep_id],
       RN = ROW_NUMBER()OVER(PARTITION BY [inep_id] ORDER BY [inep_id])
   FROM [dbo].[fato_internet]
)

DELETE FROM CTE WHERE RN > 1

/* Não existem mais dados duplicados, assim a coluna n_inep
podera ser utilizada como PK*/
[inep_id]
SELECT  [Nº INEP],[Nome da Escola], count(*) as QtdLinhas
FROM [Stage].[PBLE]
GROUP BY [Nº INEP],[Nome da Escola]
HAVING count(*) > 1


SELECT  distinct [Prestadora] FROM [Stage].[PBLE]

/* Update Caracteres do Registro*/
UPDATE [Stage].[PBLE]
  SET [Velocidade de Acesso Instalada] = REPLACE ( [Velocidade de Acesso Instalada] , 'Mbps' , '' );

select distinct [Velocidade de Acesso Instalada] from [Stage].[PBLE]
  select DISTINCT [Nº INEP] from [Stage].[PBLE2]

  UPDATE [Stage].[PBLE]
  SET [Nº INEP] = REPLACE ( [Nº INEP] , 'não infordo' , '98452012' );



select  * from [dbo].[dim_escola]

select [Nº INEP]
  select  distinct [Data de Ativação] from [Stage].[PBLE]
  select distinct [Tecnologia] from [Stage].[PBLE]

  UPDATE [Stage].[PBLE]
  SET [Nº INEP] = REPLACE ( [Nº INEP] , 'SP' , '' );

  select * from [Stage].[PBLE]



  UPDATE [Stage].[PBLE2]
  SET [Velocidade de Acesso Instalada] = REPLACE ( [Nº INEP] , '0.0' , '0.5' );

  select * from [Stage].[PBLE]


  UPDATE [Stage].[PBLE]
  SET [Nº INEP] = REPLACE ( [Nº INEP] , 'AL' , '' );

  select distinct [Municipio],[UF] from [Stage].[PBLE]



CREATE SCHEMA Stage

/* Criando tabela Stage.Data2 e colunas DIA, MES E ANO
e as preenchendo com dados a partir da coluna data_ativação da tabela Stage.PBLE
*/
create table Stage.Links (
data_completa varchar (50)not null,
dia_ativ varchar(50) not null,
mes_ativ varchar (50) not null,
ano_ativ varchar (50) not null);

insert [Stage].[Data2] ([data_completa],[dia_ativ],[mes_ativ],[ano_ativ])

select  * from dim_escola
[Data de Ativação] as data_completa,
substring([Data de Ativação],1,2) as dia_ativ,
substring([Data de Ativação],4,2) as mes_ativ,
substring([Data de Ativação],7,4) as ano_ativ 
from [Stage].[PBLE];
select distinct cast(CONVERT(varchar(10),[data_completa],112))as data_completa, dia_ativ, mes_ativ, ano_ativ
from Stage.Data2
order by data_completa
select distinct 

select * from [dbo].[dim_municipio]

select * from [Stage].[Data2]

select distinct [Velocidade de Acesso Instalada] from [Stage].[PBLE]



/*CRIANDO DIMENSÕES E TABELA FATO*/
create table dim_escola(
inep_id int primary key not null,
nome_escola varchar(250) not null,
tipo_escola varchar (20) not null)

select *  from [dbo].[dim_escola]

select  *  from [dbo].[dim_data]

select *  from [dbo].[dim_municipio]

select distinct *  from [dbo].[fato_internet]

select *  from [dbo].[fato_internet]
select * from Stage.PBLE2
alter table Stage.PBLE alter column [Velocidade de Acesso Instalada] decimal (16,1) not null

select  distinct [Velocidade de Acesso Instalada] from [Stage].[PBLE]
select distinct [Velocidade de Acesso Instalada] from [Stage].[PBLE]

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


[Velocidade de Acesso Instalada]



select m.municipio_id, p.prestadora_id, a.[Nº INEP] as inep_id,
cast(convert(varchar(10),[Data de Ativação], 112) as int) as Data_ID,a.[Velocidade de Acesso Instalada]
from Stage.PBLE a
join dim_municipio m
on a.Municipio = m.municipio_name
join dim_prestadora p
on a.Prestadora = p.prestadora


select  distinct * from [dbo].[fato_internet]


ALTER TABLE [Stage].[PBLE]
ALTER COLUMN [Data de Ativação]  varchar(50) not null

select * from [Stage].[Data2]





select distinct
cast(convert(varchar(10),[Data de Ativação], 112) as int) as Data_ID,
[Data de Ativação] as [Data Completa],
datepart (day, [Data de Ativação]) as Dia,
datepart (month, [Data de Ativação]) as Mês,
datename(month, [Data de Ativação]) as Mês_Nome,
datepart (year, [Data de Ativação]) as Ano
from Stage.PBLE

select * from dim_data
select * from dim_escola
select * from dim_municipio
select * from dim_prestadora



SELECT * INTO Stage.PBLE2
   FROM [Stage].[PBLE]


   SELECT  [Nº INEP]
FROM   [Stage].[PBLE]
WHERE ISNUMERIC([Nº INEP]) <> 1;  


select * from [Stage].[Data2]

alter table  [Stage].[PBLE] alter column [Data de Ativação] date




