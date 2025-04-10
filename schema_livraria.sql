-- Arquivo: schema_livraria.sql
-- Descrição: Script para criação das tabelas e inserção de dados
--            para o sistema de uma livraria.

-- --- Criação das Tabelas ---

-- Tabela de Clientes
-- Armazena informações sobre os clientes da livraria.
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único para cada cliente (auto-gerado)
    nome VARCHAR(100) NOT NULL,                -- Nome completo do cliente
    email VARCHAR(100) UNIQUE NOT NULL,        -- Email do cliente (deve ser único)
    telefone VARCHAR(20)                       -- Telefone do cliente (opcional)
);

-- Tabela de Produtos (Livros)
-- Armazena informações sobre os livros disponíveis.
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único para cada produto (auto-gerado)
    titulo VARCHAR(150) NOT NULL,              -- Título do livro
    autor VARCHAR(100),                        -- Autor do livro (opcional)
    preco DECIMAL(10, 2) NOT NULL,             -- Preço do livro (ex: 99.90)
    estoque INT DEFAULT 0                      -- Quantidade em estoque (padrão 0 se não informado)
);

-- Tabela de Pedidos
-- Armazena informações sobre os pedidos realizados pelos clientes.
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,    -- Identificador único para cada pedido (auto-gerado)
    cliente_id INT NOT NULL,                     -- Chave estrangeira referenciando o cliente que fez o pedido
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora em que o pedido foi feito (padrão: agora)
    valor_total DECIMAL(10, 2) NOT NULL,         -- Valor total do pedido
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) -- Garante a integridade referencial com a tabela Clientes
);

-- --- Inserção de Dados Iniciais ---

-- Inserir Clientes
INSERT INTO Clientes (nome, email, telefone) VALUES
('Ana Silva', 'ana.silva@email.com', '11987654321'),
('Bruno Costa', 'bruno.costa@email.com', '21912345678'),
('Carla Dias', 'carla.dias@email.com', '31999998888');

-- Inserir Produtos
INSERT INTO Produtos (titulo, autor, preco, estoque) VALUES
('A Arte da Guerra', 'Sun Tzu', 25.50, 50),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 35.00, 100),
('Dom Casmurro', 'Machado de Assis', 42.90, 30);

-- Inserir Pedidos
INSERT INTO Pedidos (cliente_id, valor_total) VALUES
(1, 60.50), -- Pedido da Ana (ID 1)
(2, 35.00), -- Pedido do Bruno (ID 2)
(1, 42.90); -- Outro pedido da Ana (ID 1)

-- Fim do script --
