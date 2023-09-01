-- criação do banco de dados para o conário de E-commerce

-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabelas

-- cliente

CREATE TABLE Cliente (
  idClient INT NOT NULL AUTO_INCREMENT,
  Fname VARCHAR(15),
  MiddleName CHAR(3),
  Surname VARCHAR(15),
  CPF CHAR(11) NOT NULL,
  Address VARCHAR(80),
  BirthDate DATE NOT NULL,
  PRIMARY KEY (idClient),
  CONSTRAINT unique_cpf_client UNIQUE (CPF)
  );
-- desc Cliente;

ALTER TABLE Cliente AUTO_INCREMENT = 1;
-- pedido

CREATE TABLE Orders (
  idOrder INT NOT NULL AUTO_INCREMENT,
  idOrderClient INT,
  orderStatus ENUM('Confirmed', 'Processing', 'Sent', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Processing',
  orderDescription VARCHAR(255) NULL,
  sendValue FLOAT DEFAULT 10,
  Shipping FLOAT NULL,
  paymentCash BOOL DEFAULT false,
  PRIMARY KEY (idOrder, idOrderClient),
  CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) references Cliente (idClient)
	ON UPDATE CASCADE
  );
    
-- produto, size = dimensão do produto

CREATE TABLE Product (
  idProduct INT NOT NULL AUTO_INCREMENT,
  Pname VARCHAR(80) NOT NULL,
  Classification_Kids BOOL DEFAULT FALSE,
  Category ENUM('Electronic', 'Clothing', 'Toys', 'Food', 'Furniture') NOT NULL,
  Rating FLOAT DEFAULT 0,
  Size VARCHAR(12),
  PDescription VARCHAR(255),
  Price INT NOT NULL,
  PRIMARY KEY (idProduct)
  );
 -- desc Product;
  
  -- pagamentos, desafio: terminar tabela, conectar com tabelas necessárias, refletir modificação no diagrama
  
  CREATE TABLE Payment (
  idClient INT,
  idPayment INT,
  paymentMethods ENUM('Boleto', 'Cartão', 'Pix', 'Dois Cartões'),
  availableLimit FLOAT,
  PRIMARY KEY (idClient, idPayment),
  CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES Cliente (idClient)
  );
  
  -- estoque
  
  CREATE TABLE Stock (
  idStock INT NOT NULL AUTO_INCREMENT,
  Place VARCHAR(255),
  Amount INT NOT NULL DEFAULT 0, 
  PRIMARY KEY (idStock)
  );
  
  -- fornecedor
  
  CREATE TABLE Supplier (
  idSupplier INT AUTO_INCREMENT NOT NULL,
  CompanyName VARCHAR(45) NOT NULL,
  TradingName VARCHAR(45), 
  CNPJ CHAR(15) NOT NULL,
  ContactNumber CHAR(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (idSupplier),
  CONSTRAINT unique_cnpj_supplier UNIQUE (CNPJ)
  );
  
  -- vendedor
  
  CREATE TABLE Seller (
  idSeller INT AUTO_INCREMENT NOT NULL,
  CompanyName VARCHAR(45) NOT NULL,
  TradingName VARCHAR(45), 
  CNPJ CHAR(15),
  CPF CHAR(11),
  Location VARCHAR(255),
  ContactNumber CHAR(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (idSeller),
  CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
  CONSTRAINT unique_cpf_seller UNIQUE (CPF)
  );
  
CREATE TABLE productSeller (
idPSeller INT NOT NULL,
idProduct INT NOT NULL,
Amount INT NOT NULL DEFAULT 1,
PRIMARY KEY (idPSeller, idProduct),
CONSTRAINT fk_product_seller FOREIGN KEY (idPSeller) REFERENCES Seller (idSeller),
CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES Product (idProduct)
);

CREATE TABLE productStock (
idPStock INT NOT NULL,
idProduct INT NOT NULL,
Stock INT NOT NULL DEFAULT 1,
PRIMARY KEY (idPStock, idProduct, Stock),
CONSTRAINT fk_productStock_stock FOREIGN KEY (idPStock) REFERENCES Stock (idStock),
CONSTRAINT fk_productStock_product FOREIGN KEY (idProduct) REFERENCES Product (idProduct)
);

CREATE TABLE productOrder (
idPOproduct INT, 
idPOorder INT,
poAmount INT DEFAULT 1,
poStatus ENUM('Disponível', 'Sem Estoque') DEFAULT 'Disponível',
PRIMARY KEY (idPOproduct, idPOorder),
CONSTRAINT fk_productOrder_seller FOREIGN KEY (idPOproduct) REFERENCES Product (idProduct),
CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOorder) REFERENCES Orders (idOrder));

CREATE TABLE storageLocation (
idLproduct int,
idLstorage int,
Location VARCHAR(255) NOT NULL,
PRIMARY KEY (idLproduct, idLstorage),
CONSTRAINT fk_storageLocation_seller FOREIGN KEY (idLproduct) REFERENCES product (idProduct),
CONSTRAINT fk_storageLocation_product FOREIGN KEY (idLstorage) REFERENCES Orders (idOrder));
 
 CREATE TABLE productSupplier (
 idPSupplier INT,
 idPProduct INT, Amount INT NOT NULL,
 PRIMARY KEY (idPSupplier, idPProduct),
 CONSTRAINT fk_productSupplier_supplier FOREIGN KEY (idPSupplier) REFERENCES Supplier (idSupplier),
 CONSTRAINT fk_productSupplier_product FOREIGN KEY (idPProduct) REFERENCES Product (idProduct)
 );
 
 -- show tables;
 -- show databases;