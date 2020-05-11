#!/bin/bash

# Script to replace MD images to HTML

c1='!\[]('
c2='<p align="center"><img src="'
c3='png)'
c4='PNG)'
c5='png"><\/p>'

# MD Image Replace
sed -i s#"$c1"#"$c2"#g "$1"

# png extension check
if cat "$1" | grep .png 
then
    sed -i s#"$c3"#"$c5"#g "$1"
elif cat "$1" | grep .PNG
then
    sed -i s#"$c4"/#"$c5"#g "$1"
fi