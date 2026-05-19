-- ============================================================
--  Minha Biblioteca — Script de criação do banco de dados
--  PostgreSQL
-- ============================================================

CREATE TABLE autores (
    id            SERIAL PRIMARY KEY,
    nome          VARCHAR(200) NOT NULL,
    nacionalidade VARCHAR(100)
);

CREATE TABLE generos (
    id   SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE editoras (
    id   SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

CREATE TABLE livros (
    id             SERIAL PRIMARY KEY,
    titulo         VARCHAR(300) NOT NULL,
    autor_id       INTEGER REFERENCES autores(id)  ON DELETE SET NULL,
    genero_id      INTEGER REFERENCES generos(id)  ON DELETE SET NULL,
    editora_id     INTEGER REFERENCES editoras(id) ON DELETE SET NULL,
    ano_publicacao INTEGER,
    paginas        INTEGER,
    formato        VARCHAR(10)  DEFAULT 'fisico',
    idioma         VARCHAR(50)  DEFAULT 'Português',
    lido           BOOLEAN      DEFAULT FALSE,
    data_inicio    DATE,
    data_fim       DATE,
    resenha        TEXT,
    created_at     TIMESTAMPTZ  DEFAULT NOW(),
    status         VARCHAR(20)  DEFAULT 'quero_ler',
    avaliacao      NUMERIC,
    capa_path      TEXT,

    CONSTRAINT livros_ano_publicacao_check CHECK (ano_publicacao >= 1000 AND ano_publicacao <= 2100),
    CONSTRAINT livros_paginas_check        CHECK (paginas > 0),
    CONSTRAINT livros_formato_check        CHECK (formato IN ('fisico', 'ebook')),
    CONSTRAINT livros_status_check         CHECK (status IN ('quero_ler', 'lendo', 'lido')),
    CONSTRAINT livros_avaliacao_check      CHECK (avaliacao >= 0 AND avaliacao <= 5),
    CONSTRAINT livros_check                CHECK (data_fim IS NULL OR data_fim >= data_inicio),
    CONSTRAINT livros_check1               CHECK (
        (lido = FALSE AND data_inicio IS NULL AND data_fim IS NULL) OR
        (lido = TRUE)
    )
);

-- Tabela de relacionamento livro <-> gênero (N:N)
CREATE TABLE livro_genero (
    livro_id  INTEGER NOT NULL REFERENCES livros(id)  ON DELETE CASCADE,
    genero_id INTEGER NOT NULL REFERENCES generos(id) ON DELETE CASCADE,
    PRIMARY KEY (livro_id, genero_id)
);

CREATE TABLE metas (
    id   SERIAL PRIMARY KEY,
    ano  INTEGER NOT NULL,
    meta INTEGER NOT NULL
);

-- ============================================================
--  Índices para performance
-- ============================================================
CREATE INDEX idx_livros_status    ON livros(status);
CREATE INDEX idx_livros_autor_id  ON livros(autor_id);
CREATE INDEX idx_livros_genero_id ON livros(genero_id);
CREATE INDEX idx_livros_data_fim  ON livros(data_fim);
