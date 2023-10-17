{{ config(materialized="table") }}

WITH calendario AS (
SELECT 
  DATEADD(DAY, -SEQ4(), CURRENT_DATE()) AS date
FROM TABLE(GENERATOR(ROWCOUNT => 365*10)) v 
)
SELECT
  date
  , SUBSTRING(DATE_TRUNC(MONTH, date)::VARCHAR, 1, 7) AS month
  , CONCAT(YEAR(date), '-', QUARTER(date)) AS quarter
  , YEAR(date) AS year
FROM calendario