-- dbt model: models/partitioned/post_questions_partitioned.sql

{{ config(
  materialized='table',
  partition_by=['creation_date'],
  clustered_by=['id']
) }}

SELECT
  *
FROM `lydia-sandbox-390714.stackoverflow.posts_questions`
