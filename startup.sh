#!/bin/bash

echo "Generating .env with param undefined for service undefined"

aws ssm get-parameters-by-path --path "/undefined/undefined/" --with-decryption   --region undefined --query="Parameters[*].[Name, Value]"   --output text |
  while read line
  do
    name=$(echo ${line}} | cut -f 1 -d ' ' | sed -e "s//undefined/undefined///g")
    value=$(echo ${line} | cut -f 2 -d ' ')
    echo "${name}=${value}" >> .env
  done
ls -lart
python manage.py runserver 0.0.0.0:3000
#node index.js