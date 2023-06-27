-- user_dimension.sql

-- Create the user_dimension table
{{ 
    config(
        materialized='table'
    ) 
}}

SELECT
  user_id,
  reputation,
  display_name,
  creation_date
FROM `lydia-sandbox-390714.stackoverflow.users
