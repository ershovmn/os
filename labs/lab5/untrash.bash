#!/bin/bash
for item in $(grep -E "$1:" $HOME/.trash.log); do
    path=$(echo "$item" | cut -d':' -f1)
    name=$(echo "$item" | cut -d':' -f2)
    hash=$(echo "$name" | awk -F'/' '{print($NF)}')
    echo "$hash"
    printf "Restore file %s Yes/No(y,n) " $path
    read res
    res=$(echo "$res" | tr [:upper:] [:lower:])
    if [[ $res = "y"  ]] || [[ $res = "" ]] || [[ $res = "yes" ]]; then
        dir=${path%"$1"}
        if [[ -d $dir ]]; then
            if [[ -f $path ]]; then
                printf "File with the same name already exists. Want to rewrite Yes/No(y/n) "
                read res1
                if [[ $res1 = "y"  ]] || [[ $res1 = "" ]] || [[ $res1 = "yes" ]]; then
                    rm $path
                    ln -P $name $path
                    sed -i "/$hash/d" $HOME/.trash.log
                    rm $name
                fi
            else
                ln -P $name $path
                sed -i "/$hash/d" $HOME/.trash.log
                rm $name
            fi
        else
            echo "Dir $dir not found. File will be restored to the home dir"
            ln -P $name "$HOME/$1"
            sed -i "/$hash/d" $HOME/.trash.log
            rm $hame
        fi
    fi
done
