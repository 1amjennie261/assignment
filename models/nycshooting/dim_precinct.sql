{{
   config(
       materialized="table"
   )
}}



WITH precinct_cte AS
(
    SELECT DISTINCT
        precinct,
        jurisdiction_code
    FROM pubfic.df_raw_raw
)

