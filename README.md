## 📚 MinhaBiblioteca — Catálogo Pessoal de Livros

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-6A0DAD?style=flat-square&logo=postgresql&logoColor=white)
![CustomTkinter](https://img.shields.io/badge/CustomTkinter-4E7A4C?style=flat-square)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c?style=flat-square)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow?style=flat-square)

> Aplicação desktop em Python para catalogar e acompanhar a jornada de leitura — com dashboard de estatísticas, avaliações e metas anuais.

---

### 📌 Sobre o Projeto

O **Minha Biblioteca** é um sistema desktop com interface gráfica que permite catalogar, organizar e acompanhar sua jornada de leitura. O projeto surgiu da necessidade pessoal de controlar os livros lidos, em leitura e na lista de desejos, com estatísticas e dashboards visuais.

---

### ✨ Funcionalidades

- **Cadastro completo de livros** — título, autor, gênero, editora, páginas, ano, formato e capa
- **Status de leitura** — Quero Ler / Lendo / Lido, com data de conclusão automática
- **Avaliação por estrelas** — 0 a 5 estrelas, registrada no momento do cadastro ou edição
- **Busca e filtros** — pesquisa por título ou autor, filtragem por status
- **Edição inline** — janela de edição com todos os campos preenchidos
- **Troca de capa** — upload de imagem diretamente pelo catálogo
- **Busca automática pela internet** — preenchimento de dados via API externa (Open Library)
- **Dashboard com 6 gráficos** — gêneros, status, ritmo mensal, evolução anual, avaliações e autores favoritos
- **Panorama de leitura** — resumo com cards de total, lidos, lendo agora e páginas
- **Meta anual de leitura** — definição e acompanhamento de objetivo do ano

---

### 🗃️ Modelagem do Banco de Dados

O banco é estruturado com normalização e integridade referencial garantida via chaves estrangeiras.

| Tabela | Descrição |
|---|---|
| `autores` | Cadastro de autores |
| `generos` | Cadastro de gêneros literários |
| `editoras` | Cadastro de editoras |
| `livros` | Tabela principal com todos os dados do livro |
| `metas` | Meta anual de leitura por ano |

---

### 🛠️ Tecnologias Utilizadas

[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-6A0DAD?style=for-the-badge&logo=postgresql&logoColor=white)](https://postgresql.org)
[![CustomTkinter](https://img.shields.io/badge/CustomTkinter-UI-4E7A4C?style=for-the-badge)](https://github.com/TomSchimansky/CustomTkinter)
[![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c?style=for-the-badge&logo=python&logoColor=white)](https://matplotlib.org)

- **Python 3.12+** — linguagem principal
- **CustomTkinter** — interface gráfica moderna
- **PostgreSQL** — banco de dados relacional
- **psycopg2** — driver Python para PostgreSQL
- **Matplotlib** — gráficos do dashboard
- **Pillow** — manipulação de imagens de capas

---

### 📂 Estrutura do Projeto

```
minha-biblioteca/
├── main.py                   # Ponto de entrada, janela principal e sidebar
├── database/
│   ├── database.py           # Conexão e execução de queries
│   ├── livros.py             # CRUD de livros e agregados
│   ├── dashboard_data.py     # Queries para os gráficos
│   └── busca_api.py          # Integração com Open Library API
├── ui/
│   ├── styles.py             # Paleta de cores e fontes
│   ├── tela_inicio.py        # Panorama de leitura
│   ├── tela_biblioteca.py    # Catálogo com busca, filtros e edição
│   ├── tela_adicionar.py     # Formulário de cadastro
│   ├── tela_dashboard.py     # Estatísticas e gráficos
│   └── widget_estrelas.py    # Componente de avaliação por estrelas
└── assets/                   # Recursos estáticos
```

---

## ⚙️ Como Rodar

### Pré-requisitos

- Python 3.12 ou superior
- PostgreSQL instalado e rodando
- pip

### 1. Clone o repositório

```bash
git clone https://github.com/annakarolyna-ps/minha-biblioteca.git
cd minha-biblioteca
```

### 2. Instale as dependências

```bash
pip install customtkinter psycopg2-binary Pillow matplotlib requests
```

### 3. Configure o banco de dados

Execute o script de criação das tabelas no seu PostgreSQL:

```bash
psql -U postgres -d seu_banco -f database/schema.sql
```

### 4. Configure a conexão

Edite o arquivo `database/database.py` com suas credenciais:

```python
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "database": "catalogo_livros",
    "user": "postgres",
    "password": "sua_senha"
}
```

### 5. Execute

```bash
python main.py
```

---

## 👩‍💻 Autora

**Anna Karolyna Pereira Santos**
Graduanda em Ciência da Computação — UFU

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Anna%20Santos-8A2BE2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/annakarolynaps)
[![GitHub](https://img.shields.io/badge/GitHub-annakarolyna--ps-8A2BE2?style=for-the-badge&logo=github&logoColor=white)](https://github.com/annakarolyna-ps)
