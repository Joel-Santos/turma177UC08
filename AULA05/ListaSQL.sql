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

insert  into categorias (NOME)
values ('Super Luxo'), ('Importado'), ('Tecnologia'), 
('Vintage'), ('Supremo');

insert into fornecedores (NOME, RUA, CIDADE, ESTADO)
values 
('Ajax SA', 'Rua Presidente Castelo Branco', 'Porto Alegre',  'RS'),
('Sansul SA' ,'Av Brasil', 'Rio de Janeiro' , 'RJ'),
( 'South Chairs' ,'Rua do Moinho', 'Santa Maria' ,'RS'),
( 'Elon Electro', 'Rua Apolo', 'São Paulo' , 'SP'),
( 'Mike electro', 'Rua Pedro da Cunha', 'Curitiba', 'PR');


insert into produtos(NOME, QUANTIDADE, PRECO, fk_FORNECEDOR ,fk_CATEGORIA)
values
('Cadeira azul', 30,  300.00 ,5, 5),
('Cadeira vermelha', 50, 2150.00, 2, 1),
('Guarda-roupa Disney', 400, 829.50, 4, 1),
('Torradeira Azul', 20, 9.90, 3, 1),
('TV', 30,  3000.25,  2,  2);


-- 1. Crie uma regra para garantir que o nome de um 
-- produto seja único na tabela produtos
alter table produtos add 
constraint unique_nome_produto unique(nome);

-- 2. Defina uma constraint para garantir que o preço dos 
-- produtos nunca seja menor que zero.
alter table produtos 
add constraint check_preco check(preco>=0);

insert into produtos(NOME, QUANTIDADE, PRECO, fk_FORNECEDOR ,fk_CATEGORIA)
values
('Cadeira azul', 30,  -500 ,5, 5);


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

-- 9. ATUALIZE a tabela produtos, aumentando o preço do produto 
-- cujo id é 4, para R$ 298.00;
update produtos set preco = 298
where id = 4;


-- 10. RECUPERE da tabela produtos, todos os produtos do 
-- Fornecedor localizado no RS;
select * from produtos 
where fk_fornecedor = 1 or fk_fornecedor = 3;


-- 11. RECUPERE da tabela produtos, todos os produtos do Fornecedor 
-- localizado em SP;
select * from produtos 
where fk_fornecedor = 4;

-- 12. RECUPERE da tabela produtos e fornecedores o nome do 
-- produto mais caro e o nome do fornecedor deste produto;
select p.preco as preco_p, f.nome as nome_f
from produtos p, fornecedores f
where fk_fornecedor = f.id
order by preco desc
limit 1;


-- 13. ATUALIZE a tabela fornecedores, alterando a cidade 
-- para Parnamirim, o estado para RN e a Rua
-- para Abel Cabral, do Fornecedor cujo nome é Elon Electro;
update fornecedores set
cidade = 'Parnamirim', estado = 'RN', rua = 'Abel Cabral'
where nome = 'Elon Electro';


-- 14. ATUALIZE a tabela produtos, alterando o 
-- preço dos produtos em 10% de aumento, cujo fornecedor seja Sansul SA.

update produtos set preco  = preco * 1.10
where fk_fornecedor = 2;

-- 15. ATUALIZE a tabela produtos, alterando o preço dos produtos 
-- em 10% de diminuição, cujo fornecedor seja Mike electro 
-- e a categoria seja Supremo.
update produtos set preco = preco * 0.90
where fk_fornecedor = 5 and fk_categoria = 5;


-- 16. RECUPERE da tabela produtos, todos os produtos que tenham 
-- o preço entre 8 e 2.000, ordenados a partir do maior preço.
select * from  produtos 
where preco > 8 and preco < 2000 
order by preco desc;


-- 17. RECUPERE da tabela produtos, todos os produtos que 
-- tenham o preço maior que 2.000,ordenados a partir do menor preço.

select * from produtos 
where preco > 2000 
order by preco;



-- 18. RECUPERE da tabela fornecedor, o nome de todos os fornecedores 
-- que iniciam com a letra A.
select * from fornecedores 
where UPPER(nome) like 'A%';

--19. RECUPERE da tabela fornecedor, o nome de todos 
 -- os fornecedores que contenham a letra S.

select nome from fornecedores 
where LOWER(nome) like '%s%';


-- 20. ATUALIZE a tabela produtos, aumentando em 15% a 
-- quantidade de produtos que tenham o preço inferior a 300.

update produtos set quantidade = quantidade * 1.15
where preco < 300;

-- 21. APAGUE da tabela produtos todos os produtos da categoria 5;
delete from produtos 
where fk_categoria = 5;


-- 22. RECUPERE da tabela fornecedores, todos os registros cadastrados;
select * from fornecedores;


-- 23. RECUPERE da tabela produtos, o nome dos produtos 
-- que iniciam com a letra T e tenham o preço acima de 400.

select nome from produtos 
where LOWER(nome) like 't%' and preco > 400;


-- 24. APAGUE a tabela produtos;
drop table produtos;












