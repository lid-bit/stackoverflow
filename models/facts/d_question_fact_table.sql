-- dbt model: models/facts/question_fact_table.sql

-- Create the denormalized Question Fact Table
{{ config(materialized='table') }}

SELECT
  q.id,
  t.time_id,
  q.owner_user_id,
  qt.tag_id,
  q.post_type_id,
  q.title,
  q.body,
  q.score,
  q.view_count,
  q.answer_count,
  t.year,
  t.quarter,
  t.month,
  t.day,
  u.display_name,
  u.creation_date,
  u.reputation,
  tg.tag_name,
  qs.status_name
FROM `lydia-sandbox-390714.stackoverflow.posts_questions` AS q
JOIN `lydia-sandbox-390714.dbt_lblackley.time_dimension` AS t ON DATE(q.creation_date) = DATE(t.creation_date)
JOIN `lydia-sandbox-390714.dbt_lblackley.user_dimension` AS u ON q.owner_user_id = u.user_id
JOIN `lydia-sandbox-390714.dbt_lblackley.question_status_dimension` AS qs ON q.post_type_id = qs.status_id
JOIN `lydia-sandbox-390714.dbt_lblackley.question_tag_bridge_table` AS qt ON q.id = qt.question_id
JOIN `lydia-sandbox-390714.dbt_lblackley.tag_dimension` AS tg ON qt.tag_id = tg.tag_id