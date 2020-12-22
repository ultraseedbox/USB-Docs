#!/bin/bash

# A simple script to replace HTML tags to MD
# Makes docs making 85% less tedious
# Just call the script with the md file as 1st arg (./replace.sh docs.md)
# Made by Xan#7777

# MD Image Replace
sed -i -E 's|\[https://i\.imgur\.com|\![https://i\.imgur\.com|g' "$1"
sed -i -E 's|<p align="center"><img src="|!\[\]\(|g' "$1"
sed -i 's|png"><\/p>)|png)|g' "$1"
sed -i 's|PNG"><\/p>)|PNG)|g' "$1"
sed -i 's|jpg"><\/p>)|jpg)|g' "$1"
sed -i 's|JPG"><\/p>)|JPG)|g' "$1"

# callout check
# sed -i 's|<callout info>|<c><p class="callout info">|g' "$1"
# sed -i 's|<callout success>|<c><p class="callout success">|g' "$1"
# sed -i 's|<callout warning>|<c><p class="callout warning">|g' "$1"
# sed -i 's|<callout danger>|<c><p class="callout danger">|g' "$1"
# sed -i 's|<\/callout>|<\/p><\/c>|g' "$1"