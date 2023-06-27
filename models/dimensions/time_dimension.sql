-- time_dimension.sql

-- Create the time_dimension table
{{ config(materialized='table') }}

SELECT
  ROW_NUMBER() OVER () AS time_id,
  EXTRACT(YEAR FROM creation_date) AS year,
  EXTRACT(QUARTER FROM creation_date) AS quarter,
  EXTRACT(MONTH FROM creation_date) AS month,
  EXTRACT(DAY FROM creation_date) AS day
FROM `lydia-sandbox-390714.stackoverflow.posts_questions
GROUP BY year, quarter, month, day
