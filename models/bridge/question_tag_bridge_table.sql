-- Create the question_status_dimension table
{{ config(materialized='view') }}
WITH question_tags AS (
  SELECT
    pq.id AS question_id,
    t.id AS tag_id
  FROM `lydia-sandbox-390714.stackoverflow.posts_questions` AS pq
  JOIN `lydia-sandbox-390714.stackoverflow.tags` AS t ON (
    '|' || pq.tags || '|' LIKE CONCAT('%|', t.tag_name, '|%')
  )
)
SELECT *
FROM question_tags
