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