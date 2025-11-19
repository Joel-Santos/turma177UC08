create database aula;

CREATE TABLE IF NOT EXISTS GENERO (
    ID SERIAL PRIMARY KEY,
    NOME VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS ARTISTA (
    ID SERIAL PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS MUSICA (
    ID SERIAL PRIMARY KEY,
    TITULO VARCHAR(255) NOT NULL,
    ANO INT NOT NULL,
    FK_GENERO INT NOT NULL,
    FK_ARTISTA INT NOT NULL,
    CONSTRAINT fr_genero FOREIGN KEY (FK_GENERO) REFERENCES GENERO(ID),
    CONSTRAINT fr_artista FOREIGN KEY (FK_ARTISTA) REFERENCES ARTISTA(ID)
);

insert into genero (nome)
values ('Pop'), ('Rock Alternativo'), ('Funk');

insert into artista(nome)
values ('The Weeknd'), ('Imagine Dragons'), ('Anitta');

insert into musica (titulo, ano, fk_genero, fk_artista)
values ('Blinding Lights', 2019, 1, 1), ('Believer', 2017, 2, 2), ('Show das Poderosas', 2013, 3, 3);

select * from musica

-- 1) Liste todos os gêneros cadastrados.
select * from genero;

-- 2) Liste apenas o nome dos artistas.
select nome from artista;

-- 3) Liste o título de todas as músicas.
select titulo from musica;

-- 4) Liste todos os dados das músicas do gênero com id = 1.
select * from musica where fk_genero = 1;

-- 5) Liste todas as músicas do artista com id = 3.
select * from musica where fk_artista = 3;

-- 6) Liste os gêneros ordenados pelo nome em ordem crescente.
select * from genero order by nome;  

-- 7) Liste os artistas ordenados pelo nome em ordem decrescente.
select * from artista order by nome desc;  

-- 8) Liste as músicas cujo título contenha a palavra “show”.
select titulo from musica where LOWER(titulo) like '%show%';

-- 9) Liste todos os gêneros cujo nome tenha mais de 5 caracteres
select * from genero where length(nome) > 5; 

-- 10) Liste os títulos das músicas renomeando a coluna como nome_musica.
select titulo as nome_musica from musica;

-- 11) Liste os gêneros renomeando a tabela como g usando alias.
select g.nome from genero as g; 

-- 12) Insira um gênero chamado “Rock”.
insert into genero(nome) values ('Rock');

-- 13) Insira um artista chamado “Queen”.
insert into artista(nome) values('Queen');

-- 14) Insira três gêneros diferentes em um único comando.
insert into genero(nome)
values 
('Forró'), ('Sertanejo') , ('Brega');

-- 15) Insira uma música chamada “Bohemian Rhapsody” 
--  com artista e gênero correspondente.
insert into musica(titulo, ano, fk_artista, fk_genero)
values ('Bohemian Rhapsody', 1975, 4 , 4);


-- 16) Atualize o nome do gênero com ID = 3 para “Funk Carioca”.
update genero set nome = 'Funk Carioca'
where id = 3;

-- 17) Atualize o nome da música “Believer” para “Believer (Remastered)”.
update musica set titulo = 'Believer (Remastered)'
where titulo = 'Believer';

-- 18) Atualize o ano da música “Blinding Lights” para 2020.
update musica set ano = 2020 
where titulo = 'Blinding Lights';

-- 19) Altere o artista com ID = 3 para “Anitta (BR)” 
-- e o ano de estreia da música correspondente para 2014.
update artista set nome = 'Anitta (BR)' 
where id = 3;
update musica set ano = 2014
where id = 3;

-- 20) Aumente o ano de TODAS as músicas em +1 usando UPDATE.
update musica 
set ano = ano + 1;

-- 21) Adicione à tabela ARTISTA o campo: nacionalidade VARCHAR(40)
alter table artista  
add column nacionalidade varchar(40);

-- 22) Renomear o campo titulo da tabela MUSICA para nome
alter table musica 
rename column titulo to nome;

-- 23) Adicionar o campo duracao_segundos
-- na tabela MUSICA com valor default 0 e não nulo (int).
alter table musica 
add column duracao_segundos int not null default 0; 

-- 24) Adicionar CHECK garantindo ano > 1900
alter table musica 
add constraint chk_ano 
CHECK(ano > 1900);

-- 25) Criar uma música e verificar se o check está sendo aplicado.
insert into musica(nome, ano, fk_artista, fk_genero)
values('Águas de Março', 1972, 1, 4);

insert into musica(nome, ano, fk_artista, fk_genero)
values('Águas de abril', 1790, 1, 4);








