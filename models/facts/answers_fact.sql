-- answer_fact_table.sql

-- Create the answer_fact_table
{{ config(materialized='view') }}

SELECT
  a.id,
  t.time_id,
  u.user_id,
  q.status_id,
  a.body,
  a.score
FROM `lydia-sandbox-390714.stackoverflow.posts_answers` AS a
JOIN `lydia-sandbox-390714.dbt_lblackley.time_dimension` AS t ON DATE(a.creation_date) = DATE(t.creation_date)
JOIN `lydia-sandbox-390714.dbt_lblackley.user_dimension` AS u ON a.owner_user_id = u.user_id
JOIN `lydia-sandbox-390714.dbt_lblackley.question_status_dimension` AS q ON a.parent_id = q.status_id
WHERE DATE(a.creation_date) BETWEEN '2022-01-01' AND '2022-09-25'