-- Create the question_tag_bridge_table
{{ config(materialized='table') }}

WITH question_tags AS (
  SELECT
    pq.id AS question_id,
    t.id AS tag_id
  FROM `stackoverflow.posts_questions` AS pq
  JOIN `stackoverflow.tags` AS t ON pq.id = t.question_id
)

SELECT
  question_id,
  tag_id
FROM question_tags
