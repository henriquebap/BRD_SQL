DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE vendedor CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE ITEM_PEDIDO CASCADE CONSTRAINTS;

CREATE TABLE cliente (cod_clie NUMBER(4) CONSTRAINT clie_cod_pk PRIMARY KEY,
                        nome_clie VARCHAR(20) NOT NULL,
                        endereco VARCHAR(30),
                        cidade VARCHAR(15),
                        cep CHAR(8),
                        uf CHAR(2),
                        cnpj CHAR(16),
                        ie CHAR(12)
                        );

CREATE TABLE vendedor(cod_ven NUMBER(4) CONSTRAINT cod_ven_pk PRIMARY KEY,
                        nome_ven VARCHAR(20) NOT NULL,
                        salario_fixo NUMBER(10,2),
                        comissao CHAR(1)
                        );

CREATE TABLE produto (cod_prod NUMBER(4) CONSTRAINT cod_prod_pk PRIMARY KEY,
                        unidade VARCHAR(3),
                        descricao VARCHAR(20),
                        val_unit NUMBER(8, 2)
                        );

CREATE TABLE pedido (num_pedido NUMBER(4) CONSTRAINT num_ped_pk PRIMARY KEY,
                        pr_entrega NUMBER(3) NOT NULL,
                        cod_clie NUMBER(4) CONSTRAINT pe_cli_fk REFERENCES cliente,
                        cod_ven NUMBER(4) CONSTRAINT pe_ven_fk REFERENCES vendedor);

CREATE TABLE item_pedido(num_pedido NUMBER(4) CONSTRAINT num_ped_item_fk REFERENCES pedido,
                            cod_prod NUMBER(4) CONSTRAINT cod_pro_ped_fk REFERENCES produto,
                            quant NUMBER(8,2));
                        

--INSERTS TODO
--Insert INTO table (Values)
insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231/0001-34','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','22534126/9387-9','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','14512764/9834-9',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','283152123/9348-8','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','32816985/7465-6','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','23463284/234-9','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','12835128/2346-9','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','32485126/7326-8','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','32848223/324-2','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','12736571/2347-4','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','21763571/232-9','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','13276571/1231-4','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','32176547/213-3','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','21763576/1232-3','2931');

 

insert into vendedor values(209,'Jose','1800','C');
insert into vendedor values(111,'Carlos','2490','A');
insert into vendedor values(11,'Joao','2780','C');
insert into vendedor values(240,'Antonio','9500','C');
insert into vendedor values(720,'Felipe','4600','A');
insert into vendedor values(213,'Jonas','2300','A');
insert into vendedor values(101,'Joao','2650','C');
insert into vendedor values(310,'Josias','870','B');
insert into vendedor values(250,'Mauricio','2930','B');

 

insert into produto values ('25','KG','Queijo','0.97');
insert into produto values ('31','BAR','Chocolate','0.87');
insert into produto values ('78','L','Vinho','2.00');
insert into produto values ('22','M','Linho','0.11');
insert into produto values ('30','SAC','Acucar','0.30');
insert into produto values ('53','M','Linha','1.80');
insert into produto values ('13','G','Ouro','6.18');
insert into produto values ('45','M','Madeira','0.25');
insert into produto values ('87','M','Cano','1.97');
insert into produto values ('77','M','Papel','1.05');

 

insert into pedido values ('121','20','410','209');
insert into pedido values ('97','20','720','101');
insert into pedido values ('101','15','720','101');
insert into pedido values ('137','20','720','720');
insert into pedido values ('148','20','720','101');
insert into pedido values ('189','15','870','213');
insert into pedido values ('104','30','110','101');
insert into pedido values ('203','30','830','250');
insert into pedido values ('98','20','410','209');
insert into pedido values ('143','30','20','11');
insert into pedido values ('105','30','180','240');
insert into pedido values ('111','15','260','240');
insert into pedido values ('103','20','260','11');
insert into pedido values ('91','20','260','11');
insert into pedido values ('138','20','260','11');
insert into pedido values ('108','15','290','310');
insert into pedido values ('119','30','390','250');

 

