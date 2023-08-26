use ecommerce;

-- Preenche tabela Cliente
INSERT INTO Cliente
VALUES(1, 'Lucas Simoes', 'Rua São Caetano, 551', '1989-12-27', 1, 0, '39595264822', NULL),
(2, 'Vitor Jeremias', 'Rua Verona, 100', '1989-12-28', 1, 0, '12345678901', NULL),
(3, 'Alcir Dorigatti', 'Rua Carlos Burgos, 200', '1989-11-27', 1, 0, '12345678902', NULL),
(4, 'Bruno Grou', 'Rua Juscelino Kubitsheck, 300', '1989-10-27', 1, 0, '12345678903', NULL),
(5, 'Lucas Vido', 'Rua Genova, 116', '1989-09-27', 1, 0, '12345678904', NULL),
(6, 'Rosana Maria Barassa', 'Rua 04, 10', '1990-12-27', 1, 0, '12345678905', NULL),
(7, 'João Augusto Simões', 'Rua Ytaipu, 156,', '1991-12-27', 1, 0, '12345678906', NULL),
(8, 'Rafael Louzada', 'Rua Traituba, 614', '1988-12-27', 1, 0, '12345678907', NULL),
(9, 'Luis Henique Simões', 'Rua Jabaquara, 12', '1987-12-27', 1, 0, '12345678908', NULL),
(10, 'Calabroza S.A', 'Rua Avanhandava, 12', '2000-12-27', 0, 1, '12345678908987', NULL),
(11, 'Fundinvest', 'Rua Silva, 12', '2021-12-27', 0, 1, '12345678908988', 'Fundo de Investimento ltda.'),
(12, 'Venda do Marcos', 'Rua Acbdef, 12', '2007-12-27', 0, 1, '12345678908989', 'Marcos supermercado ltda.'),
(13, 'Academia AbcFit', 'Rua Qwertyu, 12', '2009-12-27', 0, 1, '12345678908980', 'Centro de esportes s.a.');

-- Preenche tabela Vendedor
INSERT INTO Vendedor
VALUES(1, '98765432101478', 'Loja 1 - 98765432101478','Loja 199', 'Rua Florinda, 12','loja199@gmail.com'),
(2, '98765432101479', 'Loja 2 - 98765432101479','Lucas Moda Masculina', 'Rua Jussara, 192','lucas.modamasculina@gmail.com'),
(3, '98765432101470', 'Loja 3 - 98765432101470','Ohana Store', 'Rua Juventus, 1999','ohanastore@gmail.com'),
(4, '98765432101475', 'Loja 4 - 98765432101475','Otica 123', 'Rua México, 10','otica123@gmail.com'),
(5, '98765432101473', 'Loja 5 - 98765432101473','Bike Parts', 'Rua Estoril, 15','bikeparts@gmail.com');

-- Preenche tabela Fornecedor
INSERT INTO Fornecedor
VALUES (1, 'brutus s.a.','Brutus bike','74185296315987'),
(2, 'Marco Fonseca s.a.','Auto parts','74185296315988'),
(3, 'Pedro e Bino ltda.','Carro e Moto peças','74185296315989'),
(4, 'Rosana ltda','Pedreira Louças','74185296315980'),
(5, 'Henriete ltda','Advanted Textil','74185296315981'),
(6, 'Foroni s.a.','Super Clothes','74185296315982');

