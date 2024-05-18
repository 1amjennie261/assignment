SELECT
	fact_id, occur_date, occur_time, location_id, loc_of_occur_desc, precinct, jurisdiction_code, loc_classfctn_desc, 
	location_desc, statistical_murder_flag, perp_age_group, perp_sex, perp_race, vic_age_group, vic_sex, vic_race, x_coord_cd, 
	y_coord_cd, latitude, longitude, geocoded_column
FROM
-- Create the schema
CREATE SCHEMA df_raw;

-- Create dim_date table
CREATE TABLE df_raw.dim_date (
	date_id INT NOT NULL,
	date_iso_format DATE,
	year_number INT,
	month_number INT,
	day_number INT,
	quarter_number INT,
	month_name VARCHAR(100),
	day_name VARCHAR(100),
	week_of_year INT,
	week_of_month INT
);

-- Add primary key to dim_date
ALTER TABLE df_raw.dim_date ADD PRIMARY KEY (date_id);

-- Create dim_location table
CREATE TABLE df_raw.dim_location (
	boro INT NOT NULL,
);

-- Add primary key to dim_location
ALTER TABLE df_raw.dim_location ADD PRIMARY KEY (boro);

-- Create dim_precinct table
CREATE TABLE df_raw.dim_precinct (
	precinct_id INT NOT NULL,
	precinct VARCHAR(255)
);

-- Add primary key to dim_precinct
ALTER TABLE df_raw.dim_prrecinct ADD PRIMARY KEY (precinct_id);

-- Create dim_loc_classdctn_desc table
CREATE TABLE df_raw.dim_loc_classdctn_desc (
	loc_classdctn_desc_id INT NOT NULL,
	loc_classdctn_desc VARCHAR(255) 
);

-- Add primary key to dim_loc_classdctn_desc 
ALTER TABLE df_raw.dim_loc_classdctn_desc  ADD PRIMARY KEY (loc_classdctn_desc_id);

-- Create dim_loc_of_occur_desc table
CREATE TABLE df_raw.dim_loc_of_occur_desc  (
	loc_of_occur_desc _id INT NOT NULL,
	loc_of_occur_desc  VARCHAR(255) 
);

-- Add primary key to dim_loc_of_occur_desc 
ALTER TABLE df_raw.dim_loc_classdctn_desc ADD PRIMARY KEY (loc_classdctn_desc_id);


-- Create facts_nypd table
CREATE TABLE df_raw.facts_nypd (
	fact_id INT NOT NULL,
	occur_date numeric,
	occur_time numeric,
	precinct_id numeric,
	location_id INT NOT NULL,
	loc_of_occur_desc_id INT,
	loc_classfctn_desc_id INT,
	date_id INT
    latitude
    longitude
);

-- Add primary key to facts_RESales
ALTER TABLE facts_nypd ADD PRIMARY KEY (fact_id, location_id);

-- Create facts_nypd table
CREATE TABLE facts_nypdshooting (
    incident_key INT PRIMARY KEY,
    occur_date DATE,
    occur_time TIME,
    precinct_id INT,
    loc_of_occur_desc_id INT,
    loc_classfctn_desc_id INT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    date_id INT,
    FOREIGN KEY (precinct_id) REFERENCES dim_precinct(precinct_id),
    FOREIGN KEY (loc_of_occur_desc_id) REFERENCES dim_loc_of_occur_desc(loc_of_occur_desc_id),
    FOREIGN KEY (loc_classfctn_desc_id) REFERENCES dim_loc_classfctn_desc(loc_classfctn_desc_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id)
);




