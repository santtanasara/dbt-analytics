{{ config(
    materialized='table',
    partition_by={
      'field': 'data_primeira_compra',
      'data_type': 'date'
    },
    cluster_by=["user_id"]
) }}

SELECT
  u.user_id,
  u.nome,
  u.estado,
  u.cidade,
  u.data_primeira_compra,

  COUNTIF(e.event_name = 'purchase') AS total_compras,
  ROUND(SUM(IF(e.event_name = 'purchase', e.revenue, 0))) AS total_receita,
  ROUND(SUM(IF(e.event_name = 'click', e.ad_cost, 0))) AS total_custo,

  ROUND(SAFE_DIVIDE(
    SUM(IF(e.event_name = 'click', e.ad_cost, 0)),
    COUNTIF(e.event_name = 'purchase')
  )) AS cpa,

  ROUND(SAFE_DIVIDE(
    SUM(IF(e.event_name = 'purchase', e.revenue, 0)),
    SUM(IF(e.event_name = 'click', e.ad_cost, 0))
  )) AS roas

FROM `ambient-catcher-460018-v4.raw_data.events` e
JOIN `ambient-catcher-460018-v4.raw_data.user_profile` u
  ON e.user_id = u.user_id

GROUP BY u.user_id, u.nome, u.estado, u.cidade, u.data_primeira_compra