DROP TABLE CDS CASCADE CONSTRAINTS;
DROP TABLE MUSICAS CASCADE CONSTRAINTS;


CREATE TABLE CDS (cod_cds NUMBER(3) CONSTRAINT cds_cod_pk PRIMARY KEY,
                        nome_cds VARCHAR(50),
                        data_compra DATE,
                        valor_pago NUMBER(8,2),
                        local_compra VARCHAR(20),
                        album CHAR(1)
                        );

CREATE TABLE MUSICAS (cod_cds NUMBER(3) CONSTRAINT cd_cds_fk REFERENCES CDS,
                        numero_musica NUMBER(3),
                        nome_musica VARCHAR(50),
                        artista_usica VARCHAR(50),
                        tempo_musica NUMBER(4)
                        );


-- Faca inserts na tabela CDS?
insert into CDS values(111, 'Yes', '22-OCT-22', 222.22,'Avenida Paulista',1);
insert into CDS values(1, 'City', '25-AUG-20', 500.22,'Lojinha ',1);


insert into MUSICAS VALUES(111, 2, 'Marry You', 'Bruno Mars', 123);
insert into MUSICAS VALUES(1,1,'Caneta Azul','Manuel Gomes', 60);

select * from MUSICAS;

1. Mostrar todos os CDs.

select * from CDS;

2. Mostrar os campos nome e data da compra dos cds ordenados por
nome.

select nome_cds, data_compra from CDS order by nome_cds;

3. Mostrar os campos nome e data da compra dos cds classificados por
data de compra em ordem decrescente.

select nome_cds, data_compra from CDS order by data_compra desc;


4. Mostrar todas as músicas (todos os campos) do cds código 1.

select * from MUSICAS
where cod_cds = 1;

5. Mostrar o nome do Cd e o nome das músicas de todos Cds.


6. Mostre o nome e o artista de todas músicas cadastradas.

7. Mostre o tempo total de músicas cadastradas.

8. Mostre o número, nome e tempo das músicas do cd 5 em ordem de
número.
9. Mostre o tempo total de músicas por cd.
10.Mostre a quantidade de músicas cadastradas.
11.Mostre a média de duração das músicas cadastradas.
12.Mostre o nome das músicas do artista José Pedro.
13.Mostre a quantidade de Cds.
14.Mostre a quantidade de músicas por CDs.
15.Mostre o nome de todos cds comprados no Submarino.
16.Mostre o nome do cd e o nome da primeira música de todos CDs.
17.Mostre uma listagem de músicas em ordem alfabética.
18.Mostrar todos os cds que são álbuns.
19.Mostre o cd que custou mais caro.