#!/bin/bash

echo "Generating .env with param dev for service github-pages-demo"

aws ssm get-parameters-by-path --path "/dev/github-pages-demo/" --with-decryption   --region test_version --query="Parameters[*].[Name, Value]"   --output text |
  while read line
  do
    name=$(echo ${line}} | cut -f 1 -d ' ' | sed -e "s//dev/github-pages-demo///g")
    value=$(echo ${line} | cut -f 2 -d ' ')
    echo "${name}=${value}" >> .env
  done
ls -lart
python manage.py runserver 0.0.0.0:3000
#node index.js