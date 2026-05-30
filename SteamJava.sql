CREATE DATABASE IF NOT EXISTS gamestore;

USE gamestore;

CREATE TABLE IF NOT EXISTS plataforma (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS jogo (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(100)   NOT NULL,
    preco         DECIMAL(10,2)  NOT NULL,
    estoque       INT            NOT NULL DEFAULT 0,
    id_plataforma INT            NOT NULL,
    id_categoria  INT            NOT NULL,
    FOREIGN KEY (id_plataforma) REFERENCES plataforma(id),
    FOREIGN KEY (id_categoria)  REFERENCES categoria(id)
);

CREATE TABLE IF NOT EXISTS cliente (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS pedido (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente   INT         NOT NULL,
    data_pedido  DATE        NOT NULL,
    status       VARCHAR(20) NOT NULL DEFAULT 'pendente',
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS item_pedido (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido      INT           NOT NULL,
    id_jogo        INT           NOT NULL,
    quantidade     INT           NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_jogo)   REFERENCES jogo(id)
);

CREATE TABLE IF NOT EXISTS pagamento (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido      INT         NOT NULL UNIQUE,
    metodo         VARCHAR(30) NOT NULL,
    status         VARCHAR(20) NOT NULL DEFAULT 'aguardando',
    data_pagamento DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);

CREATE TABLE IF NOT EXISTS entrega (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido    INT         NOT NULL UNIQUE,
    tipo         VARCHAR(30) NOT NULL,
    codigo_chave VARCHAR(100) DEFAULT NULL,
    data_entrega DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);

INSERT INTO plataforma (nome) VALUES
('Computador'),
('iOS'),
('Android'),
('Nintendo'),
('PS5'),
('Xbox Series S');

INSERT INTO categoria (nome) VALUES
('RPG'),
('MMORPG'),
('Souls Like'),
('Ação'),
('Aventura'),
('Esporte');

INSERT INTO jogo (nome, preco, estoque, id_plataforma, id_categoria) VALUES
('darque sols', 19.99, 12, 6, 3),
('fefa 3016', 500.00, 4, 5, 6);

INSERT INTO cliente (nome, email) VALUES
('Vitor Iury', 'mangadura@email.com'),
('Matias Mateus', 'gragaslindao@email.com'),
('Amo Marcelo da Silva', 'amomuitomarcelo@email.com');

SELECT id AS id_cliente FROM cliente WHERE email = 'mangadura@email.com';


INSERT INTO pedido (id_cliente, data_pedido, status) VALUES
(1, CURDATE(), 'pendente');
SELECT LAST_INSERT_ID() AS id_pedido_criado;


INSERT INTO item_pedido (id_pedido, id_jogo, quantidade, preco_unitario) VALUES
(1, 2, 12, 14.00);
UPDATE jogo SET estoque = estoque - 12 WHERE id = 2;

INSERT INTO pagamento (id_pedido, metodo, status, data_pagamento) VALUES
(1, 'pix', 'aprovado', CURDATE());
UPDATE pedido SET status = 'pago' WHERE id = 1;

INSERT INTO entrega (id_pedido, tipo, codigo_chave, data_entrega) VALUES
(1, 'chave_ativacao', NULL, CURDATE());
UPDATE pedido SET status = 'entregue' WHERE id = 1;

SELECT
    j.nome      AS jogo,
    j.preco,
    j.estoque,
    p.nome      AS plataforma,
    c.nome      AS categoria
FROM jogo j
JOIN plataforma p ON j.id_plataforma = p.id
JOIN categoria  c ON j.id_categoria  = c.id
ORDER BY j.nome;

SELECT
    pe.id           AS pedido,
    cl.nome         AS cliente,
    pe.data_pedido,
    pe.status
FROM pedido pe
JOIN cliente cl ON pe.id_cliente = cl.id
ORDER BY pe.data_pedido DESC;


SELECT
    j.nome                                  AS jogo,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario)     AS subtotal
FROM item_pedido ip
JOIN jogo j ON ip.id_jogo = j.id
WHERE ip.id_pedido = 1;

SELECT
    j.nome                                      AS jogo,
    p.nome                                      AS plataforma,
    SUM(ip.quantidade)                          AS total_vendido,
    SUM(ip.quantidade * ip.preco_unitario)      AS receita_total
FROM item_pedido ip
JOIN jogo       j  ON ip.id_jogo        = j.id
JOIN pedido     pe ON ip.id_pedido      = pe.id
JOIN plataforma p  ON j.id_plataforma   = p.id
WHERE pe.status != 'cancelado'
GROUP BY j.id, j.nome, p.nome
ORDER BY total_vendido DESC;

SELECT
    j.nome      AS jogo,
    p.nome      AS plataforma,
    j.estoque   AS estoque_restante
FROM jogo j
JOIN plataforma p ON j.id_plataforma = p.id
WHERE j.estoque <= 5
ORDER BY j.estoque ASC;

SELECT
    p.nome                                      AS plataforma,
    SUM(ip.quantidade * ip.preco_unitario)      AS receita_total,
    SUM(ip.quantidade)                          AS jogos_vendidos
FROM item_pedido ip
JOIN jogo       j  ON ip.id_jogo        = j.id
JOIN plataforma p  ON j.id_plataforma   = p.id
JOIN pedido     pe ON ip.id_pedido      = pe.id
WHERE pe.status != 'cancelado'
GROUP BY p.id, p.nome
ORDER BY receita_total DESC;

SELECT
    cl.nome                                     AS cliente,
    COUNT(DISTINCT pe.id)                       AS total_pedidos,
    SUM(ip.quantidade * ip.preco_unitario)      AS total_gasto
FROM cliente cl
JOIN pedido      pe ON pe.id_cliente = cl.id
JOIN item_pedido ip ON ip.id_pedido  = pe.id
WHERE pe.status != 'cancelado'
GROUP BY cl.id, cl.nome
ORDER BY total_gasto DESC;

SHOW TABLES;

DESCRIBE plataforma;
DESCRIBE categoria;
DESCRIBE jogo;
DESCRIBE cliente;
DESCRIBE pedido;
DESCRIBE item_pedido;
DESCRIBE pagamento;
DESCRIBE entrega;


SELECT 'plataforma'  AS tabela, COUNT(*) AS total FROM plataforma
UNION ALL
SELECT 'categoria',              COUNT(*) FROM categoria
UNION ALL
SELECT 'jogo',                   COUNT(*) FROM jogo
UNION ALL
SELECT 'cliente',                COUNT(*) FROM cliente
UNION ALL
SELECT 'pedido',                 COUNT(*) FROM pedido
UNION ALL
SELECT 'item_pedido',            COUNT(*) FROM item_pedido
UNION ALL
SELECT 'pagamento',              COUNT(*) FROM pagamento
UNION ALL
SELECT 'entrega',                COUNT(*) FROM entrega;


SELECT j.id, j.nome AS jogo_sem_plataforma
FROM jogo j
LEFT JOIN plataforma p ON j.id_plataforma = p.id
WHERE p.id IS NULL;


SELECT j.id, j.nome AS jogo_sem_categoria
FROM jogo j
LEFT JOIN categoria c ON j.id_categoria = c.id
WHERE c.id IS NULL;

SELECT
    pe.id           AS pedido,
    cl.nome         AS cliente,
    pe.data_pedido,
    pe.status
FROM pedido pe
JOIN cliente   cl ON pe.id_cliente = cl.id
LEFT JOIN pagamento pg ON pg.id_pedido = pe.id
WHERE pg.id IS NULL;

SELECT
    pe.id           AS pedido,
    cl.nome         AS cliente,
    pe.data_pedido
FROM pedido pe
JOIN cliente cl ON pe.id_cliente = cl.id
LEFT JOIN entrega en ON en.id_pedido = pe.id
WHERE pe.status = 'pago'
  AND en.id IS NULL;