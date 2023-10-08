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

-- Funções Numéricas:
-- a) Crie uma tabela produtos
CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

-- Insira dados na tabela produtos
INSERT INTO produtos (produto, preco, quantidade)
VALUES("Varal", 14.50, 5), ("Carrinho de controle remoto", 75.88, 16);

-- b) Utilize a função ROUND() para arredondar os preços para 2 casas decimais.
SELECT produto, ROUND(preco, 2) FROM produtos;

-- c) Use a função ABS() para exibir o valor absoluto das quantidades.
SELECT produto, ABS(quantidade) FROM produtos;

-- d) Calcule a média dos preços dos produtos utilizando a função AVG().
SELECT AVG(preco) AS media_preco FROM produtos;

-- Funções de Data:
-- a) Crie uma tabela eventos com uma coluna data_evento contendo algumas datas.
CREATE TABLE eventos (
    data_evento DATE
);

-- Insira dados na tabela eventos
INSERT INTO eventos (data_evento) VALUES ('2023-12-10');

-- b) Utilize a função NOW() para inserir a data e hora atual em uma nova linha.
INSERT INTO eventos (data_evento) VALUES (NOW());

-- c) Use a função DATEDIFF() para calcular o número de dias entre duas datas.
SELECT DATEDIFF(data_evento, '2023-01-01') AS dias_desde_inicio FROM eventos;

-- d) Utilize a função DAYNAME() para exibir o nome do dia da semana de cada evento.
SELECT data_evento, DAYNAME(data_evento) AS nome_dia_semana FROM eventos;

-- Funções de Controle de Fluxo:
-- a) Em sua tabela produtos, use a função IF() para determinar se um produto está "Em estoque" ou "Fora de estoque" baseado na quantidade.
SELECT produto,
       IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

-- b) Use a função CASE para classificar os produtos em categorias de preço: "Barato", "Médio" e "Caro".
SELECT produto,
       CASE
           WHEN preco <= 50 THEN 'Barato'
           WHEN preco <= 100 THEN 'Médio'
           ELSE 'Caro'
       END AS categoria_preco
FROM produtos;
