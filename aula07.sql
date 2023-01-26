--AULA 7:
CREATE OR REPLACE VIEW cw_bancos AS(
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo FROM cw_bancos;

CREATE OR REPLACE VIEW cw_bancos_plus (banco_numero, banco_nome, banco_ativo) AS(
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo FROM cw_bancos_plus;

INSERT INTO cw_bancos_plus (banco_numero, banco_nome, banco_ativo) 
VALUES  ('53', 'Banco numero 1', TRUE);


SELECT banco_numero, banco_nome, banco_ativo FROM cw_bancos_plus
WHERE banco_numero = '51';

SELECT numero, nome, ativo FROM cw_bancos
WHERE numero = '51';

UPDATE cw_bancos_plus SET banco_ativo= FALSE WHERE banco_numero = '51';

DELETE FROM cw_bancos_plus WHERE banco_numero = '51';

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);
SELECT nome from vw_agencia;

CREATE OR REPLACE VIEW vw_bancos_at AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS true
);

INSERT INTO vw_bancos_at (numero, nome, ativo) VALUES ('5443', 'Banco numero 1', FALSE);

CREATE OR REPLACE VIEW vw_bancos_2 AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_at
	WHERE nome ILIKE 'a%'
) WITH LOCAL CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_2;

INSERT INTO vw_bancos_2 (numero, nome, ativo) VALUES ('55', 'a Unique Banco ', TRUE);

INSERT INTO vw_bancos_2 (numero, nome, ativo) VALUES ('56', 'a Unique Banco ', FALSE);

INSERT INTO vw_bancos_2 (numero, nome, ativo) VALUES ('572', 'a Unique Banco ', TRUE);
DROP TABLE funcs;
CREATE TABLE IF NOT EXISTS funcs(
	id SERIAL,
	nome VARCHAR(50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcs(id)
);

INSERT INTO funcs (nome, gerente) VALUES ('Chico'	, null);
INSERT INTO funcs (nome, gerente) VALUES ('Zico'  	, 1);
INSERT INTO funcs (nome, gerente) VALUES ('Chiquita', 1);
INSERT INTO funcs (nome, gerente) VALUES ('Cheresa' , 2);

SELECT id, nome, gerente FROM funcs WHERE gerente IS NULL
UNION ALL
SELECT id, nome, gerente FROM funcs WHERE id = 23;

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, func, gerente) AS (
	SELECT id, nome, gerente
	FROM funcs
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcs.id,  funcs.nome, funcs.gerente
	FROM funcs
	JOIN vw_func ON vw_func.id = funcs.gerente
);

SELECT id, gerente, func FROM vw_func;