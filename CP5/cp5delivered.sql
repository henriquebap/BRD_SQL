-- Henrique Baptista | RM 97796
-- Pedro Pacheco | RM 98043

CREATE TABLE Aluno (
 RA NUMBER PRIMARY KEY,
 nome VARCHAR2(100),
 endereco VARCHAR2(200),
 cidade VARCHAR2(100)
);

CREATE TABLE Disciplina (
 COD_DISC NUMBER PRIMARY KEY,
 nome_disc VARCHAR2(100),
 carga_hor NUMBER
);

CREATE TABLE Professor (
 COD_PROF NUMBER PRIMARY KEY,
 nome VARCHAR2(100),
 endereco VARCHAR2(200),
 cidade VARCHAR2(100)
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

-- Exercicio 1 * 
SELECT nome, cidade FROM Aluno ORDER BY nome;

-- Exercicio 2 *
SELECT nome_disc, carga_hor FROM Disciplina ORDER BY carga_hor;

-- Exercicio 3 *
SELECT RA FROM Aluno WHERE RA = (SELECT RA FROM Historico WHERE nota < 7 and ano = 2012 and cod_disc = (SELECT COD_DISC FROM DISCIPLINA WHERE NOME_DISC = 'BD'));

-- Exercicio 4 *
select * from DISCIPLINA
where CARGA_HOR > 250 and CARGA_HOR < 550;

-- Exercicio 5 *
select nome, CIDADE from Professor where nome like('%i%') and CIDADE !='São Paulo' and CIDADE !='Guarulhos';

-- Exercicio 6 *
select * from Turma where cod_turma >= 220 and cod_turma <= 320 and ano = 2000 and horario = 'vespertino';

-- Exercicio 7 *
SELECT RA FROM ALUNO WHERE RA = (SELECT RA FROM HISTORICO WHERE nota < 6 or nota > 7 and FREQUENCIA < 20);

-- Exercicio 8 *
SELECT * FROM Aluno WHERE cidade != 'São Paulo' and cidade != 'Bahia' and nome like('____'); 

-- Exercicio 9 *
SELECT RA FROM Aluno WHERE RA = (SELECT RA FROM Historico WHERE ano >= 2009 and ano <= 2015 and cod_prof = 99 or cod_prof = 37 or cod_prof = 44);

-- Exercicio 10 * 
SELECT * from Aluno WHERE nome = 'Maria' or nome = 'Ricardo';

-- Exercicio 11 *
SELECT * FROM Disciplina WHERE nome_disc like('C%') and carga_hor != 100;
