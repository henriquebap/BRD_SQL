drop table ALUNO
drop table DISCIPLINA
drop table turma
drop table Historico
drop table Professor


CREATE TABLE Aluno (
 RA NUMBER PRIMARY KEY,
 nome VARCHAR2(100),
 endereco VARCHAR2(200),
 cidade VARCHAR2(100)
);

CREATE TABLE Professor (
 COD_PROF NUMBER PRIMARY KEY,
 nome VARCHAR2(100),
 endereco VARCHAR2(200),
 cidade VARCHAR2(100)
)

CREATE TABLE Disciplina (
 COD_DISC NUMBER PRIMARY KEY,
 nome_disc VARCHAR2(100),
 carga_hor NUMBER
);

CREATE TABLE Turma (
 COD_DISC NUMBER,
 COD_TURMA NUMBER,
 COD_PROF NUMBER,
 ano NUMBER,
 horario VARCHAR2(50),
 PRIMARY KEY (COD_DISC, COD_TURMA, COD_PROF, ano),
 FOREIGN KEY (COD_DISC) REFERENCES Disciplina(COD_DISC),
 FOREIGN KEY (COD_PROF) REFERENCES Professor(COD_PROF)
);

CREATE TABLE Historico (
 RA NUMBER,
 COD_DISC NUMBER,
 COD_TURMA NUMBER,
 COD_PROF NUMBER,
 ano NUMBER,
 frequencia NUMBER,
 nota NUMBER,
 PRIMARY KEY (RA, COD_DISC, COD_TURMA, COD_PROF, ano),
 FOREIGN KEY (RA) REFERENCES Aluno(RA),
 FOREIGN KEY (COD_DISC, COD_TURMA, COD_PROF, ano) REFERENCES 
Turma(COD_DISC, COD_TURMA, COD_PROF, ano)
);


insert into aluno values(1,'maria','Rua M', 'Macapa')
insert into aluno VALUES(2, 'Joao', 'Rua A', '')
insert into aluno values(3,'Ricardo', 'Rua B', 'Sao Jose')
insert into aluno values(4,'Levi', 'Rua B', 'Alphaville')

insert into turma values(1,1,1,2000,'verspertino')
insert into turma values(2,240,2,2000,'verspertino')


insert into historico values(1,2,2,1,2012,10,6)

insert into professor values(1,'Marcel','Rua C', 'Sao Paulo')
insert into professor values(1,'Adriano','Rua C', 'Sao Paulo')


insert into disciplina values(1,'matematica',30)
insert into disciplina values(2,'BD',30)
insert into disciplina values(3,'BD',270)
insert into disciplina values(4,'BD',560)




insert into 

1) Mostre os alunos com seu nome e cidade. Ordenados pelo nome de forma crescente.


2) Exiba o nome, carga horária das disciplinas. Classificados pela carga horária de forma 
crescente.


3) Encontre o RA dos alunos com nota em BD em 2012 menor que 7 (obs: BD = código da 
disciplina).


4) Quais as disciplinas (todas as colunas) que possuem carga horária entre 250 e 550 horas.

select * from DISCIPLINA
where CARGA_HOR > 250 and CARGA_HOR < 550;

5) Exiba o nome do professor e a cidade onde ele mora, desde que tenha a letra “i” em seu nome 
e não mora nas cidades de: “São Paulo e Guarulhos”.

select nome, CIDADE from Professor
where like(%i%) and CIDADE !='São Paulo' and CIDADE !='Guarulhos';

6) Exiba os dados das turmas que estão entre 220 e 320 (inclusive), são do ano de 2000, horário 
vespertino.

select * from Turma
where cod_turma >=220 and cod_turma <= 320 and ano = 2000 and horario = 'verspertino'

7) Mostre o ra dos alunos, com nota menor que 6 e maior que 7, onde a frequência foi menor que 
20.

select ra from aluno where nota < 6 and nota > 7 and frequencia < 20

select aluno.ra, hisotico.nota, historico.frequencia from Historico
    inner join aluno on hisotrico.RA = aluno.RA
    where aluno.frequencia like < (20); 

8) Mostre o conteúdo da tabela aluno onde a cidade não possua dados, o nome tenha quatro
dígitos e não more em São Paulo ou Bahia.
9) Exiba os alunos (RA) da turma 5, que tiveram aula com o professore de código 99, 37, 44 nos 
anos de 2009 até 2015 (inclusive).
10) Mostre os alunos com nome Maria e Ricardo que trabalham no departamento 30.
11) Quais as disciplinas que começam com a letra “C”, possuam carga horária diferente de 100



-- Exercicio 1
SELECT nome, cidade FROM Aluno ORDER BY nome;

-- Exercicio 2 
SELECT nome_disc, carga_hor FROM Disciplina ORDER BY carga_hor;

-- Exercicio 3
SELECT RA FROM Aluno WHERE RA = (SELECT RA FROM Historico WHERE nota < 7 and ano = 2012 and cod_disc = 'BD');

-- Exercicio 7
SELECT RA FROM Aluno WHERE RA = (SELECT RA FROM Historico WHERE nota < 6 or nota > 7 and frequencia < 20);

-- Exercicio 8
SELECT * FROM Aluno WHERE cidade != 'São Paulo' and cidade != 'Bahia' and nome = '__'; 

-- Exercicio 9
SELECT RA FROM Aluno WHERE RA = (SELECT RA FROM Historico WHERE ano >= 2009 and ano <= 2015 and cod_prof = 99 or cod_prof = 37 or cod_prof = 44);

-- Exercicio 10
SELECT * from Aluno WHERE nome = 'Maria' or nome = 'Ricardo';

-- Exercicio 11
SELECT * FROM Disciplina WHERE nome_disc = 'c:' and carga_hor != 100;