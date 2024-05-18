{{
   config(
       materialized="table"
   )
}}



WITH loc_of_occur_desc_cte AS
(
    SELECT DISTINCT
        loc_of_occur_desc_id
        loc_of_occur_desc
    FROM pubfic.df_raw_raw
)

