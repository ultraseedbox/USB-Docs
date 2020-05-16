#!/bin/bash

# A simple cript to replace MD image tags and callout tags to HTML
# Makes docs making 85% less tedious
# Just call the script with the md file as 1st arg (./replace.sh docs.md)
# Made by Xan#7777

# MD Image Replace
sed -i 's#!\[](#<p align="center"><img src="#g' "$1"

# png replace
sed -i 's#png)#png"><\/p>#g' "$1"
sed -i 's#PNG)#PNG"><\/p>#g' "$1"

# callout check
sed -i 's#<callout info>#<c><p class="callout info">#g' "$1"
sed -i 's#<callout success>#<c><p class="callout success">#g' "$1"
sed -i 's#<callout warning>#<c><p class="callout warning">#g' "$1"
sed -i 's#<callout danger>#<c><p class="callout danger">#g' "$1"
sed -i 's#<\/callout>#<\/p><\/c>#g' "$1"