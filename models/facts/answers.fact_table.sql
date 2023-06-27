-- answer_fact_table.sql

-- Create the answer_fact_table
{{ config(materialized='table') }}

SELECT
  a.answer_id,
  t.time_id,
  u.user_id,
  q.question_id,
  a.body,
  a.score
FROM `lydia-sandbox-390714.stackoverflow.posts_answers AS a
JOIN {{ ref('time_dimension') }} AS t ON DATE(a.creation_date) = DATE(t.creation_date)
JOIN {{ ref('user_dimension') }} AS u ON a.user_id = u.user_id
JOIN {{ ref('question_fact_table') }} AS q ON a.parent_id = q.question_id