insert into item_pedido values ('121','25','10');
insert into item_pedido values ('121','31','35');
insert into item_pedido values ('97','77','20');
insert into item_pedido values ('101','31','9');
insert into item_pedido values ('101','78','18');
insert into item_pedido values ('101','13','5');
insert into item_pedido values ('98','77','5');
insert into item_pedido values ('148','45','8');
insert into item_pedido values ('148','31','7');
insert into item_pedido values ('148','77','3');
insert into item_pedido values ('148','25','10');
insert into item_pedido values ('148','78','30');
insert into item_pedido values ('104','53','32');
insert into item_pedido values ('203','31','6');
insert into item_pedido values ('189','78','45');
insert into item_pedido values ('143','31','20');
insert into item_pedido values ('143','78','10');

-- MOstrar os dados

select * from cliente;

--Criar um relatorio que mostre o nome do cliente e seu endereco
select nome_clie, endreco from cliente;

--Apelidando Colunas
select nome_clie "Nome do Cliente", endereco "Endereco" from cliente;

-- Classificando um relatorio

order by nome_coluna asc - crescente DEFAULT
-- Ou
order by nome_coluna desc - decrescente

select nome_clie, endereco from cliente order by 2;
select * from cliente order by 1;
desc CLIENTE


select uf,NOME_CLIE from cliente order by 1,2;


--Criar um relatorio que mostre o nome dos clientes em ordem crescente
select NOME_CLIE from cliente order by nome_clie asc;

--Criar um relatorio que mostre o nome dos cliente em ordem decrescente
select nome_clie from cliente order by NOME_CLIE desc;


--Filtrando Linhas

--operadores: aritimeticos + - * / ()
            -- relacionais > >= < <= = <> ou !=
            --logicos and or NOT
            -- bd between, in, like

-- Sintax : select
        -- from
        -- where condicao

-- Exemplos
-- Criar um relatorio que mostre os clientes de codigo superior a 500

SELECT * FROM CLIENTE WHERE COD_CLIE > 500 -- ORDER BY Nome_Clie ASC;

-- Organizado pelo cod_clie
Select * from cliente where cod_clie > 500 order by 1;

-- Criar um relatorio que mostre os clientes de codigo inferior a 500
select * from cliente where cod_clie < 500;

-- Organizando pelo codigo
select * from cliente where cod_clie < 500 order by NOME_CLIE asc;

-- Exibir todos os cliente que moram no estado de sao Paulo
select * from cliente where uf = 'SP' order by 1;

-- Mostre o nome do cliente que more em Sao Paulo e o Rio de Janeiro
select nome_clie, uf
from cliente
where uf = 'SP' or uf = 'RJ';

-- Mostre o nome do cliente que more em Sao Paulo e tenha codigo superior a 300
select nome_clie, uf, COD_CLIE
from cliente
where uf = 'SP' and cod_clie > 300;

--Execicio
-- 1) Primeiro Listando dos os produtos
select * from produto
--2) Seleciona vendedores o nome que tem comissao tipo C
select NOME_VEN, COMISSAO
from VENDEDOR
where comissao = 'C'
-- 3) Mostrar pedidos cliente e vendedor descrescente
select num_pedido, cod_clie, cod_ven from pedido order by 2 desc, 3 desc;
--4) Crie uma listagem dos pedidos com seus produtos, classifique por pedidos
select num_pedido, cod_prod from ITEM_PEDIDO order by 1;
-- 5) Quais os pedidos pertencem ao vendedor de codigo 209
select NUM_PEDIDO
from PEDIDO
where COD_VEN = 209
--6)Quem sao os vendedores (nome, salario) que ganham entre 1000 e 4600 (inclusve)
select NOME_VEN, SALARIO_FIXO
from VENDEDOR
where SALARIO_FIXO >= 1000 and SALARIO_FIXO <= 4600;
--7) Quais produtos, mostre nome, preco com unidade de medida igual a litro, metro e grama
select DESCRICAO, val_unit, UNIDADE
from PRODUTO
where unidade = 'L' or UNIDADE = 'M' or UNIDADE = 'G'
--8)Mostre os dados dos clientes que possuem codigo entre 250 e 750, nao morem no RJ
-- seu cep maior que 25000000.
select COD_CLIE, UF, CEP
from CLIENTE
where COD_CLIE >=250 and COD_CLIE <=750 and uf != 'RJ' and Cep > 25000000;
--9) Quais pedidos possuem os produtos: 31, 77, 78, tenham quantidade maior que 8
-- e que o numeor do pedido seja menor ou igual a 200?

