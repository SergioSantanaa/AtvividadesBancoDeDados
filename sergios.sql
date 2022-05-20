create database sergios;

use sergios;
 create table tb_setor(
 id int(10) primary key not null auto_increment,
 nome varchar(50) not null
 );
 
create table tb_funcionarios(
id int (10) primary key not null auto_increment,
nome varchar(50) not null,
sobrenome varchar(50) not null,
cpf int(11)  unique not null,
rg int(11) unique not null,
id_setor int(10), 
foreign key(id_setor) references tb_setor(id)

);

create table tb_endereco(
id int(11) primary key not null auto_increment,
logradouro varchar(50)  not null,
bairro varchar(20) not null,
estado varchar(20) not null,
cep int(10) not null
);

create table tb_auxiliar_funcionarios_endereco(
id_funcionarios int(11) not null,
id_endereco int(11) not null,
foreign key (id_funcionarios) references tb_funcionarios(id),
foreign key (tb_endereco) references tb_endereco(id)
);

create table tb_dependente(
id int(10) primary key not null auto_increment,
nome varchar(50) not null,
cpf int(11) unique not null,
rg int(11) unique not null,
id_fucionarios int(10), 
foreign key (id_fucionarios) references tb_funcionarios(id)

);

create table tb_telefone_funcionarios(
id int(10) primary key not null auto_increment,
codigo_area char(2) not null,
numero char(15) not null,
id_funcionarios int(10),
foreign key(id_funcionarios)  references tb_funcionarios(id)
);


create table tb_cliente(
id int(10) primary key not null auto_increment,
nome varchar(50) not null,
sobrenome varchar(50) not null,
cpf int(11) unique not null,
rg int(11) unique not null

);

create  table tb_pedido(
numero_pedido int(11) primary key not null auto_increment,
id_cliente int(10) not null,
foreign key (id_cliente) references tb_cliente(id)
);

create  table tb_email(
id int(10) primary key not null auto_increment,
login varchar(40)  not null,
id_cliente int(10) not null,
foreign key (id_cliente) references tb_cliente(id) 

);
select *from tb_funcionarios;


insert into tb_setor(nome) values('RH');
insert into tb_setor(nome) values('OPERACIONAL');
insert into tb_setor(nome) values('TI');
insert into tb_setor(nome) values('FINANCEIRO');
insert into tb_setor(nome) values('DIRETORIA'); 
insert into tb_setor(nome) values('ADMINISTRATIVO');
select *from tb_setor;
alter table  tb_funcionarios add salario float(8,2);
alter table  tb_funcionarios add comissao float(8,2);


insert into tb_funcionarios(nome,sobrenome,cpf,rg,id_setor) values ('SERGIO', 'COSTA', 132754650, 675878585, 2);
insert into tb_funcionarios(nome,sobrenome,cpf,rg,id_setor) values ('Luis', 'Lula', 656545323, 668554302, 3);
insert into tb_funcionarios(nome,sobrenome,cpf,rg,id_setor) values ('Paulo', 'Andrade', 657748893, 766459898, 4);
select *from tb_setor;
select *from tb_funcionarios;
select *from tb_dependente;
select *from tb_cliente;
insert into tb_cliente(nome,sobrenome,cpf,rg) values ('Paulo', 'Silva', 018846278, 012458931);
insert into tb_dependente(nome,cpf,rg,id_fucionarios) values ('Alaide', 144791544, 771166148, 1);
select *from tb_setor;
select *from tb_funcionarios;
select *from tb_dependente;
insert into tb_dependente(nome,cpf,rg,id_fucionarios) values ('Cesar', 247895465, 478917583, 2);
insert into tb_dependente(nome,cpf,rg,id_fucionarios) values ('Silvio', 014786542, 931576896, 3);



UPDATE tb_funcionarios SET salario=1000 WHERE id=1;

UPDATE tb_funcionarios SET salario=2000 WHERE id=2;

UPDATE tb_funcionarios SET salario=3000 WHERE id=3;

UPDATE tb_funcionarios SET comissao=1000 WHERE id=1;

