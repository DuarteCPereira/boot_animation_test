#!/bin/bash

# Script to create a zip file with specified compression method and files
# and move it to the parent directory.

# Define the output file and input files
OUTPUT_FILE="bootAnimationAdamastor.zip"
INPUT_FILES=("desc.txt" "part0" "part1")

# Run the zip command
zip -r -Z store "$OUTPUT_FILE" "${INPUT_FILES[@]}"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Successfully created $OUTPUT_FILE."

  # Move the zip file to the parent directory
  mv "$OUTPUT_FILE" ..
  if [ $? -eq 0 ]; then
    echo "Moved $OUTPUT_FILE to the parent directory."
  else
    echo "Failed to move $OUTPUT_FILE to the parent directory."
    exit 1
  fi
else
  echo "Failed to create $OUTPUT_FILE."
  exit 1
fi
