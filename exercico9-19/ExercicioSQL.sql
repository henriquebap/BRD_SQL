DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE vendedor CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;

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