UPDATE tb_funcionarios SET comissao=2000 WHERE id=2;

UPDATE tb_funcionarios SET comissao=3000 WHERE id=3;

select * from tb_funcionarios;

SELECT nome, sobrenome FROM tb_funcionarios;

SELECT nome AS apelido_setor FROM tb_setor;

SELECT nome FROM tb_setor;

SELECT concat("Olá ",nome) FROM tb_funcionarios;

SELECT distinct nome FROM tb_setor;

SELECT salario+comissao from tb_funcionarios;

SELECT * from tb_funcionario limit 2;

#ALTER TABLE nome_tabela CHANGE COLUMN nome_atual_coluna nome_a_atualizar; #Atualizar coluna tabela.

SELECT FORMAT ((((5+5)*2)/salario),2)FROM tb_funcionarios;


SELECT FORMAT ((((5+5)*2)/salario),2) AS formula_matematica FROM tb_funcionario;

select salario from tb_funcionario;

select nome, sobrenonome from tb_funcionarios where nome= 'Paulo';
select nome, sobrenome, salario from tb_funcionarios where salario>= 2000;
select nome from tb_funcionarios where id=4;
select nome from tb_funcionarios where salario <1000;
select nome from tb_funcionarios where salario between 1500 and 2000;
select nome,salario from tb_funcionarios where salario in(1000,2000,3000);
select nome from tb_funcionarios where nome in  ('Luana', 'Rafael','Paulo');
select nome from tb_funcionarios where salario is null;
select nome  from tb_funcionarios where nome like 'P%'; 
select nome from tb_funcionarios where nome like '%lo'; 
select nome from  tb_funcionarios where nome like'_A%';

select nome from tb_funcionarios where  id=1 and salario >1000;
select nome, salario,id from tb_funcionarios;
select nome,salario from tb_funcionarios where salario <1000 or salario =1000;
select nome from tb_funcionarios where not (salario>2000 and id=1);
select nome,salario,id from tb_funcionarios where salario<1000 or salario=1000;
select nome,salario from tb_funcionarios where not (salario<=1000 and id=1);

select nome,sobrenome from tb_funcionarios order by nome;
select nome,sobrenome,salario from tb_funcionarios order by salario asc;
select nome,sobrenome,salario from tb_funcionarios order by salario desc;
select nome,sobrenome,salario from tb_funcionarios where salario>= 2000 order by nome;


select *from tb_funcionarios;
select avg(salario)  from tb_funcionarios;
select count(*) from tb_funcionarios;
select count(*) from tb_funcionarios group by id_setor having avg (salario)>=1000;
select sum(salario) from tb_funcionarios;
select upper(nome) from tb_funcionarios;
select lower(nome) from tb_funcionarios;
select substr(nome,1,4) from tb_funcionarios;
select length(nome) from tb_funcionarios;
select rpad(nome,9,'-') from tb_funcionarios;
select rpad(nome,length(nome)+1,'-') from tb_funcionarios;
select lpad(nome,9,'#') from tb_funcionarios;




set foreign_key_checks=0;
truncate tb_funcionarios;
set foreign_key_checks=1;


select nome, sobrenome from tb_funcionarios;

update tb_funcionarios set nome = 'Sergio' where id=1;
update tb_funcionarios set sobrenome = 'Santana' where id=1;
select *from tb_funcionarios; 


select tb_funcionarios.nome, tb_setor.nome from tb_funcionarios
inner join tb_setor on tb_funcionarios.id_setor=tb_setor.id;



select tb_funcionarios.nome, tb_funcionarios.sobrenome, tb_endereco.logradouro from tb_funcionarios
inner join tb_auxilliar_funcionarios_endereco
inner join tb_endereco
on tb_funcionarios.id=tb_auxiliar_funcionario_endereco.id_funcionarios

and tb_endereco.id=tb_auxiliar_funcionarios_endereco.id_endereco;
select nome,salario from tb_funcionarios where salario=(select max(salario) from tb_funcionarios);
select nome,salario from tb_funcionarios where salario>(select avg(salario) from tb_funcionarios);


select nome,salario from tb_funcionarios



