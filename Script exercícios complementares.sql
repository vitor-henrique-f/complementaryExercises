-- Criação da tabela "funcionario"

create table funcionario(
id_funcionario int primary key,
nome varchar(20) not null,
sobrenome varchar(50) not null,
salario integer(250) default 0 
);

-- Adição de coluna na tabela "funcionario" 

alter table funcionario
add dataNascimento date not null;

-- Criação da tabela "departamento"

create table departamento(
id_departamento int primary key,
nome varchar(30) not null
);

-- Adição da coluna "idDepartamento" na tabela "funcionario"

alter table funcionario
add idDepartamento int not null;

alter table funcionario
add constraint fk_idDepartamento
foreign key (idDepartamento) references departamento (id_departamento);

-- Criação da tabela "projeto"

create table projeto(
id_projeto int primary key,
nomeProjeto varchar(30)
);

-- Criação da tabela "alocacoes"
 
create table alocacao(
id_alocacao int primary key,
idFuncionario int not null,
idProjeto int not null
);

alter table alocacao
add constraint fk_idFuncionario
foreign key (idFuncionario) references funcionario (id_funcionario);

alter table alocacao
add constraint fk_idProjeto
foreign key (idProjeto) references projeto (id_projeto);

-- Renomear coluna "sobrenome" da tabela "funcionario"

alter table funcionario
rename column sobrenome to apelido;

-- Criação da tabela "cliente"

create table cliente(
id_cliente int primary key,
nomeCliente varchar(50) not null
);

-- Criação da coluna "idCliente" na tabela "projeto"

alter table projeto
add idCliente int not null;

alter table projeto
add constraint fk_idCliente
foreign key (idCliente) references cliente (id_cliente);

-- Criação da tabela "endereço"

create table endereço(
id_endereço int primary key,
rua varchar(40) not null,
cidade varchar(30) not null,
cep int not null
);

-- Criação da coluna "idEndereço" na tabela "Funcionario"

alter table funcionario
add idEndereço int not null;

alter table funcionario
add constraint fk_idEndereço
foreign key (idEndereço) references endereço (id_endereço);

-- Renomear coluna "nomeCliente" da tabela "cliente"

alter table cliente
rename column nomeCliente to nomeEmpresa;

-- Criação da tabela "pedido"

create table pedido(
id_pedido int primary key,
dataPedido date
);

-- Criação da coluna "idCliente" na tabela "pedido"

alter table pedido
add idCliente int not null;

alter table pedido
add constraint fk_idCliente
foreign key (idCliente) references cliente (id_cliente);

-- Criação da tabela "produto"

create table produto(
id_produto int primary key,
nomeProduto varchar(20) not null,
preçoProduto int not null
);

-- Criação da tabela "itensPedido"

create table itensPedido(
id_itensPedido int primary key,
idPedido int not null,
idProduto int not null
);

alter table itensPedido
add constraint fk_idPedido
foreign key (idPedido) references pedido (id_itensPedido);

alter table itensPedido
add constraint fk_idProduto
foreign key (idProduto) references produto (id_produto);

-- Renomear coluna "nomeProduto" da tabela "produto"

alter table produto
rename column nomeProduto to descricaoProduto;

-- Criação da tabela "estoques"

create table estoques(
id_estoques int primary key,
quantidade int not null
);

-- Criação da tabela "venda"

create table venda(
id_venda int primary key,
dataVenda date
);

-- Criação da coluna "idCliente" na tabela "venda"

alter table venda
add column idCliente int not null;

alter table venda
add constraint fk_idCliente
foreign key (idCliente) references cliente (id_cliente);


