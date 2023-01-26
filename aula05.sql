
--AULA 5:

SELECT count(1) FROM banco;
SELECT count(1) FROM agencia;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT COUNT(DISTINCT banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- LEFT JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

-- RIGHT JOIN INVERTIDO = LEFT JOIN
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome,
FROM agencia
RIGHT JOIN banco ON  banco.numero = agencia.banco_numero;

-- RIGHT JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
RIGHT JOIN agencia ON agencia.banco_numero = banco.numero;

-- FULL JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

-- CROSS JOIN
CREATE TABLE IF NOT EXISTS teste_a (id serial primary key, valor varchar(10));
CREATE TABLE IF NOT EXISTS teste_b (id serial primary key, valor varchar(10));

INSERT INTO teste_a (valor) VALUES ('abc');
INSERT INTO teste_a (valor) VALUES ('abc');
INSERT INTO teste_a (valor) VALUES ('abc');
INSERT INTO teste_a (valor) VALUES ('abb');

INSERT INTO teste_b (valor) VALUES ('def');
INSERT INTO teste_b (valor) VALUES ('dee');
INSERT INTO teste_b (valor) VALUES ('abc');
INSERT INTO teste_b (valor) VALUES ('dff');

SELECT tba.valor, tbb.valor FROM teste_a tba
CROSS JOIN teste_b tbb;

-- Acima: "apelido" da tabela.

-- JOIN NA PRÁTICA

SELECT 	banco.nome,
		agencia.nome,
		conta_corrente.numero, conta_corrente.digito, 
		cliente.nome
FROM banco
JOIN agencia 
	ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero;
	
