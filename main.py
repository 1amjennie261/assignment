import json

# Specify path to your JSON configuration file
config_file_path = 'config/config.json' 

# Load the JSON config file
with open(config_file_path, 'r') as config_file:
    config = json.load(config_file)

# Print config
Connection_STRING = config["connectionString"]
