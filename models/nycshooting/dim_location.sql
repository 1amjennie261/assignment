{{
   config(
       materialized="table"
   )
}}



WITH location_cte AS
(
    SELECT DISTINCT
        boro
    FROM pubfic.df_raw_raw
)

