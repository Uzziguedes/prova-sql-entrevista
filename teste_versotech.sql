CREATE TABLE EMPRESA (
id_empresa int primary key,
razao_social varchar(255), 
inativo boolean
);

CREATE TABLE PRODUTOS (
id_produto int primary key,
descricao varchar(255), 
inativo boolean
);

CREATE TABLE VENDEDORES (
id_vendedor int primary key,
nome varchar(255), 
cargo varchar(150),
salario float,
data_admissao date,
inativo boolean
);

CREATE TABLE CONFIG_PRECO_PRODUTO (
id_config_preco_produto int primary key,
id_vendedor int,
id_empresa int,
id_produto int,
preco_minimo float,
preco_maximo float,

constraint fk_vendedor_produto foreign key(id_vendedor) references VENDEDORES(id_vendedor),
constraint fk_empresa_produto foreign key(id_empresa) references EMPRESA(id_empresa),
constraint fk_produto_produto foreign key(id_produto) references PRODUTOS(id_produto)
);

CREATE TABLE CLIENTES (
id_cliente int primary key,
razao_social varchar(255),
data_cadastro date,
id_vendedor int,
id_empresa int,
inativo boolean,

constraint fk_vendedor_clientes foreign key(id_vendedor) references VENDEDORES(id_vendedor),
constraint fk_empresa_clientes foreign key(id_empresa) references EMPRESA(id_empresa)
);

CREATE TABLE PEDIDO (
id_pedido int primary key,
id_empresa int,
id_cliente int,
valor_total float,
data_emissao date,
situacao int, --1 = Normal, 2 = Processado 3 = Inadimplente

constraint fk_empresa_pedido foreign key(id_empresa) references EMPRESA(id_empresa),
constraint fk_cliente_pedido foreign key(id_cliente) references CLIENTES(id_cliente)
);

CREATE TABLE ITENS_PEDIDO (
id_item_pedido int primary key,
id_pedido int,
id_produto int,
preco_praticado float,
quantitade int,

constraint fk_pedido_ITENS_PEDIDO foreign key(id_pedido) references PEDIDO(id_pedido),
constraint fk_produto_ITENS_PEDIDO foreign key(id_produto) references PRODUTOS(id_produto)
)
INSERT INTO PRODUTOS(id_produto,descricao, inativo) 
values
(1,'Violão', true),
(2,'Guitarra', true),
(3,'Baixo', true),
(4,'Bateria', true),
(5,'Cajon', true),
(6,'Teclado', true),
(7,'Microfone', true),
(8,'Microfone KZ', false);

INSERT INTO EMPRESA(id_empresa, razao_social, inativo)
VALUES
(1, 'MULTISOM', true),
(2, 'YAMAHA', true),
(3, 'TAGIMA', true);

INSERT INTO VENDEDORES(id_vendedor, nome, cargo, salario, data_admissao, inativo)
VALUES
(1,'Paulo', 'Gerente', 15000,'2006-07-20', true),
(2,'Diovana', 'CFO', 25000,'2005-01-27', true),
(3,'Uzzi', 'DBA', 10000,'2010-06-03', true),
(4,'Marcelo', 'Vendedor júnior', 3000,'2013-07-10', true),
(5,'Luiz', 'Vendedor Sênior', 5000,'2010-03-12', true),
(6,'João', 'Vendedor Pleno', 4000,'2012-12-12', false);

INSERT INTO CLIENTES(id_cliente, razao_social, data_cadastro, id_vendedor, id_empresa, inativo)
VALUES
(1, 'Mendes e Mendez Advogados', '2022-01-01', 4, 1, true),
(2, 'Guitar Escola LTDA', '2022-02-01', 4, 1, true),
(3, 'Música pra ti - projeto', '2022-03-01', 4, 3, true),
(4, 'Somos todos campeões', '2022-03-05', 5, 1, true),
(5, 'Souza e Santos', '2022-03-10', 5, 2, true),
(6, 'Amazon do Brasil', '2022-04-07', 5, 3, true),
(7, 'Magazine Luiza', '2022-05-14', 5, 3, true),
(8, 'João Exportações', '2022-06-01', 6, 1, false),
(9, 'Amazon do rasil', '2022-01-01', 5, 3, false),
(10, 'Luthier Carlos', '2024-07-03', 4, 1, true);

INSERT INTO PEDIDO(id_pedido, id_empresa, id_cliente, valor_total, data_emissao, situacao)
VALUES
(1,1,1,1000, '2024-02-01', 1),
(2,1,1,2000, '2024-03-01', 2),
(3,1,2,100, '2024-04-01', 3), 
(4,2,3,200, '2024-05-01', 1),
(5,2,4,300, '2024-06-01', 1);

INSERT INTO ITENS_PEDIDO(id_item_pedido, id_pedido, id_produto, preco_praticado, quantidade)
VALUES
(1, 1, 1, '500.70',1),
(2, 1, 2, '499.30',2),
(3, 2, 3, 2000,4),
(4, 3, 4, 100,2),
(5, 4, 5, 200,1),
(6, 5, 6, 50,2),
(7, 5, 7, 100,2),
(8, 5, 2, 50,1);

INSERT INTO CONFIG_PRECO_PRODUTO(	id_config_preco_produto, 
									id_vendedor, 
									id_empresa, 
									id_produto, 
									preco_minimo, 
									preco_maximo
								)
