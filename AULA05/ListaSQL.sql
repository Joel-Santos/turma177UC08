-- Criação das Tabelas

CREATE TABLE IF NOT EXISTS Fornecedores (
ID SERIAL PRIMARY KEY,
NOME VARCHAR(255),
RUA VARCHAR(255),
CIDADE VARCHAR(255),
ESTADO CHAR(2)
);


CREATE TABLE IF NOT EXISTS Categorias (
 ID SERIAL PRIMARY KEY,
 NOME VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS Produtos (
 ID SERIAL PRIMARY KEY,
 NOME VARCHAR(255),
 QUANTIDADE INTEGER,
 PRECO NUMERIC(10, 2),
 FK_FORNECEDOR INTEGER,
 FK_CATEGORIA INTEGER,
 CONSTRAINT fk_fornecedor FOREIGN KEY (FK_FORNECEDOR) REFERENCES Fornecedores(id),
 CONSTRAINT fk_categoria FOREIGN KEY (FK_CATEGORIA) REFERENCES Categorias(id)
);



--Inserções 

insert  into categorias (ID, NOME)
values (1, 'Super Luxo'), (2, 'Importado'), (3, 'Tecnologia'), 
(4, 'Vintage'), (5, 'Supremo');

insert into fornecedores (id, NOME, RUA, CIDADE, ESTADO)
values 
(1, 'Ajax SA', 'Rua Presidente Castelo Branco', 'Porto Alegre',  'RS'),
(2, 'Sansul SA' ,'Av Brasil', 'Rio de Janeiro' , 'RJ'),
(3, 'South Chairs' ,'Rua do Moinho', 'Santa Maria' ,'RS'),
(4, 'Elon Electro', 'Rua Apolo', 'São Paulo' , 'SP'),
(5, 'Mike electro', 'Rua Pedro da Cunha', 'Curitiba', 'PR');


insert into produtos(id, NOME, QUANTIDADE, PRECO, fk_FORNECEDOR ,fk_CATEGORIA)
values
(1, 'Cadeira azul', 30,  300.00 ,5, 5),
(2, 'Cadeira vermelha', 50, 2150.00, 2, 1),
(3, 'Guarda-roupa Disney', 400, 829.50, 4, 1),
(4, 'Torradeira Azul', 20, 9.90, 3, 1),
(5, 'TV', 30,  3000.25,  2,  2);


-- 1. Crie uma regra para garantir que o nome de um 
-- produto seja único na tabela produtos
alter table produtos add 
constraint unique_nome_produto unique(nome);


-- 3. Implemente uma constraint que assegure 
-- que a coluna quantidade na tabela produtos nunca seja nula.
alter table produtos 
alter column quantidade set not null;

-- 4. Adicione uma constraint para garantir que o estado dos 
-- fornecedores sempre siga o padrão de duas letras, como "SP" ou "RJ".
alter table fornecedores 
add constraint check_estado check(estado ~ '^[A-Z]{2}$');

insert into fornecedores (NOME, RUA, CIDADE, ESTADO)
values 
('Ajax SANTOS', 'Rua Presidente Castelo Branco 666', 'Porto Alegre',  'R1')

-- 5. Crie uma constraint para que o nome das categorias na tabela categorias seja único.
alter table categorias 
add constraint unique_nome_categoria unique(nome); 


-- 6. INSERIR dados de 2 produtos de categoria 3 e qualquer fornecedor
insert into produtos(id, NOME, QUANTIDADE, PRECO, fk_FORNECEDOR ,fk_CATEGORIA)
values
(6, 'Cadeira preta', 30,  300.00 ,4, 3),(7, 'Cadeira rosa', 30,  300.00 ,3, 3);

-- 7. INSERIR dados de 2 fornecedores distintos, 
-- sendo do Estado do RN e outro do estado da PB;
insert into fornecedores (ID, NOME, RUA, CIDADE, ESTADO)
values 
(6, 'Senac RN', 'Av. Almirante Alexandrino de Alencar', 'Natal',  'RN'),
(7, 'Senac PB', 'Av. Almirante Alexandrino de Alencar', 'João Pessoa',  'PB');



-- 8. INSERIR dados de mais 1 categoria de nome Nacional
insert into categorias(nome)
values('China');


-- 14. ATUALIZE a tabela produtos, alterando o 
-- preço dos produtos em 10% de aumento, cujo fornecedor seja Sansul SA.

update produtos set preco  = preco * 1.10
where fk_fornecedor = 2;

-- 16. RECUPERE da tabela produtos, todos os produtos que tenham 
-- o preço entre 8 e 2.000, ordenados a partir do maior preço.
select * from  produtos 
where preco > 8 and preco < 2000 
order by preco desc;


--19. RECUPERE da tabela fornecedor, o nome de todos 
 -- os fornecedores que contenham a letra S.

select nome from fornecedores 
where LOWER(nome) like '%s%';


-- 20. ATUALIZE a tabela produtos, aumentando em 15% a 
-- quantidade de produtos que tenham o preço inferior a 300.

update produtos set quantidade = quantidade * 1.15
where preco < 300;


















