-- question_tag_bridge_table.sql

-- Create the question_tag_bridge_table
{{ config(materialized='table') }}

SELECT
  pt.post_id AS question_id,
  t.tag_id
FROM {{ source('stackoverflow', 'post_tags') }} AS pt
JOIN {{ ref('question_fact_table') }} AS q ON pt.post_id = q.question_id
JOIN {{ ref('tag_dimension') }} AS t ON pt.tag_id = t.tag_id