values
(1, 4, 1, 1,450,550),
(2, 4, 1, 2,400,500),
(3, 4, 1, 3,1900,2100),
(4, 4, 1, 4,100,200),
(5, 4, 1, 5,150,210),
(6, 4, 1, 6,20,57),
(7, 4, 1, 7,30,200),
(8, 4, 1, 8,45,55),
(9, 5, 1, 1,450,550),
(10, 5, 1, 2,400,500),
(11, 5, 1, 3,1900,2100),
(12, 5, 1, 4,100,200),
(13, 5, 1, 5,150,210),
(14, 5, 1, 6,20,57),
(15, 5, 1, 7,30,200),
(16, 5, 1, 8,45,55),
(17, 6, 1, 1,450,550),
(18, 6, 1, 2,400,500),
(19, 6, 1, 3,1900,2100),
(20, 6, 1, 4,100,200),
(21, 6, 1, 5,150,210),
(22, 6, 1, 6,20,57),
(23, 6, 1, 7,30,200),
(24, 6, 1, 8,45,55),
(25, 4, 2, 1,450,550),
(26, 4, 2, 2,400,500),
(27, 4, 2, 3,1900,2100),
(28, 4, 2, 4,100,200),
(29, 4, 2, 5,150,210),
(30, 4, 2, 6,20,57),
(31, 4, 2, 7,30,200),
(32, 4, 2, 8,45,55),
(33, 5, 2, 1,450,550),
(34, 5, 2, 2,400,500),
(35, 5, 2, 3,1900,2100),
(36, 5, 2, 4,100,200),
(37, 5, 2, 5,150,210),
(38, 5, 2, 6,20,57),
(39, 5, 2, 7,30,200),
(40, 5, 2, 8,45,55),
(41, 6, 2, 1,450,550),
(42, 6, 2, 2,400,500),
(43, 6, 2, 3,1900,2100),
(44, 6, 2, 4,100,200),
(45, 6, 2, 5,150,210),
(46, 6, 2, 6,20,57),
(47, 6, 2, 7,30,200),
(48, 6, 2, 8,45,55),
(49, 4, 3, 1,450,550),
(50, 4, 3, 2,400,500),
(51, 4, 3, 3,1900,2100),
(52, 4, 3, 4,100,200),
(53, 4, 3, 5,150,210),
(54, 4, 3, 6,20,57),
(55, 4, 3, 7,30,200),
(56, 4, 3, 8,45,55),
(57, 5, 3, 1,450,550),
(58, 5, 3, 2,400,500),
(59, 5, 3, 3,1900,2100),
(60, 5, 3, 4,100,200),
(61, 5, 3, 5,150,210),
(62, 5, 3, 6,20,57),
(63, 5, 3, 7,30,200),
(64, 5, 3, 8,45,55),
(65, 6, 3, 1,450,550),
(66, 6, 3, 2,400,500),
(67, 6, 3, 3,1900,2100),
(68, 6, 3, 4,100,200),
(69, 6, 3, 5,150,210),
(70, 6, 3, 6,20,57),
(71, 6, 3, 7,30,200),
(72, 6, 3, 8,45,55);

--Lista de funcionários ordenando pelo salário decrescente.
SELECT 
	nome as nome_funcionario,
	salario
	
FROM vendedores 
ORDER BY salario desc;

--Lista de pedidos de vendas ordenado por data de emissão.
SELECT
	id_pedido as pedido_de_venda,
	data_emissao
FROM pedido
ORDER BY data_emissao asc;

--Valor de faturamento por cliente.
SELECT
	cli.razao_social as cliente,
	sum(pedido.valor_total) as vl_faturamento
FROM pedido
	
LEFT JOIN clientes as cli
ON pedido.id_cliente = cli.id_cliente

GROUP BY 1
ORDER BY 2 desc;

--Valor de faturamento por empresa.
SELECT
	emp.razao_social as empresa,
	sum(pedido.valor_total) as vl_faturamento
FROM pedido
	
LEFT JOIN empresa as emp
ON pedido.id_empresa = emp.id_empresa

GROUP BY 1
ORDER BY 2 desc;

--Valor de faturamento por vendedor.
SELECT
	vend.nome as vendedor,
	sum(pedido.valor_total) as vl_faturamento
FROM pedido
	
LEFT JOIN clientes as cli
ON pedido.id_cliente = cli.id_cliente

LEFT JOIN vendedores as vend
ON cli.id_vendedor = vend.id_vendedor
GROUP BY 1
ORDER BY 2 desc;

SELECT
	prod.id_produto,
	prod.descricao as descricao_produto,
	cli.id_cliente,
	cli.razao_social as razao_social_cliente,
	emp.id_empresa,
	emp.razao_social as razao_social_empresa,
	vend.id_vendedor,
	vend.nome as nome_vendedor,
	config_pp.preco_minimo,
	config_pp.preco_maximo,
	i_ped.preco_praticado,
	CASE
		WHEN 
			i_ped.preco_praticado < config_pp.preco_minimo OR
			i_ped.preco_praticado > config_pp.preco_maximo THEN config_pp.preco_minimo
		ELSE i_ped.preco_praticado
	END preco_base
	
FROM produtos as prod

LEFT JOIN itens_pedido as i_ped
ON prod.id_produto = i_ped.id_produto

LEFT JOIN pedido as ped
ON i_ped.id_pedido = ped.id_pedido

LEFT JOIN clientes as cli
ON ped.id_cliente = cli.id_cliente

LEFT JOIN vendedores as vend
ON cli.id_vendedor = vend.id_vendedor

LEFT JOIN empresa as emp
ON ped.id_empresa = emp.id_empresa
	
LEFT JOIN config_preco_produto as config_pp
ON  prod.id_produto = config_pp.id_produto
AND vend.id_vendedor = config_pp.id_vendedor
AND emp.id_empresa = config_pp.id_empresa
