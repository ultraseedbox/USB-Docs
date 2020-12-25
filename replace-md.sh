#!/bin/bash

# A simple script to replace HTML tags to MD
# Makes docs making 85% less tedious
# Just call the script with the md file as 1st arg (./replace.sh docs.md)
# Made by Xan#7777

# MD Image Replace
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|\[https://i\.imgur\.com|\![https://i\.imgur\.com|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<p align="center"><img src="|!\[\]\(|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<p align="center">\n<img src="|!\[\]\(|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|png"><\/p>|png)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|PNG"><\/p>|PNG)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|jpg"><\/p>|jpg)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|JPG"><\/p>|JPG)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|png">|png)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|PNG">|PNG)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|jpg">|jpg)|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|JPG">|JPG)|g'

# callout check
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<c><p class="callout info">|::: info\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<c><p class="callout success">|::: success\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<c><p class="callout warning">|::: warning\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<c><p class="callout danger">|::: danger\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<\/p><\/c>|\n:::|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<p class="callout info">|::: info\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<p class="callout success">|::: success\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<p class="callout warning">|::: warning\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i 's|<p class="callout danger">|::: danger\n|g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<\/p>|\n:::|g'

# Replace Checkbox
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<input type="checkbox">|- \[ \] |g'
find . -type f -name "*.md" -print0 | xargs -0 -t sed -i -E 's|<br>||g'