-- Create the question_fact table
{{ config(materialized='view') }}
SELECT
  q.id AS question_id,
  t.time_id,
  u.user_id,
  s.status_id,
  q.title,
  q.body,
  q.score,
  q.creation_date AS question_creation_date,
  q.view_count,
  q.answer_count
FROM `lydia-sandbox-390714.stackoverflow.posts_questions` AS q
JOIN `lydia-sandbox-390714.dbt_lblackley.time_dimension` AS t ON DATE(q.creation_date) = DATE(t.creation_date)
JOIN `lydia-sandbox-390714.dbt_lblackley.user_dimension` AS u ON q.owner_user_id = u.user_id
JOIN `lydia-sandbox-390714.dbt_lblackley.question_status_dimension` AS s ON q.post_type_id= s.status_id
WHERE DATE(q.creation_date) BETWEEN '2022-01-01' AND '2022-09-25'