-- select COD_PROD,



-- Processamento matematico

--Criar um relatorio que mostre qual sera o novo salario dos vendedores com um bonus de 150
select SALARIO_FIXO "Salario Atual", SALARIO_FIXO + 150 "Salario reajustado"
from VENDEDOR;

--Criar um relatorio que mostre qual sera o novo salario dos vendedores com um bonus de 15%
select SALARIO_FIXO "Salario Atual", SALARIO_FIXO *1.15 "Salario reajustado"
from VENDEDOR;

--- Quais vendedores (nome) com o acrescimo de 15% ganhariam mais de 3.5000?
SELECT NOME_VEN, SALARIO_FIXO, SALARIO_FIXO *1.15 "Salario reajustado" FROM VENDEDOR WHERE ((SALARIO_FIXO*1.15)>3500);


-- Aula 8 - 3/10 criando relatorios
-- Cp2 17/10 INdividual ou em dupla

- in (list) - igual ou dentro de uma lista
        Sintaxe: nome_coluna in(valor1,....., valorN)

--Quais os produts, mostram o nome , preco com unidade de medida igual a litro, metro e grama
-- Exemplol com operadores de bd:
select descricao, val_unit, unidade FROM produto
where unidade in ('L','M','K');

-- Negando a lista
select descricao, val_unit unidade from produto
where unidade not in ('L','M','K')

--Montar um relatório que mostre os clientes de código entre 100 e 500 (inclusive) e que não morem nos estados de SP e MG.

select nome_clie, cod_clie, uf from Cliente
where cod_clie BETWEEN 100 and 500 and uf not in ('SP','MG')
ORDER by 1;

-- like - igual ou como o (s) valor(es)
        --opces - % - qualquer quantidade, qualquer posicao
                ---_(underline) - quantidade especifica, posicao especifica
        --sintax: nome_coluna like(?%?)
                --Nopme colune like(?_?)
                --Nome coluna like (?%?_?)
--Exemplo
Pesquisar os clientes com a letra "a" na ultima posicao de seu NOME_CLIE
-- % Qualquer QUANTIDADE DE POSICOES
sintaxe: nome_coluna like ('%a')

select NOME_CLIE from CLIENTE
where NOME_CLIE like '%a';

--Exemplo
Pesquisar os clientes com a letra "a" na primeira posicao de seu NOME_CLIE
-- % Qualquer QUANTIDADE DE POSICOES
sintaxe: nome_coluna like ('A%')

select NOME_CLIE from CLIENTE
where NOME_CLIE like 'A%';

--Exemplo
Pesquisar os clientes com a letra "a" em qualquer posicao de seu NOME_CLIE
-- % Qualquer QUANTIDADE DE POSICOES
sintaxe: nome_coluna like ('%A%')

select NOME_CLIE from CLIENTE
where NOME_CLIE like '%A%' or NOME_CLIE like '%a%';

-- Exemplo
Pesquisar os clientes que tenham 4 letras em seu nome
sintaxe: nome_coluna like('____') --- 4x underline

select NOME_CLIE from CLIENTE
where NOME_CLIE like '____';

-- Exemplo
Pesquisar os clientes que tem a letra "a" na 2a posicao de seu NOME_CLIE
sintaxe: nome_coluna like('_a%') --- 4x underline

select NOME_CLIE from CLIENTE
where NOME_CLIE like '_a%';


