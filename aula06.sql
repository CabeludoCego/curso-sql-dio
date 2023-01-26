--AULA 6:
	
WITH tbl_tmp_1 AS(
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome
FROM tbl_tmp_1;

WITH params AS(
	SELECT 213 AS banco_numero
), tbl_tmp_1 AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome 
FROM tbl_tmp_1;

SELECT banco.numero, banco.nome
FROM banco 
JOIN(
	SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero;

WITH cli_tra AS (
SELECT 	cliente.nome AS cliente_nome,
		tipo_transacao.nome AS transacao_nome,
		cliente_transacoes.valor AS valor
	FROM cliente_transacoes
	JOIN CLIENTE on CLIENTE.NUMERO = cliente_transacoes.cliente_Numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero 
		AND banco.nome ILIKE '%Itaú%'
) 
SELECT cliente_nome, transacao_nome, valor
FROM cli_tra;