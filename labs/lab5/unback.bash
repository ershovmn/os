#!/bin/bash
if ! [[ -d ~/restore ]]; then
    mkdir ~/restore
fi
backup=$(ls ~/ | egrep "Backup-" | sort -r | head -n1)
if [[ backup = "" ]]; then
    echo "Not found backups"
    exit
fi
for file in $(ls "$HOME/$backup" | sed -r '/[.][a-zA-Z0-9]+[.][0-9_-]+$/d'); do
    if [[ -f "$HOME/restore/$file" ]]; then
        prinf "File '$file' already exists in '$HOME/restore'. Want to rewite Yes/No(y/n)"
        read res
        if [[ $res = "y"  ]] || [[ $res = "" ]] || [[ $res = "yes" ]]; then
            rm "$HOME/restore/file"
            cp "$HOME/$backup/$file" "$HOME/restore/$file"
        fi
    else
        cp "$HOME/$backup/$file" "$HOME/restore/$file"
    fi
done