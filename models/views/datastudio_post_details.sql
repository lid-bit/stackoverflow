-- dbt model: models/views/datastudio_post_details.sql

-- Create the datastudio_post_details view
{{ config(materialized='view') }}

SELECT
id, title, body, creation_date, tag, view_count, accepted_answer_id
  FROM `lydia-sandbox-390714.stackoverflow.posts_questions` ,
  UNNEST(SPLIT(tags, '|')) AS tag
  WHERE answer_count = 0
