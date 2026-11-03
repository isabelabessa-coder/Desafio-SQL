create database if not exists victoriassecretdb;
drop database victoriassecretdb;
use victoriassecretdb;

select * from modelos;

drop table if exists looks;
drop table if exists lugardesfile;
drop table if exists modelos;

create table modelos ( 
    id int primary key auto_increment, 
    nome varchar(100), 
    email varchar(100), 
    nacionalidade varchar(50), 
    status_angel varchar(3) null, 
    ano_estreia int null 
); 

create table lugardesfile ( 
    id_lugar int primary key auto_increment, 
    local varchar(100), 
    cidade varchar(100), 
    ano int 
); 

create table looks ( 
    id_look int primary key auto_increment, 
    id_modelo int, 
    id_lugar int, 
    cor_principal varchar(30), 
    possui_asas varchar(3) null, 
    foreign key (id_modelo) references modelos(id), 
    foreign key (id_lugar) references lugardesfile(id_lugar) 
);


insert into modelos (nome, email, nacionalidade, status_angel, ano_estreia) values
('adriana lima', 'adrianalima@gmail.com' ,'brasil', 'sim', 1999),
('alessandra ambrosio', 'aleambrosio@gmail.com', 'brasil', 'sim', 2000),
('gigi hadid', 'gigihadid@gmail.com', 'estados unidos', null, 2015),
('bella hadid', 'bellahadid@gmail.com', 'estados unidos', 'nao', null),
('candice swanepoel','candiceswan@gmail.com', 'africa do sul', 'sim', 2007),
('tyra banks', 'tyrabanks@gmail.com', null, 'sim', 1996),
('kate moss', 'amoss@gmai.com','reino unido', 'nao', null),
('valentina sampaio','vasampaio@gmail.com', 'brasil', 'nao', 2024),
('gisele bundchen','bundchengisele@gmail.com', null, 'sim', 1999),
('naomi campbell', 'naomicampbell@.gmail.com','reino unido', 'nao', 1996);

insert into lugarDesfile (id_lugar, local, cidade, ano) values
(001,'The Plaza Hotel', 'Nova York, EUA', 1998),
(002,'Cannes', null, 2000),
(003,null, 'Nova York, EUA', 2002),
(004,'69th Regiment Armory', 'Nova York, EUA', 2005),
(005,'Dolby Theatre', 'Los Angeles, EUA', 2006),
(006, null, 'Miami Beach, EUA', 2008),
( 007,'Earls Court Exhibition Centre', null, 2014),
( 008,'Grand Palais', null, 2016),
(009,'Mercedes-Benz Arena', 'Xangai, China', 2017),
(010,'Sony Pictures Studios', 'Culver City (L.A.), EUA', 2026);

insert into looks (id_modelo, id_lugar, cor_principal, possui_asas) values
(1, 001, 'preto', 'sim'),
(2, 002, 'rosa', null),
(3, 003, 'prata', 'nao'),
(4, 004, 'azul claro', 'sim'),
(5, 005,  'dourado', 'sim'),
(6, 006, 'preto', null),
(7, 007, 'vermelho', 'sim'),
(8, 008, 'branco', 'nao'),
(9, 009, 'prata',  null),
(10,010,'branco', 'sim');
 
-- Exercicio 01
select 
model.nome as modelo,
look.cor_principal as look
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exercicio 02
select *
from modelos model
inner join looks look on model.id = look.id_modelo
inner join lugarDesfile ld on look.id_lugar = ld.id_lugar; 

-- Exercicio 03
select
model.nome as modelo,
look.cor_principal as look,
status_angel
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exericicio 04
select
id_modelo,
model.nome as modelo,
email
from modelos model
inner join looks look on model.id= look.id_modelo;

-- Exercicio 05
select
model.id,
model.nome as modelo,
ld.ano
from modelos model
inner join looks look on model.id = look.id_modelo 
inner join lugarDesfile ld on model.id = ld.id_lugar;

-- Exercicio 06
select
model.nome as modelo,
look.cor_principal as look,
status_angel
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exercicio 07
select
model.id,
model.nome as modelo,
possui_asas,
nacionalidade,
ano_estreia
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exercicio 08
select 
model.nome as modelo,
ld.id_lugar as lugar,
look.cor_principal
from modelos model
inner join lugarDesfile ld on model.id = ld.id_lugar
inner join looks look on model.id = look.id_modelo;

-- Exercicio 09
select 
model.nome as modelo,
possui_asas,
nacionalidade,
look.cor_principal,
ld.cidade as lugar
from modelos model
inner join lugarDesfile ld on model.id = ld.id_lugar
inner join looks look on model.id = look.id_modelo;

-- Exercicio 10
select
model.nome as modelo,
nacionalidade,
status_angel
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exercicio 11
select
model.nome as modelo,
nacionalidade
from modelos model
left join looks look on model.id = look.id_modelo
where nacionalidade is null;

-- Exercicio 12
select 
model.nome as modelo,
nacionalidade,
look.cor_principal
from modelos model
inner join looks look on model.id = look.id_modelo;

-- Exercicio 13
select
model.nome as modelo,
email,
nacionalidade,
look.cor_principal
from modelos model
right join looks look on model.id = look.id_modelo;

-- Exercicio 14
select
model.nome as modelo,
possui_asas,
nacionalidade,
look.cor_principal,
ld.cidade as lugar
from modelos model
inner join lugarDesfile ld on model.id = ld.id_lugar
inner join looks look on model.id = look.id_modelo;

-- Exercicio 15
select
id_modelo,
id_lugar,
model.nome as modelo,
email,
nacionalidade,
look.cor_principal
from looks look
right join modelos model on look.id_modelo = model.id;

-- Exercicio 16
select
model.nome as modelo,
ano_estreia
from modelos model
right join looks look on model.id = look.id_modelo
where ano_estreia is null;

-- Exercicio 17
select
model.nome as modelo,
ld.id_lugar as lugar,
look.cor_principal,
look.possui_asas
from modelos model
inner join lugarDesfile ld on model.id = ld.id_lugar
inner join looks look on model.id = look.id_modelo
where possui_asas = 'sim';

-- Exercicio 18
select
model.nome as modelo,
ld.id_lugar as lugar,
look.cor_principal,
look.possui_asas,
nacionalidade
from modelos model
inner join lugarDesfile ld on model.id = ld.id_lugar
inner join looks look on model.id = look.id_modelo
where possui_asas = 'sim' and nacionalidade = 'brasil';

-- Exercicio 19
select
id_modelo,
id_lugar,
model.nome as modelo,
email,
nacionalidade,
look.cor_principal
from looks look
right join modelos model on look.id_modelo = model.id;

-- Exercicio 20
select
model.nome as modelo,
ld.cidade as lugar,
look.cor_principal,
look.possui_asas,
nacionalidade
from modelos model
left join lugarDesfile ld on model.id = ld.id_lugar
left join looks look on model.id = look.id_modelo;

drop table modelos;
drop table looks;
drop table lugarDesfile;
select * from lugarDesfile;
