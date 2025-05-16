# 📊 dbt-analytics

Projeto desenvolvido com dbt e BigQuery simulando um pipeline analítico para uma empresa de e-commerce. O foco é automatizar a geração de métricas de marketing e comportamento de usuários, a partir de dados de eventos exportados do GA4.

---

## 🎯 Objetivo

Transformar dados brutos de eventos e perfis de usuários em insights acionáveis para as áreas de marketing e produto, calculando indicadores como:

- CPA (Custo por Aquisição)
- ROAS (Retorno sobre Investimento em Mídia)
- Ticket Médio
- Receita Total por Usuário
- Tempo de Relacionamento com o Cliente

---

## 🧰 Tecnologias utilizadas

- [dbt Cloud (Free)](https://cloud.getdbt.com/)
- [Google BigQuery](https://cloud.google.com/bigquery)
- [Looker Studio](https://lookerstudio.google.com/) *(opcional para visualização)*
- GitHub

---

## 🗂️ Estrutura do Projeto

```
models/
├── metricas_por_campanha.sql        # ROAS e CPA por data, campanha e plataforma
├── metricas_por_usuario.sql         # Agregações por usuário (compras, receita, ticket)
├── metricas_usuario_ltv.sql         # LTV e dias de relacionamento por cliente
```

---

## 📁 Tabelas criadas no BigQuery

| Tabela                              | Descrição                               | Particionada?            | Clusterizada?              |
|------------------------------------|------------------------------------------|---------------------------|-----------------------------|
| `trusted_data.metricas_por_campanha` | Métricas por campanha e plataforma     | ✅ `data`                 | ✅ `campanha`, `plataforma` |
| `trusted_data.metricas_por_usuario`  | Agregações por usuário                 | ✅ `data_primeira_compra` | ✅ `user_id`                |
| `trusted_data.metricas_usuario_ltv`  | LTV e tempo de vida do cliente         | ✅ `data_ultima_compra`   | ✅ `user_id`                |

---

## 🛠️ Como executar

> Este projeto foi desenvolvido e executado diretamente no **dbt Cloud**, com agendamento e versionamento via GitHub.

Se quiser rodar localmente com o [dbt Core](https://docs.getdbt.com/docs/core), siga os passos abaixo:

### 1. Clone o repositório:

```bash
git clone https://github.com/sarasantanadev/dbt-analytics.git
cd dbt-analytics
```

### 2. Configure o arquivo `profiles.yml` com as credenciais do seu projeto no BigQuery.

### 3. Instale as dependências:

```bash
dbt deps
```

### 4. Execute os modelos:

```bash
dbt run
```

### 5. Gere a documentação (opcional):

```bash
dbt docs generate
dbt docs serve
```

---

## 👩🏽‍💻 Desenvolvido por

**Sara Santana**  
Engenheira de Dados | dbt | BigQuery | GCP  
[🔗 LinkedIn](https://www.linkedin.com/in/sarasantanadev/)  
[🐙 GitHub](https://github.com/sarasantanadev)
