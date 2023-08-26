-- Criação do banco de dados para o cenário do E-commerce

create database ecommerce;

use ecommerce;

-- criar tabela cliente
CREATE TABLE Cliente (
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
	DataNascimento DATE NOT NULL,
    PessoaFisica BOOL NOT NULL,
    PessoaJuridica BOOL NOT NULL,
    Documento VARCHAR(14) NOT NULL,
    RazaoSocial VARCHAR(30) NULL,    
    CONSTRAINT unique_documento UNIQUE(Documento),
    CONSTRAINT unique_razaoSocial UNIQUE(RazaoSocial),
    CONSTRAINT chk_cliente CHECK (PessoaFisica <> PessoaJuridica)
);

-- criar tabela fornecedor
CREATE TABLE Fornecedor (
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    NomeFantasia VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    CONSTRAINT unique_cnpj UNIQUE(CNPJ),
    CONSTRAINT unique_fornecedor UNIQUE(RazaoSocial)
);

-- criar tabela produto
CREATE TABLE Produto (
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL,
	Categoria VARCHAR(20) NOT NULL,
    Valor FLOAT NOT NULL,
    EmEstoque ENUM("True", "False") DEFAULT "True",
    idFornecedor int NOT NULL,
	idVendedor INT,
    CONSTRAINT fk_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(IdFornecedor) ON UPDATE CASCADE,
	CONSTRAINT fk_produto_vendedor FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor) ON UPDATE CASCADE,
    CONSTRAINT chk_valor CHECK (Valor > 0)
);

-- criar tabela FormaPagamento
CREATE TABLE FormaPagamento (
	idFormaPagamento INT AUTO_INCREMENT PRIMARY KEY,
	FormaPagamento ENUM("Boleto", "Cartão de Crédito", "Pix") NOT NULL
);

-- criar tabela Pagamento
CREATE TABLE Pagamento (
	idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    DataPagamento DATETIME NOT NULL,
    Valor FLOAT NOT NULL,
    StatusPagamento ENUM("Processando", "Aprovado", "Não Autorizado") DEFAULT "Processando",
    idFormaPagamento INT,
	idPedido INT,
    CONSTRAINT fk_formaPagamento FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento(idFormaPagamento) ON UPDATE CASCADE,
	CONSTRAINT fk_pagamento_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE,
    CONSTRAINT chk_pagamento_valor CHECK (Valor > 0)
);

-- criar tabela entrega
CREATE TABLE Entrega (
	idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    Endereco VARCHAR(100) NOT NULL,
    CodigoRastreio VARCHAR(45),
    StatusEnvio ENUM("Preparando para envio", "Enviado - Em Trânsito", "Entregue") DEFAULT "Preparando para envio",
    DataEnvio DATETIME,
    DataEntrega DATETIME,
	idPedido INT,
	CONSTRAINT unique_codigoRastreio UNIQUE(CodigoRastreio),
    CONSTRAINT chk_entrega_dataEntrega CHECK(DataEntrega >= DataEnvio OR DataEntrega IS NULL),
	CONSTRAINT fk_pagamento_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE
);

-- criar tabela vendedor
CREATE TABLE Vendedor (
	idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL,
    razaoSocial VARCHAR(45) NOT NULL,
    nomeFantasia VARCHAR(45),
    Endereco VARCHAR(30) NOT NULL,
	Email VARCHAR(45) NOT NULL,
    CONSTRAINT unique_vendedor UNIQUE(razaoSocial),
    CONSTRAINT unique_cnpj UNIQUE(CNPJ)
);

-- criar tabela pedido
CREATE TABLE Pedido (
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    DataCriado DATETIME NOT NULL,
    DataAtualizado DATETIME NOT NULL,
    pedidoStatus ENUM("Cancelado", "Confirmado", "Processando", "Enviado", "Concluído") NOT NULL,
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL,
    Frete FLOAT NOT NULL,
    idCliente INT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON UPDATE CASCADE,
    CONSTRAINT chk_pedido_valor CHECK(Valor > 0),
    CONSTRAINT chk_pedido_frete CHECK(Frete >= 0),
    CONSTRAINT chk_pedido_dataAtualizado CHECK(DataAtualizado >= DataCriado)
);

-- criar tabela itensPedido
CREATE TABLE ItensPedido (
	idPedido INT,
    idProduto INT,
    Quantidade INT NOT NULL,
    Valor FLOAT NOT NULL,
	CONSTRAINT chk_itensPedido_valor CHECK(Valor > 0),
    CONSTRAINT chk_itensPedido_quantidade CHECK(Quantidade > 0),
    CONSTRAINT fk_itensPedido_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE,
    CONSTRAINT fk_itensPedido_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON UPDATE CASCADE,
    CONSTRAINT pk_itensPedido PRIMARY KEY(idPedido, idProduto)
);