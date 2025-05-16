{{ config(materialized='table') }}

SELECT
 e.event_date AS data,
 e.campaign AS campanha, 
 e.platform AS plataforma,
 COUNTIF(event_name = 'purchase') AS total_conversoes,
 ROUND(SUM(IF(e.event_name = 'click', ad_cost, 0))) AS total_custo,
 ROUND(SUM(IF(e.event_name = 'purchase', e.revenue, 0))) AS total_receita,
 --cpa
 ROUND(SAFE_DIVIDE(
  SUM(IF(event_name = 'click', ad_cost, 0)),
  COUNTIF(event_name = 'purchase')
 ))AS cpa,
 ROUND(SAFE_DIVIDE(
  SUM(IF(e.event_name = 'purchase', e.revenue, 0)),
  SUM(IF(e.event_name = 'click', e.ad_cost, 0))
 )) AS roas
 FROM ambient-catcher-460018-v4.raw_data.events e
 GROUP BY 1,2,3
 ORDER BY data ASC