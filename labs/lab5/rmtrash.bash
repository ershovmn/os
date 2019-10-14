#!/bin/bash
if ! [ -d "$HOME/.trash" ]; then
    mkdir "$HOME/.trash"
fi
path="$PWD/$1"
mydate=$(date)
name=$(echo "$mydate$path" | sha256sum | cut -d' ' -f1)
name="$HOME/.trash/$name"
ln -P $path $name
rm $path
echo "$path:$name" >> ~/.trash.log