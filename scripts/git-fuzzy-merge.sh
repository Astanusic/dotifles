#!/bin/bash

# Check if we are in a git repo
if ! git rev-parse --git-dir &> /dev/null; then
  echo -e "\033[1;31mNot in a git repository.\nExiting ...\033[0m"
  exit 1
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo -e "fzf is not installed.\nPlease install it and try again."
  exit 1
fi

conflict_files=($(git diff --name-only --diff-filter=U))

if [[ -z $conflict_files ]]; then
  echo -e "\033[1;31mNo conflict found.\nExiting."
  exit
fi

conflict_length=${#conflict_files[@]}

fixed_files=()

for selected_file in "${conflict_files[@]}"; do
  file_name=$(basename $selected_file | tr '.' '_')
  remaining_files=$((conflict_length - current_index))
  current_index=$((current_index + 1))


  echo -e "$remaining_files file(s) with conflict(s) left.\nEnter to proceed."
  read -p ""

   # Run nvim in a subshell, so the script will continue after the buffer is closed
   ( nvim -c ":Gvdiffsplit!" $selected_file )

   # Add the fixed file to the array
   fixed_files+=("$selected_file")
   echo $fixed_files

   if [[ "$current_index" -eq "$conflict_length" ]]; then
     while true; do
       read -p "Do you wish to stage and commit files (y / n) ?" yn
       case $yn in
         [Yy]* )  
           for file in "${fixed_files[@]}"; do
             git add "$file"
           done
           git commit
           exit;;
         [Nn]* ) exit;;
         * ) echo "y(es) / n(o)";;
       esac
     done
   fi

 done

