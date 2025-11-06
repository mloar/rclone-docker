#!/bin/bash

creds=($(jq --raw-output0 .user,.password < /dev/stdin | tr "\0" " "))
printf "%s" "${creds[1]}" | sudo -n -S -u "${creds[0]}" true
if [ $? -eq 0 ]; then
  printf '{"type": "local", "_root": "%s"}' `grep "${creds[0]}:" /etc/passwd | cut -f 6 -d :`
fi
