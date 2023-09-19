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

ALTER TABLE veiculo ADD CONSTRAINTS veic_placa_pk PRIMARY KEY (placa);
ALTER TABLE servico ADD PRIMARY KEY (id_ser);


