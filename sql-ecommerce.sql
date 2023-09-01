-- criacao do banco de dados para o cenario de e-commerce

create database ecommerce;

use ecommerce;
-- criar tabela cliente
create table client(
	idClient int auto_increment primary key,
    Fname varchar(20) not null,
    Minit char(3),
    Lname varchar(20) not null,
    CPF char(11),
    CNPJ char(15),
    Address varchar(100),
    constraint unique_client_cpf unique (CPF),
    constraint unique_client_cnpj unique (CNPJ),
    constraint chk_client_pf_pj check (CPF is null xor CNPJ is null)
);

-- cria tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contactInfo varchar(20) not null,
    constraint unique_supplier unique (CNPJ)
);

-- cria tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    contactInfo varchar(20) not null,
    address varchar(45),
    constraint unique_supplier_cnpj unique (CNPJ),
    constraint unique_supplier_cpf unique (CPF),
    constraint chk_seller_pf_pj check (CPF is null xor CNPJ is null)
);

-- criar tabela produto
	-- size = dimensoes do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(20) not null,
    Classification_kids bool default false,
    Category enum('Eletronico', 'Vestimenta', 'Alimentacao', 'Brinquedo', 'Moveis') not null,
    Rating Float default 0,
    Size varchar(15)
);

create table productSeller(
	idPSeller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- cria tabela pagamento
create table paymentMethod(
	idClient int,
    idPayment int,
    typePayment enum('Boleto', 'Cartao credito', 'Cartao Debito', 'Deposito/Transferencia'),
    methodData varchar(100),
    primary key(idClient, idPayment),
    constraint fk_payment_client foreign key (idClient) references client(idClient),
    constraint chk_payment_method check ((typePayment = 'Boleto' or typePayment = 'Deposito/Transferencia') xor methodData is not null)
);

-- criar tabela pedido
create table orderInfo(
	idOrder int auto_increment primary key,
    idClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    shippingFee float default 10,
    idPayment int,
    constraint fk_order_client foreign key (idClient) references client(idClient),
    constraint fk_order_payment foreign key (idClient,idPayment) references paymentMethod(idClient,idPayment)
);

-- cria table estoque
create table storage(
	idStorage int auto_increment primary key,
    location varchar(45) not null,
    amount int not null default 0
);

create table delivery(
  idDelivery int not null auto_increment,
  idOrder int not null,
  deliveryStatus enum('Aguardando envio','Em transito','Entregue') default 'Aguardando envio',
  trackingNumber char(15) default null,
  primary key (idDelivery),
  constraint unique_tracking_number unique (trackingNumber),
  constraint  fk_delivery_order FOREIGN KEY (idOrder) REFERENCES order_info(idOrder)
);

create table productSupplier(
	idProduct int not null,
    idSupplier int not null,
    primary key (idProduct, idSupplier),
    constraint fk_product_supplier_product foreign key (idProduct) references product(idProduct),
    constraint fk_product_supplier_supplier foreign key (idSupplier) references supplier(idSupplier)
);

create table productOrder(
	idProduct int not null,
    idOrder int not null,
    quantity int not null,
    productStatus enum('Disponivel', 'Fora de Estoque') default 'Disponivel',
    primary key (idProduct, idOrder),
    constraint fk_product_order_product foreign key (idProduct) references product(idProduct),
    constraint fk_product_order_order foreign key (idOrder) references orderInfo(idOrder)
);

create table productStorage(
	idProduct int not null,
    idStorage int not null,
    quantity int,
    primary key (idProduct, idStorage),
    constraint fk_product_storage_product foreign key (idProduct) references product(idProduct),
    constraint fk_product_storage_storage foreign key (idStorage) references storage(idStorage)
);

-- Exemplos de queries
-- Quantidade de pedidos por clientes
select c.idClient, concat(c.Fname, ' ', c.Minit, ' ',c.Lname) as 'Nome Cliente', count(distinct o.idOrder) as 'Quantidade de Pedidos' from client c 
	inner join orderInfo o 
    on c.idClient = o.idClient 
    group by c.idClient;
-- Vendedores que tambem sao fornecedores
select sell.idSeller, sell.socialName from seller sell 
	inner join supplier s 
    on s.CNPJ = sell.CNPJ;
-- Relacao de produtos, fornecedores e estoques
select p.Pname, s.socialName, sto.location from storage sto
	join product p
    join supplier s
    join productSupplier ps
    join productStorage psto
    on ps.idProduct = psto.idProduct and ps.idProduct = p.idProduct and s.idSupplier = ps.idSupplier and sto.idStorage = psto.idStorage
    order by ps.idProduct;
-- Relacao de nomes dos fornecedores e nomes dos produtos
select s.socialName, p.Pname from productSupplier ps 
	join product p 
    join supplier s 
    where ps.idProduct = p.idProduct and ps.idSupplier = s.idSupplier 
    order by s.socialName;
-- Relacao de produtos que possuem mais de 100 unidades no estoque
select p.Pname, psto.quantity from productStorage psto
    join product p  
    where psto.idProduct = p.idProduct
    having psto.quantity > 100
    order by p.Pname;    
    