-- Funções de String:
-- a) Crie uma tabela nomes
CREATE TABLE nomes (
    nome VARCHAR(50)
);
INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

-- b) Utilize a função UPPER() para converter todos os nomes para maiúsculas.
SELECT UPPER(nome) FROM nomes;

-- c) Use a função LENGTH() para determinar o tamanho de cada nome.
SELECT nome, LENGTH(nome) FROM nomes;

-- d) Use a função CONCAT() para adicionar "Sr. " antes dos nomes masculinos e "Sra. " antes dos nomes femininos.
SELECT 
    CASE 
        WHEN nome LIKE '%a' THEN CONCAT('Sra. ', nome)
        ELSE CONCAT('Sr. ', nome)
    END AS nome_com_tratamento
FROM nomes;
