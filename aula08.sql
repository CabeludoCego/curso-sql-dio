--AULA 8:

SELECT numero, nome, ativo FROM banco ORDER BY numero;
UPDATE banco SET ativo=false WHERE numero=0;

BEGIN;

UPDATE banco SET ativo=true WHERE numero=0;

SELECT numero, nome, ativo FROM banco WHERE numero=0;
ROLLBACK;

--SAVEPOINT state0;

--ROLLBACK TO state0;

COMMIT;

SELECT id, nome, gerente FROM funcs;

BEGIN;

UPDATE funcs SET gerente=1 WHERE id=3;
SAVEPOINT if1;

UPDATE funcs SET gerente=null;
ROLLBACK TO if1;

UPDATE funcs SET gerente=3 WHERE id=4;
COMMIT;


