-- question_fact_table.sql

-- Create the question_fact_table
{{ config(materialized='table') }}

SELECT
  q.question_id,
  t.time_id,
  u.user_id,
  s.status_id,
  q.title,
  q.body,
  q.score,
  q.view_count,
  q.answer_count
FROM {{ source('stackoverflow', 'posts_questions') }} AS q
JOIN {{ ref('time_dimension') }} AS t ON DATE(q.creation_date) = DATE(t.creation_date)
JOIN {{ ref('user_dimension') }} AS u ON q.user_id = u.user_id
JOIN {{ ref('question_status_dimension') }} AS s ON q.status = s.status_name
