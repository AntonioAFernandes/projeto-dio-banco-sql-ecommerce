-- Dados fictícios, criados usando o ChatGPT para propósito de testes.
-- Inserções adicionais na tabela Cliente
INSERT INTO Cliente (Fname, MiddleName, Surname, CPF, Address, BirthDate)
VALUES
  ('Ana', 'L', 'Santos', '23456789012', 'Rua da Paz, 456', '1992-12-10'),
  ('Pedro', 'F', 'Oliveira', '34567890123', 'Avenida Central, 789', '1988-06-25'),
  ('Mariana', 'D', 'Silva', '45678901234', 'Rua das Árvores, 101', '1995-09-30'),
  ('José', 'C', 'Pereira', '56789012345', 'Rua da Praia, 222', '1997-04-15'),
  ('Isabela', 'A', 'Fonseca', '67890123456', 'Avenida do Sol, 333', '1987-03-20'),
  ('Rafael', 'S', 'Gomes', '78901234567', 'Rua das Estrelas, 777', '1993-11-05'),
  ('Sofia', 'S', 'Oliveira', '89012345678', 'Avenida da Lua, 888', '1990-08-18');

-- Inserções adicionais na tabela Orders
INSERT INTO Orders (idOrderClient, orderStatus, orderDescription, sendValue, Shipping, paymentCash)
VALUES
  (4, 'Processing', 'Pedido 4 - Móveis', 500.00, 25.00, false),
  (3, 'Confirmed', 'Pedido 5 - Alimentos', 75.00, 10.00, true),
  (2, 'Processing', 'Pedido 6 - Brinquedos', 120.00, 8.50, false),
  (1, 'Sent', 'Pedido 7 - Eletrônicos', 300.00, 20.00, true),
  (5, 'Delivered', 'Pedido 8 - Roupas', 250.00, 15.00, true),
  (6, 'Cancelled', 'Pedido 9 - Eletrônicos', 180.00, 12.00, false),
  (7, 'Confirmed', 'Pedido 10 - Móveis', 700.00, 30.00, true);

-- Inserções adicionais na tabela Product
INSERT INTO Product (Pname, Classification_Kids, Category, Rating, Size, PDescription, Price)
VALUES
  ('Televisor', false, 'Electronic', 4.2, '55 inches', 'TV de alta definição', 1499),
  ('Calça Jeans', false, 'Clothing', 4.7, 'L', 'Calça jeans de qualidade', 39.99),
  ('Boneca', true, 'Toys', 4.8, '12 inches', 'Boneca infantil', 19.99),
  ('Micro-ondas', false, 'Electronic', 4.5, '30 liters', 'Micro-ondas moderno', 249),
  ('Sapato de Couro', false, 'Clothing', 4.4, '40', 'Sapato de couro elegante', 79.99),
  ('Carrinho de Controle Remoto', true, 'Toys', 4.6, '1:18 scale', 'Carrinho de brinquedo', 29.99),
  ('Laptop', false, 'Electronic', 4.9, '15 inches', 'Laptop de alto desempenho', 999);

-- Inserções adicionais na tabela Payment
INSERT INTO Payment (idClient, idPayment, paymentMethods, availableLimit)
VALUES
  (4, 4, 'Cartão', 3000.00),
  (5, 5, 'Boleto', 750.00),
  (6, 6, 'Pix', 1500.00),
  (7, 7, 'Dois Cartões', 2000.00);

-- Inserções adicionais na tabela Stock
INSERT INTO Stock (Place, Amount)
VALUES
  ('Depósito D', 600),
  ('Depósito E', 700),
  ('Depósito F', 850),
  ('Depósito G', 400),
  ('Depósito H', 550),
  ('Depósito I', 900),
  ('Depósito J', 750);

-- Inserções adicionais na tabela Supplier
INSERT INTO Supplier (CompanyName, TradingName, CNPJ, ContactNumber)
VALUES
  ('Fornecedor Móveis', 'Móveis Ltda.', '11223344556600', '1122334466'),
  ('Fornecedor Alimentos', 'Food S/A', '99887766554411', '9988776644'),
  ('Fornecedor Calçados', 'Shoes Inc.', '11223344556622', '1122334466'),
  ('Fornecedor Brinquedos', 'Toys World', '11223344556633', '1122334466'),
  ('Fornecedor Eletrodomésticos', 'Eletro S/A', '11223344556644', '1122334466'),
  ('Fornecedor Roupas', 'Fashion Outlet', '11223344556655', '1122334466'),
  ('Fornecedor Eletrônicos', 'Eletronics Ltda.', '11223344556666', '1122334466');

-- Inserções adicionais na tabela Seller
INSERT INTO Seller (CompanyName, TradingName, CNPJ, CPF, Location, ContactNumber)
VALUES
  ('Loja Móveis', 'Móveis Store', '11223344556677', NULL, 'Rua dos Móveis, 123', '1122334466'),
  ('Loja Alimentos', 'Food Market', '99887766554488', NULL, 'Avenida dos Alimentos, 456', '9988776644'),
  ('Loja Calçados', 'Shoes World', '11223344556699', NULL, 'Rua dos Sapatos, 789', '1122334466'),
  ('Loja Brinquedos', 'Toys Store', '11223344556610', NULL, 'Avenida dos Brinquedos, 101', '1122334466'),
  ('Loja Eletrodomésticos', 'Eletro Outlet', '11223344556611', NULL, 'Rua dos Eletrodomésticos, 222', '1122334466'),
  ('Loja Roupas', 'Fashion Store', '11223344556612', NULL, 'Avenida das Roupas, 333', '1122334466'),
  ('Loja Eletrônicos', 'Eletronics Shop', '11223344556613', NULL, 'Rua dos Eletrônicos, 444', '1122334466');

-- Inserções adicionais na tabela productSeller
INSERT INTO productSeller (idPSeller, idProduct, Amount)
VALUES
  (4, 4, 20),
  (5, 5, 30),
  (6, 6, 15),
  (7, 7, 25),
  (1, 1, 40),
  (2, 2, 50),
  (3, 3, 10);

-- Inserções adicionais na tabela productStock
INSERT INTO productStock (idPStock, idProduct, Stock)
VALUES
  (4, 4, 60),
  (5, 5, 75),
  (6, 6, 45),
  (7, 7, 80),
  (1, 1, 70),
  (2, 2, 90),
  (3, 3, 25);

-- Inserções adicionais na tabela productOrder
INSERT INTO productOrder (idPOproduct, idPOorder, poAmount)
VALUES
  (4, 4, 5),
  (5, 5, 3),
  (6, 6, 10),
  (7, 7, 7),
  (1, 1, 8),
  (2, 2, 12),
  (3, 3, 6);

-- Inserções adicionais na tabela storageLocation
INSERT INTO storageLocation (idLproduct, idLstorage, Location)
VALUES
  (4, 4, 'Prateleira 4'),
  (5, 5, 'Prateleira 5'),
  (6, 6, 'Prateleira 6'),
  (7, 7, 'Prateleira 7'),
  (1, 1, 'Prateleira 8'),
  (2, 2, 'Prateleira 9'),
  (3, 3, 'Prateleira 10');

-- Inserções adicionais na tabela productSupplier
INSERT INTO productSupplier (idPSupplier, idPProduct, Amount)
VALUES
  (4, 4, 150),
  (5, 5, 200),
  (6, 6, 100),
  (7, 7, 250),
  (1, 1, 180),
  (2, 2, 220),
  (3, 3, 90);
