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
                        artista_musica VARCHAR(50),
                        tempo_musica NUMBER(4)
                        );


-- Faca inserts na tabela CDS?
insert into CDS values(111, 'Yes', '22-OCT-22', 222.22,'Avenida Paulista',1);
insert into CDS values(1, 'City', '25-AUG-20', 500.22,'Lojinha ',1);
insert into CDS values(2, 'Death of Bachelor', '25-JULY-20', 3000.2, 'Spotfy',3);
insert into CDS values(3, 'Apologize', '25-JULY-20', 5000.2, 'Submarino',4);
insert into CDS values(4, 'Thats What you get', '22-JAN-22', 6000.2, 'Submarino',1);


insert into MUSICAS VALUES(111, 2, 'Marry You', 'Bruno Mars', 123);
insert into MUSICAS VALUES(1,1,'Caneta Azul','Manuel Gomes', 60);
insert into MUSICAS VALUES(2,3,'Beath of a bachelor','Panic', 220);
insert into MUSICAS VALUES(2,1,'I Caught Myself','Jose Pedro', 300);
insert into MUSICAS VALUES(3,1,'Apologize','One Republic', 340);



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

select nome_cds, NOME_MUSICA
FROM MUSICAS
INNER JOIN CDS ON MUSICAS.COD_CDS=CDS.COD_CDS;

6. Mostre o nome e o artista de todas músicas cadastradas.

select nome_musica, artista_musica
from MUSICAS;

7. Mostre o tempo total de músicas cadastradas.

select sum(TEMPO_MUSICA) "Somatoria total" from musicas;

8. Mostre o número, nome e tempo das músicas do cd 5 em ordem de
número.

select NUMERO_MUSICA, NOME_MUSICA, TEMPO_MUSICA
from musicas
order by 1 asc;



9. Mostre o tempo total de músicas por cd.

SELECT COD_CDS, SUM(tempo_musica), COUNT(*) FROM musicas GROUP BY cod_cds ORDER BY 1 DESC;

10.Mostre a quantidade de músicas cadastradas.

SELECT count(*) FROM musicas;

11.Mostre a média de duração das músicas cadastradas.

select round(avg(TEMPO_MUSICA),2)"Media de duracao das msucas" from MUSICAS;
select avg(TEMPO_MUSICA)"Media T Musicas" from musicas; 

12.Mostre o nome das músicas do artista José Pedro.

select NOME_MUSICA
from MUSICAS
WHERE artista_musica = 'Jose Pedro';

13.Mostre a quantidade de Cds.

select count(*) from CDS;

14.Mostre a quantidade de músicas por CDs.

select COD_CDS, count(*) from MUSICAS group by COD_CDS;


15.Mostre o nome de todos cds comprados no Submarino.

select NOME_CDS 
from CDS
WHERE LOCAL_COMPRA = 'Submarino';


16.Mostre o nome do cd e o nome da primeira música de todos CDs.



select CDS.NOME_CDS, musicas.NOME_MUSICA
from CDS
left join musicas on cds.COD_CDS = MUSICAS.COD_CDS
where MUSICAS.NUMERO_MUSICA = 1;



17.Mostre uma listagem de músicas em ordem alfabética.

select MUSICAS.NOME_MUSICA from MUSICAS
order by 1;

18.Mostrar todos os cds que são álbuns.

select * from CDS where cds.ALBUM = 1 or cds.ALBUM > 1;

19.Mostre o cd que custou mais caro.

select max(cds.VALOR_PAGO) "Valor mais caro" from cds;

20.Mostre as músicas que tem o tempo de 3 minutos.

select MUSICAS.TEMPO_MUSICA from MUSICAS
where TEMPO_MUSICA = 3 or TEMPO_MUSICA > 3;

21.Mostre todas as músicas com um determinado artista.

select musicas.* from MUSICAS
where MUSICAS.ARTISTA_MUSICA = 'Panic'

