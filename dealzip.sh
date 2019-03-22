#!/bin/bash

count=0
cd ./zips
for zip in $(ls *.zip)
do
  count=$((count+1))
  if [ $count == 200 ]; then
    break
  else
    mv $zip ../scripts/
  fi
done

cd ../scripts

for zip in $(ls *.zip)
do
  filename=$(echo $zip | cut -d . -f1)
  unzip $zip -d $filename
  rm -rf $zip
done

cd /home/debian/work/GithubCrawler/normal-scripts/collect
python3.5 filetype.py

if [ $? -ne 0 ]; then
  echo "RUNING Failed. Please check it."
else
  rm -rf /home/debian/work/GithubCrawler/scripts/*
fi
exit 0
