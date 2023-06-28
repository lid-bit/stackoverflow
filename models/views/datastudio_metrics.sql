-- dbt model: models/views/datastudio_metrics.sql

-- Create the datastudio metric view
{{ config(materialized='view') }}

SELECT
  COUNT(*) AS question_count,
  creation_date,
  COUNTIF(answer_count > 0) AS answered_count,
  COUNTIF(answer_count = 0) AS unanswered_count,
  answer_count,
  view_count,
  tag
FROM
  `lydia-sandbox-390714.stackoverflow.posts_questions`,
  UNNEST(SPLIT(tags, '|')) AS tag
GROUP BY
  2,5,6,7
ORDER BY
  question_count DESC