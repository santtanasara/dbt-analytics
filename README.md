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

```plaintext
models/
├── metricas_por_campanha.sql        # ROAS e CPA por data, campanha e plataforma
├── metricas_por_usuario.sql         # Agregações por usuário (compras, receita, ticket)
├── metricas_usuario_ltv.sql         # LTV e dias de relacionamento por cliente

