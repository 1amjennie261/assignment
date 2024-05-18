
-- Configure materialization for the model
{{
    config(
        materialized="table"
    )
}}

-- Populate the fact table using a SQL query
INSERT INTO {{ ref('facts_nypd') }} (
    incident_key,
    occur_date,
    occur_time,
    precinct_id,
    location_id,
    date_id,
    loc_of_occur_desc_id,
    loc_classfctn_desc_id,
    latitude,
    longitude,
    
)
SELECT
    df_raw.fact_id AS incident_key,
    df_raw.occur_date,
    df_raw.occur_time,
    dim_precinct.precinct_id,
    dim_loc_of_occur_desc.loc_of_occur_desc_id,
    dim_loc_classfctn_desc.loc_classfctn_desc_id,
    df_raw.latitude,
    df_raw.longitude,
    dim_date.date_id
FROM
    df_raw
JOIN
    dim_precinct ON df_raw.precinct_id = dim_precinct.precinct_id
JOIN
    dim_loc_of_occur_desc ON df_raw.loc_of_occur_desc_id = dim_loc_of_occur_desc.loc_of_occur_desc_id
JOIN
    dim_loc_classfctn_desc ON df_raw.loc_classfctn_desc_id = dim_loc_classfctn_desc.loc_classfctn_desc_id
JOIN
    dim_date ON df_raw.date_id = dim_date.date_id;
