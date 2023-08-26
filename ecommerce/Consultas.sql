use ecommerce;

-- Número de pedidos realizados por cliente
SELECT DISTINCT
CASE
	WHEN PessoaFisica = 1 THEN 'Sim'
    ELSE 'Não'
END AS PessoaFisica
,c.nome Nome
,COUNT(p.idPedido) Pedidos

FROM Pedido p
	LEFT JOIN Cliente c
		ON C.idCliente = p.idCliente

GROUP BY PessoaFisica, c.nome
ORDER BY PessoaFisica, c.nome;

-- Algum vendedor também é fornecedor?
SELECT DISTINCT
v.nomeFantasia Nome
,CASE
	WHEN f.idFornecedor IS NULL THEN 'Não'
    ELSE 'Sim'
END AS VendedorFornecedor
FROM
	Vendedor v
		LEFT JOIN Fornecedor f
			ON v.CNPJ = f.CNPJ
ORDER BY Nome;

-- Relação de produtos, fornecedores e estoque
SELECT distinct
f.NomeFantasia Nome
,p.Descricao Produto
,CASE
	WHEN p.EmEstoque = 'True' THEN 'Sim'
    ELSE 'Não'
END AS EmEstoque

FROM 
	Produto p
		JOIN Fornecedor f
			ON f.idFornecedor = p.idFornecedor

ORDER BY Nome, Produto;

-- Pedidos com mais de 1 forma de pagamento
SELECT
p.idPedido Pedido
,COUNT(pg.idFormaPagamento) FormaPagamento

FROM 
	Pedido p
		JOIN Pagamento pg
			ON Pg.idPedido = p.idPedido
GROUP BY Pedido
HAVING FormaPagamento >=2;

-- Relação Pedidos x Itens
SELECT DISTINCT
p.idPedido Pedido
,pt.Descricao

FROM
	Pedido p
		JOIN ItensPedido ip
			ON ip.idPedido = p.idPedido
		JOIN Produto pt
			ON pt.idProduto = ip.idProduto
ORDER BY Pedido, Descricao;