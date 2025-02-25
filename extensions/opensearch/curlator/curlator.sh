#!/bin/bash

OPENSEARCH_URL="http://opensearch:9200"
MIGRATIONS_DIR="/migrations"

# Ensure the migrations directory exists
if [ ! -d "$MIGRATIONS_DIR" ]; then
  echo "Error: Directory $MIGRATIONS_DIR does not exist."
  exit 1
fi

# Iterate through each subdirectory inside /migrations
for index in "$MIGRATIONS_DIR"/*/; do
  # Remove trailing slash to get the actual directory name
  index_name=$(basename "$index")

  echo "Processing index: $index_name"

  # Path to the mapping.json file
  mapping_file="$index/mapping.json"

  if [ ! -f "$mapping_file" ]; then
    echo "Warning: No mapping.json found in $index_name, skipping..."
    continue
  fi

  echo "Creating index: $index_name"

  # Read the mapping file and send a request to create the index
  response=$(curl -s -X PUT "$OPENSEARCH_URL/$index_name" -H "Content-Type: application/json" --data-binary "@$mapping_file")

  echo "Response: $response"
done
