{{ config(
    materialized='table',
    partition_by={
      'field': 'data_ultima_compra',
      'data_type': 'date'
    }
) }}

SELECT
  e.user_id AS usuario,
  p.nome,
  p.data_primeira_compra,
  MAX(e.event_date) AS data_ultima_compra,
  DATE_DIFF(MAX(e.event_date), p.data_primeira_compra, DAY) AS dias_de_relacionamento,
  ROUND(SUM(IF(e.event_name = 'purchase', e.revenue, 0))) AS receita_total,
  COUNTIF(e.event_name = 'purchase') AS total_pedidos,
  AVG(IF(e.event_name = 'purchase', e.revenue, NULL)) AS ticket_medio,
  p.estado

FROM `ambient-catcher-460018-v4.raw_data.events` e
LEFT JOIN `ambient-catcher-460018-v4.raw_data.user_profile` p
  ON e.user_id = p.user_id

GROUP BY e.user_id, p.nome, p.data_primeira_compra, p.estado