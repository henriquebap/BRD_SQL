--1 
select * from cds;

--2
select nome, dataCompra from cds order by 1;

--3
select nome, dataCompra from cds order by 2 desc;

--4
select * from musicas where codigocd = 1;

--5
select nome.cds, musica from musicas
    inner join cds on musica.codigocd = cds.codigo;
    
--6
select artista, nome from musicas;

--7
select count(numero) as "Número de Músicas" from musicas;

--8
select numero, nome, tempo from musicas where codigocd like 5 order by 1;

--9
select codigocd, sum(tempo) tempoTotal from musicas;

--10
select count(numero) musicas from musicas;

--11
SELECT avg(tempo) "duração media musicas" from musicas;

--12
select nome from musicas where upper(artista) = "JOSÉ PEDRO";

--13
SELECT COUNT(codigo) from cds;

--14
select codigocd, count(numero) from musicas group by codigocd;

--15
select nome, localCompra from cds where lower(nome) like("submarino");

--16
select nome.cds, nome.musicas from musicas
      inner join cds on musica.codigocd = cds.codigo
        where nome.musicas like 1;

--17
select nome from musicas order by 1;

--18
select nome from cds where album = 1;

--19
select nome, max(valorpago) from cds;









