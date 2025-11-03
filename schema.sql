CREATE DATABASE cafeteria_db;

CREATE TABLE Produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco > 0),
    categoria VARCHAR(50) NOT NULL 
);

CREATE TABLE Pedidos (
    id_pedido SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente'
);

CREATE TABLE ItensPedido (
    id_item_pedido SERIAL PRIMARY KEY,
    
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    
    quantidade INT NOT NULL CHECK (quantidade > 0),
    
    CONSTRAINT fk_pedido
        FOREIGN KEY(id_pedido) 
        REFERENCES Pedidos(id_pedido)
        ON DELETE CASCADE, 
    
    CONSTRAINT fk_produto
        FOREIGN KEY(id_produto) 
        REFERENCES Produtos(id_produto)
        ON DELETE RESTRICT 
);

INSERT INTO Produtos (nome, descricao, preco, categoria)
VALUES
    ('Espresso Duplo', 'Café forte e encorpado', 7.50, 'Bebida Quente'),
    ('Cappuccino', 'Espresso, leite vaporizado e espuma', 12.00, 'Bebida Quente'),
    ('Pão de Queijo', 'Porção com 3 unidades', 9.00, 'Comida'),
    ('Suco de Laranja', 'Natural, 500ml', 10.00, 'Bebida Fria');

INSERT INTO Pedidos (nome_cliente, status)
VALUES
    ('Ana Silva', 'Concluído'),
    ('Bruno Costa', 'Em preparo'),
    ('Carla Mendes', 'Pendente');

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade)
VALUES
    (1, 2, 1),
    (1, 3, 1);

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade)
VALUES
    (2, 1, 2);

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade)
VALUES
    (3, 4, 1);