-- Preenche tabela Produto
INSERT INTO Produto
VALUES (1, 'Bicicleta Aro 29','Bicicletas', 3000, 'True', 1),
(2, 'Pneu Aro 29','Peças Bicicleta', 200, 'false', 1),
(3, 'Câmbio Traseiro Shimano','Peças Bicicleta', 300, 'True', 1),
(4, 'Escapamento','Peças carros', 600, 'false', 2),
(5, 'Volante', 'Peças carros', 250, 'True', 2),
(6, 'Tampo porta-mala', 'Peças carros',180 , 'True', 3),
(7, 'Jogo de talher Tramontina', 'Utensílio Doméstico',199 , 'True', 4),
(8, 'Jogo de panelas Rochedo', 'Utensílio Doméstico', 599 , 'True', 4),
(9, 'Vaso Cerâmica 1.5m', 'Decoração',199 , 'True', 4),
(10, 'Calça Jeans 38', 'Moda Feminina', 89.99, 'True', 5),
(11, 'Vestido Longo G', 'Moda Feminina', 139.99, 'True', 5),
(12, 'Camiseta Baby Look M', 'Moda Feminina', 39.99, 'True', 6),
(13, 'Calça Jeans 42', 'Moda Masculina', 89.99, 'True', 6),
(14, 'Casaco Preto G', 'Moda Masculina', 139.99, 'True', 6),
(15, 'Camiseta Estampada M', 'Moda Masculina', 39.99, 'True', 6);

-- Preenche tabela Pedido
INSERT INTO Pedido
VALUES (1, '2023-01-02', '2023-01-02', 'Cancelado', 'Pedido peças de bicicleta', 3300, 0, 1, 1),
(2, '2023-02-02', '2023-02-05', 'Processando', 'Pedido peças de bicicleta', 300, 12.5, 5, 1),
(3, '2023-02-10', '2023-02-10', 'Processando', 'Pedido peças de carro', 430, 0, 4, 2),
(4, '2023-03-15', '2023-03-15', 'Enviado', 'Pedido loja de louças', 199, 13, 12, 4),
(5, '2023-03-23', '2023-03-26', 'Enviado', 'Pedido loja de louças', 599, 0, 12, 4),
(6, '2023-05-02', '2023-05-02', 'Concluído', 'Pedido loja de roupas', 229.98, 0, 6, 5),
(7, '2023-06-03', '2023-06-03', 'Concluído', 'Pedido loja de roupas', 39.99, 8, 13, 5),
(8, '2023-06-07', '2023-06-07', 'Concluído', 'Pedido loja de roupas', 89.99, 9, 13, 5);

-- Preenche tabela ItensPedido
INSERT INTO itensPedido
VALUES (1, 1, 1, 3000),
(1, 3, 1, 300),
(2, 3, 1, 300),
(3, 5, 1, 250),
(3, 6, 1, 180),
(4, 7, 1, 199),
(5, 8, 1, 599),
(6, 10, 1, 89.99),
(6, 11, 1, 139.99),
(7, 12, 1, 39.99),
(8, 10, 1, 89.99);

-- Preenche tabela FormaPagamento
INSERT INTO FormaPagamento
VALUES(1, 'Boleto'),
(2, 'Cartão de Crédito'),
(3, 'Pix');

-- Preenche tabela Pagamento
INSERT INTO Pagamento
VALUES (1, '2023-01-02', 3300,'Não Autorizado', 1, 1),
(2, '2023-02-05', 312.5,'Processando', 2, 2),
(3, '2023-02-10', 430,'Não Autorizado', 3, 3),
(4, '2023-03-15', 212,'Aprovado', 2, 4),
(5, '2023-03-26', 599,'Aprovado', 2, 5),
(6, '2023-05-02', 229.98,'Processando', 2, 6),
(7, '2023-06-03', 47.99,'Aprovado', 3, 7),
(8, '2023-06-07', 98.99,'Processando', 3, 8);

-- Preenche tabela Entrega
INSERT INTO Entrega
VALUES (1, 'Rua Acbdef, 12', 'Q4564VRWEVEE12BR', 'Enviado - Em Trânsito', '2023-03-16', NULL, 4),
(2, 'Rua Acbdef, 12', 'Q5467JF233BGG12BR', 'Entregue', '2023-03-27', '2023-03-30', 5),
(3, 'Rua Qwertyu, 12', NULL, 'Preparando para envio', NULL, NULL, 7);