Pesquisar os clientes que tem a letra "i" em qualquer posicao de seu NOME_CLIE

select NOME_CLIE from CLIENTE
where NOME_CLIE like '%I%' or NOME_CLIE like '%i%';

Pesquisar os clientes que tem a letra "u" ou "o" em qualquer posicao de seu NOME_CLIE

select NOME_CLIE from CLIENTE
where NOME_CLIE like '%u%' or NOME_CLIE like '%o%';

Pesquisar os clientes com não tenham a letra "a" em seu nome

select NOME_CLIE from CLIENTE
where NOME_CLIE not like '%A%' and NOME_CLIE not like '%a%';

Pesquisar os clientes com a letra "a" e "o" em seu nome

select NOME_CLIE from CLIENTE
where NOME_CLIE like '%a%' and NOME_CLIE like '%o%';

-- Funcoes

-- Numerica Simples -  Numeros, processa linha a linha e retorna o resultado por Linha
-- Round - arredondamento
sintax: funcao(nome_coluna, casas decimais)
        round(nome_coluna, casa decimais)

-- Trunc - desprezo, ignorar casas decimais
sintax: funcao(nome_coluna, casas decimais)
        trunc(nome_colunam, casas decimais)


select SALARIO_FIXO / 1.3,
round (SALARIO_FIXO / 1.3,2) arredonda,
trunc(SALARIO_FIXO / 1.3,2)Despreza
from VENDEDOR;

-- Caracter
upper -- Maiusculo
lower -- Minusculo
initcap -- Primeira posicao maisucula
LENGTH -- Conta caracteres
substr -- Parte de uma string


Sintaxe: funcao(nome_coluna)
sintaxe substr(noem_coluna, inicio de leituram qtde de caracteres)

--Exemplo, Somente altera a visualizacao, nao as tabelas
select NOME_CLIE, upper(NOME_CLIE) Maiusculo, lower(NOME_CLIE) Minusculo from CLIENTE
order by 1;

--Initcap
select NOME_CLIE, upper(NOME_CLIE) Maiusculo, lower(NOME_CLIE) Minusculo,
initcap(NOME_CLIE) "Primeira Maiuscula"
FROM cliente
order by 1;

-- LENGTH
select NOME_CLIE, upper(NOME_CLIE) Maiusculo, lower(NOME_CLIE) Minusculo,
initcap(NOME_CLIE) "Primeira Maiuscula", LENGTH(NOME_CLIE) Tamanho
FROM cliente
order by 1;

-- substr

select NOME_CLIE, SUBSTR(NOME_CLIE,2,3) from CLIENTE;

-- Nova senha

select SUBSTR(NOME_CLIE,2,3)||substr(cep,2,3)||substr(NOME_CLIE,2,2)||substr(cnpj,3,3)"Nova Senha" 
from CLIENTE;

select * from cliente where lower(NOME_CLIE) = 'ana';
select * from cliente where upper(NOME_CLIE) = 'ana';


-- NUmerica Grupo - Analisa varias linhas e retorna um valor apenas

-- Quantos clientes existem na tabela cliente?

select count(*) from CLIENTE;

-- count = contador
Count (*) conta todas as linhas e as colunas e trona o maior valor
Count(coluna) - conta as linhas de uma coluna especifica


select count (*) , count(COD_CLIE), COUNT (CEP) from CLIENTE;
select * from cliente where cep is null;

-- Quantos clientes sao do estado de sao paulo?

select NOME_CLIE, uf from CLIENTE
where upper(uf) in 'SP';

-- Usando Count

select count(uf) from CLIENTE
where upper(uf) in 'SP';



-- Aula 9 - 10/10 Criando relatorios

-- CP2 - 17/10

Maior valor da colun a- max (nome_coluna)
Menorvalor da coluna a - min (nome_coluna)
somatoria de vaores de uma coluna - sum(nome_coluna)
media de valores de uma coluna - avg(nome_coluna)

