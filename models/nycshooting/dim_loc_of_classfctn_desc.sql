{{
   config(
       materialized="table"
   )
}}



WITH loc_of_classfctn_desc_cte AS
(
    SELECT DISTINCT
        loc_of_classfctn_desc
        loc_of_classfctn_desc_id
    FROM pubfic.df_raw_raw
)

