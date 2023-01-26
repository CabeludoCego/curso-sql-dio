
--AULA 3:

SELECT numero, nome, ativo FROM banco;
SELECT numero, nome FROM agencia;

SELECT * from cliente;

CREATE TABLE IF NOT EXISTS teste (
	cpf VARCHAR(50) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (cpf)
);

--DROP TABLE IF EXISTS teste;
INSERT INTO teste(cpf, nome,created_at) 
VALUES ('0001112223332', 'Jose Dichssz', '2020-10-01 11:00:00') ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome = 'Jose Joestar' WHERE cpf = '00011122233'; 