#!/bin/bash

DATE=$(TZ=Africa/Cairo date +%d-%m-%Y-%T)
backupdir=/home/ubuntu/testscript
outputdir=/home/ubuntu/testscript

cd $backupdir

for dir in */; do
       sudo tar -cf "$outputdir/$(basename $dir)-$DATE.tar" "$dir"
       sudo find $outputdir -mtime +10 -type f -delete
       sudo find $outputdir -mmin +1 -type f ! -name '*.sh' -delete
done
