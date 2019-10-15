#!/bin/bash
lastbackup=$(ls ~/ | egrep "Backup-" | sort -r | head -n1)
lastdate=${lastbackup#Backup-}
lastdate=${lastdate//-}
currentdate=$(date +"%Y%m%d")
let res=(`date +%s -d $currentdate`-`date +%s -d $lastdate`)/86400
if [[ $res -gt "7" ]] || [[ $lastbackup = "" ]]; then
    backup="Backup-$(date +'%Y-%m-%d')"
    mkdir "$HOME/$backup"
    for file in $(ls ~/source); do
        cp "$HOME/source/$file" "$HOME/$backup/$file"
    done
    echo "Backup dir '$HOME/$backup' is create at '$(date +"%c")'" >> "$HOME/backup-report"
    ls "$HOME/$backup" >> "$HOME/backup-report"
else
    echo "Backup dir '$HOME/$lastbackup' is edit at '$(date +"%c")'" >> "$HOME/backup-report"
    for file in $(ls ~/source); do
        if ! [[ -f "$HOME/$lastbackup/$file" ]]; then
            cp "$HOME/source/$file" "$HOME/$lastbackup/$file"
            echo "$file" >> "$HOME/backup-report"
        fi
    done
    mydate=$(date +"%Y-%m-%d-%H-%M-%S")
    for file in $(ls ~/source); do
        if [[ -f "$HOME/$lastbackup/$file" ]]; then
            if [[ "$(stat "$HOME/source/$file" -c %s)" -ne "$(stat "$HOME/$lastbackup/$file" -c %s)" ]]; then
                mv "$HOME/$lastbackup/$file" "$HOME/$lastbackup/$file.$mydate"
                cp "$HOME/source/$file" "$HOME/$lastbackup/$file"
                echo "$file $file.$mydate" >> "$HOME/backup-report"
            fi
        fi
    done
fi