select max (SALARIO_FIXO) "Maior Salario", min(SALARIO_FIXO)"Menor Salario",
sum(SALARIO_FIXO)"Soma de todos os salarios",
round (avg (SALARIO_FIXO),2)"Media de salarios" from VENDEDOR


agrupamento por coluna - group BY

-- Quantos vendedores existem por comissao?

select * from vendedor order by COMISSAO;
-- or
select comissao from vendedor order by 1;
-- Usado group by, select mostra um item se existe, count mostra a quantidade, de onde depois group by
select comissao, count(comissao) from VENDEDOR group by COMISSAO;
-- Verificar valores
select * from vendedor where upper(comissao) = 'A';

Quantos clientes nao moram no estado de Sp?
-- Nao se torna viavel usar o group by onde nao é chave primiaria ou preenchimento obrigatorio
select count(COD_CLIE)
from cliente
where upper(uf) !='SP';

Quantos clientes existem por estado?
-- aqui pede quantidade por cada estado, por isso o group by fica mais facil e viavel
select uf, count(COD_CLIE)from CLIENTE GROUP by uf;

select nome_ven, SALARIO_FIXO, SALARIO_FIXO * 1.1 "Salario + 10%" from VENDEDOR;

-- Quantos vendedores ganharao mais de 2.500 apos ser dado u aumeo de 10% em seu salario?

SELECT COUNT(*)
FROM VENDEDOR
WHERE SALARIO_FIXO * 1.1 > 2500;

-- Faca o nome do vendedor, seu salario_fixo desde que ele tenha o maior salario?

select NOME_VEN, SALARIO_FIXO * 1.1 "Salario Ajustado"
FROM VENDEDOR
where SALARIO_FIXO = (select max(SALARIO_FIXO) from VENDEDOR)


-- Exiba o nome do vendedor, seu salario desde que ele tenha o maior salario cadastrado 
-- na tabela vendedores
 -- Subconsulta - Subquery - subquerie
 -- 1 - Saida de dados
 select NOME_VEN, SALARIO_FIXO from VENDEDOR;
-- 2 -Condicao de Saida de Dados        
select max(SALARIO_FIXO) from VENDEDOR;
-- 3 juntar as duas
select nome_ven, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO = (select max(SALARIO_FIXO) from VENDEDOR);

-- Exiba o noe do vendedor, seu salaario desde que ele tenha o menor salario cadastrado
select NOME_VEN, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO = (select min(SALARIO_FIXO)from VENDEDOR);
--Exiba o nome do vendedor, seu saalario desde que ele teha o MENOR OU Maior salario cadastrado
select nome_ven, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO in ((SELECT min(SALARIO_FIXO) from VENDEDOR), (select max(SALARIO_FIXO) from VENDEDOR));
-- Exiba o nome do vendedr, seu salario desde que ele seja maior que a media salarial
select NOME_VEN, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO > (SELECT avg(SALARIO_FIXO) from VENDEDOR);


---- Juncao de tabelas-- Uso qunado o relatorio estiver a necessidade de acesso a mais--
-- de uma tabela
DROP TABLE cargo CASCADE CONSTRAINTS;
create table cargo(cd_cargo number(2)CONSTRAINT cargo_cod_pk PRIMARY KEY not null,
                        nm_cargo VARCHAR2(20) not NULL,
                        salario_cargo number(8,2))

insert into cargo values (1,'Senior',1000.00);


-- Juncao por equivalencia ou igualdade - Inner Join


desc cargo

select * from cargo;

--

drop table funcionario_cargo cascade CONSTRAINTS;
create table funcionario_cargo (mat_fun number(2) PRIMARY KEY,
                                nm_fun VARCHAR(20)not NULL,
                                cd_cargo REFERENCES cargo);

insert into funcionario_cargo values(10,'Maria',1);
commit;

select * from funcionario_cargo

-- Listar o nome do funcionario e o cargo (nome) que ele ocupa.
select nm_fun, nm_cargo from cargo
inner join funcionario_cargo on cargo.cd_cargo = funcionario_cargo.cd_cargo;

