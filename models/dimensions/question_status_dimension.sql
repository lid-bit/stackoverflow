-- question_status_dimension.sql

-- Create the question_status_dimension table
{{ config(materialized='table') }}

SELECT
  ROW_NUMBER() OVER () AS status_id,
  status_name
FROM (
  SELECT 'unanswered' AS status_name UNION ALL
  SELECT 'answered' AS status_name UNION ALL
  SELECT 'closed' AS status_name
) AS status
