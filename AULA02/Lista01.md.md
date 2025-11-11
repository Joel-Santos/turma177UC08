# 🧩 Lista de Exercícios – Modelagem de Dados no BRModelo

## 🎯 Objetivo Geral
Desenvolver a capacidade de analisar um contexto, identificar entidades, atributos e relacionamentos, e representar essas informações em um **Diagrama Entidade-Relacionamento (DER)** utilizando o **BRModelo**.

---

## 🧠 Questão 1 – Sistema de Biblioteca Comunitária

### 📘 Contexto
Uma pequena biblioteca de bairro deseja informatizar o controle de seus livros e empréstimos. Ela precisa registrar quais livros possui, quem são os leitores e quais empréstimos foram realizados.

### ⚙️ Regras de Negócio
- Cada **livro** possui título, autor, editora e ano de publicação.  
- Um **leitor** pode pegar vários livros emprestados.  
- Um **empréstimo** deve registrar **data de retirada** e **data de devolução prevista**.  
- Um livro só pode estar em um empréstimo ativo por vez.  



---

## 🧠 Questão 2 – Sistema de Clínica Odontológica

### 🦷 Contexto
Uma clínica odontológica quer gerenciar seus pacientes, dentistas e consultas. O sistema ajudará a organizar o agendamento e o histórico dos atendimentos.

### ⚙️ Regras de Negócio
- Cada **paciente** possui nome, CPF, telefone e endereço.  
- Cada **dentista** possui nome, CRO (registro profissional) e especialidade.  
- Um paciente pode realizar várias consultas.  
- Cada consulta deve ter **data**, **hora**, **dentista responsável** e **descrição do procedimento**.  



---

## 🧠 Questão 3 – Sistema de Loja de Informática

### 💻 Contexto
Uma loja de informática quer manter o controle de seus produtos, fornecedores e vendas realizadas.

### ⚙️ Regras de Negócio
- Cada **produto** tem nome, marca, preço e quantidade em estoque.  
- Cada **fornecedor** pode fornecer vários produtos.  
- Cada **venda** é feita a um **cliente** e pode conter vários produtos.  
- A **venda** deve registrar **data**, **valor total** e **forma de pagamento**.  
- A **tabela de itens da venda** deve conter **quantidade** e **preço unitário** do produto vendido.  


---

## 🧠 Questão 4 – Sistema de Escola de Idiomas

### 🏫 Contexto
Uma escola oferece cursos de diferentes idiomas e deseja controlar os professores, alunos e as turmas criadas.

### ⚙️ Regras de Negócio
- Cada **curso** tem um idioma, carga horária e nível (básico, intermediário, avançado).  
- Cada **professor** pode ministrar várias turmas, mas cada turma tem apenas um professor.  
- Um **aluno** pode estar matriculado em várias turmas.  
- Cada **turma** pertence a um curso e tem **data de início** e **data de término**.  


---

## 🧠 Questão 5 – Sistema de Reservas em um Hotel

### 🏨 Contexto
Um hotel deseja controlar suas reservas, hóspedes e quartos. Cada hóspede pode fazer diversas reservas, e cada quarto pode ser reservado várias vezes (em datas diferentes).

### ⚙️ Regras de Negócio
- Cada **hóspede** tem nome, CPF, telefone e e-mail.  
- Cada **quarto** tem número, tipo (simples, duplo, suíte) e valor da diária.  
- Uma **reserva** liga um hóspede a um quarto e registra **data de entrada**, **data de saída** e **valor total**.  
- O sistema deve permitir registrar múltiplas reservas para o mesmo hóspede, mas nunca duas reservas no mesmo quarto com **datas sobrepostas**.  



---
