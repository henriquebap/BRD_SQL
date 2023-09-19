drop table veiculo CASCADE CONSTRAINTS;
drop table veic_serv CASCADE CONSTRAINTS;
drop table servico CASCADE CONSTRAINTS;

CREATE TABLE veiculo (placa VARCHAR(7),
                        cor varchar(20),
                        marca VARCHAR(30));

CREATE TABLE servico (id_ser number(3),
                        nm_ser VARCHAR(30),
                        pr_ser number(10,2));

CREATE TABLE veic_serv (tempo number(3),
                        dt_inicio date);

ALTER TABLE veiculo ADD CONSTRAINT veic_placa_pk PRIMARY KEY (placa);
ALTER TABLE servico ADD PRIMARY KEY (id_ser);


ALTER TABLE veic_serv ADD fk_placa VARCHAR(7)
CONSTRAINT vs_placa_fk REFERENCES veiculo;
ALTER TABLE veic_serv ADD fk_ser number(3) REFERENCES servico;

INSERT INTO veiculo values ('AAA1AAA','AZUL','CIVIC');
INSERT INTO veiculo VALUES ('123456A','Preto','Golf');
INSERT INTO servico VALUES (1, 'Funilaria', 1000);
INSERT INTO servico VALUES (2, 'Pintura', 1200);
INSERT INTO veic_serv VALUES (100, SYSDATE,'AAA1AAA',1);
INSERT INTO veic_serv VALUES (100, SYSDATE,'AAA1AAA',2);
COMMIT;


UPDATE veiculo set cor = 'Vermelho' WHERE placa = 'AAA1AAA';
UPDATE veiculo SET marca = 'VW' WHERE placa = 'AAA1AAA';

ALTER TABLE servico MODIFY nm_ser VARCHAR(100);