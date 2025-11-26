-- Lista 05 - Funções agregadas (COUNT(), SUM(), AVG(), MIN(), MAX()) e group by 
--1) Liste cada categoria e a quantidade total de produtos cadastrados nela.

select c.nome, count(*) as total_produtos
from produtos p, categorias c
where p.fk_categoria  = c.id
group by c.nome; 

-- 2) Liste cada fornecedor e a soma total dos estoques (quantidade) 
-- dos produtos fornecidos por ele.
select f.nome, SUM(p.quantidade) as total_produtos
from produtos p, fornecedores f 
where p.fk_fornecedor   = f.id
group by f.nome order by total_produtos; 

-- 3) Para cada categoria, mostre o preço médio dos produtos.
select c.nome, AVG(p.preco) as media_preço
from produtos p, categorias c
where p.fk_categoria  = c.id
group by c.nome; 


-- 4) Para cada fornecedor, mostre o menor preço encontrado entre os 
-- produtos que ele fornece.
select f.nome as fornecedor,  MIN(p.preco) as menor_preço
from produtos p, fornecedores f
where p.fk_fornecedor  = f.id
group by f.nome; 

SELECT 
    f.nome AS fornecedor,
    p.nome AS produto_mais_barato,
    p.preco AS menor_preco
FROM produtos p, fornecedores f
WHERE p.fk_fornecedor = f.id
  AND p.preco = (
      SELECT MIN(preco) 
      FROM produtos 
      WHERE fk_fornecedor = f.id
  );


-- 5)Mostre para cada categoria o maior preço encontrado e a quantidade de 
-- produtos cadastrados nela.

select c.nome, MAX(p.preco) as maior_preço, COUNT(*) as total_produtos
from produtos p, categorias c
where p.fk_categoria  = c.id
group by c.nome; 





