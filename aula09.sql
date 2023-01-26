--AULA 9 e final

CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT 
LANGUAGE SQL
AS $$
	SELECT COALESCE($1,1) + COALESCE($2, 1);
$$;

SELECT func_somar(51,null);
SELECT COALESCE(null,'sugawar', null,'daniel', 'diguin');

--------------------------------------------------

CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
	DECLARE variavel_id INTEGER;
	BEGIN
		IF p_nome IS NULL OR p_ativo IS NULL OR p_numero IS NULL THEN
			RETURN 0;
		END IF;
		SELECT INTO variavel_id numero
		FROM banco
		WHERE numero = p_numero;
		
		IF variavel_id IS NULL THEN
			INSERT INTO banco(numero, nome, ativo)
			VALUES (p_numero, p_nome, p_ativo);
		ELSE
			RETURN variavel_id;
		END IF;
		
		SELECT INTO variavel_id numero
		FROM banco
		WHERE numero = p_numero;
		RETURN variavel_id;
	END
$$;

SELECT bancos_add(5433, 'Mesa Verde Holdings', FALSE);

SELECT bancos_add(5453, FALSE, null);
SELECT bancos_add(5454, null,FALSE);

SELECT numero, nome, ativo FROM banco WHERE numero = 5433;
