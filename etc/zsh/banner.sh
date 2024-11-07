#!/bin/bash

# Directly assign color codes for the foreground
f1=$'\e[31m'  # Red
f2=$'\e[32m'  # Green
f3=$'\e[33m'  # Yellow
f4=$'\e[34m'  # Blue
f5=$'\e[35m'  # Magenta
f6=$'\e[36m'  # Cyan
f7=$'\e[37m'  # White
bold=$'\e[1m' # Bold
re=$'\e[0m'   # Reset

block="███████${bold}██${re}" # Combined block format

# Build the repeated line content with color variables
line=" ${f1}${block} ${f2}${block} ${f3}${block} ${f4}${block} ${f5}${block} ${f6}${block}\n"
last=" ${f7}${block} ${f7}${block} ${f7}${block} ${f7}${block} ${f7}${block} ${f7}${block}\n"

# Print the entire buffer at once
printf "\n$line$line$line$last\n"

