--Importar a Definição da Tabela (Executar uma única vez)
--IMPORT TABLE BANCO ORACLE, Conecta o PostgreSQL ao Oracle criando uma tabela estrangeira
--IMPORT FOREIGN SCHEMA "DBAMV" LIMIT TO (registro_auditoria) FROM SERVER base_mv INTO mv;

--View de UP Abstração (Executar uma única vez)
--Cria uma VIEW para simplificar o acesso
/*
CREATE OR REPLACE VIEW bi_UP_registro_auditoria AS
(
SELECT
	*
FROM MV.registro_auditoria
);
*/

--PRIMEIRA CARGA(Executar uma única vez)
--Cria a tabela local e insere os dados históricos
--SELECT * INTO bi_registro_auditoria FROM bi_UP_registro_auditoria WHERE tz_registro_auditoria::date >= '2024-01-01'

--Criar o Índice (Executar uma única vez)
--Cria o índice na coluna de data após a carga inicial para otimizar as operações futuras
/*
CREATE INDEX idx_bi_reg_auditoria_tz
ON bi_registro_auditoria (tz_registro_auditoria);
*/

-- Script para ser executado em uma rotina (job)
-- A operação de DELETE agora será muito mais rápida graças ao índice criado
--Agendar a Carga Rotineira (Executar periodicamente, ex: diariamente) (TABELA FATO)
/*
DELETE FROM BI_registro_auditoria
WHERE tz_registro_auditoria::date >= (SELECT DATE_TRUNC('month', current_date - interval '3' month);
INSERT INTO BI_registro_auditoria
SELECT * FROM bi_UP_registro_auditoria
WHERE tz_registro_auditoria::date >= (SELECT DATE_TRUNC('month', current_date - interval '3' month);
*/
