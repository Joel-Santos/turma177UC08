-- Questã0 01

CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS servicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tipo_servico VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tecnicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    data_contratacao DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS chamados (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    tecnico_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_chamado DATE NOT NULL,
    status VARCHAR(20) NOT null,
    descricao TEXT NOT NULL,
    CONSTRAINT fk_chamado_cliente
        FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_chamado_tecnico
        FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_chamado_servico
        FOREIGN KEY (servico_id) REFERENCES servicos(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pagamentos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    chamado_id INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,

    CONSTRAINT fk_pag_cliente
        FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_pag_chamado
        FOREIGN KEY (chamado_id) REFERENCES chamados(id)
        ON DELETE CASCADE
);


-- Questão 02
ALTER TABLE servicos
ADD CONSTRAINT chk_servicos_preco CHECK (preco > 0);

ALTER TABLE servicos
ADD CONSTRAINT chk_servicos_tipo CHECK 
(tipo_servico IN ('Consultoria', 'Suporte', 'Manutenção'));

ALTER TABLE chamados
ADD CONSTRAINT chk_chamados_status
    CHECK (status IN ('Pendente', 'Em Andamento', 'Finalizado'));

ALTER TABLE pagamentos
ADD CONSTRAINT chk_pagamentos_valor
    CHECK (valor_pago > 0);
