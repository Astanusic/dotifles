#!/bin/bash

# Check if the -ktx2 parameter was passed
if [ "$1" == "-ktx2" ]
then
  # Set the output format to ktx2
  format="ktx2"
  for file in ./*.png ./*.jpeg ./*.jpg
  do
    # Check if the file exists
    if [ -f "$file" ]
    then
      # Check if a .basis file does not already exist for the image
      if [ ! -f "${file%.*}.basis" ] && [ ! -f "${file%.*}.ktx2" ]
      then
        # Convert the file to a .basis file using the basisu utility
        echo "Converting $file to .$format..."
        basisu "-$format" "$file"
        echo "Conversion of $file to .$format complete."
      else
        # Print a message indicating that the .basis file already exists
        echo "Skipping conversion of $file: .$format file already exists"
      fi
      fi
    done
  else
    # Set the output format to basis
    format="basis"
    for file in ./*.png ./*.jpeg ./*.jpg
    do
      # Check if the file exists
      if [ -f "$file" ]
      then
        # Check if a .basis file does not already exist for the image
        if [ ! -f "${file%.*}.basis" ] && [ ! -f "${file%.*}.ktx2" ]
        then
          # Convert the file to a .basis file using the basisu utility
          echo "Converting $file to .$format..."
          basisu "$file"
          echo "Conversion of $file to .$format complete."
        else
          # Print a message indicating that the .basis file already exists
          echo "Skipping conversion of $file: .$format file already exists"
        fi
        fi
      done
      fi
