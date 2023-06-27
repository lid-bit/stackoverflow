-- tag_dimension.sql

-- Create the tag_dimension table
{{ config(materialized='table') }}

SELECT
  ROW_NUMBER() OVER () AS tag_id,
  tag_name
FROM `lydia-sandbox-390714.stackoverflow.tags
