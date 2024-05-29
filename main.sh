#!/bin/bash

export ETCDCTL_API=3

IFS=$'\n'
FILE="configs.out"

# USERPASS=""            # ETCD User name and password in username:password format
# URL=""          # URL of ETCD server

KEY=""
declare -A result
read_file() {
    while read line || [ -n "$line" ];
    do
        if [[ $line =~ ^/system ]]; then
            result["$line"]=""
            KEY=$line      
        else
            if [[ -z ${result[$KEY]} ]]; then
                result[$KEY]=$line
            else
                result[$KEY]+=$'\n'"$line"
            fi 
        fi
    done < "$FILE"
}

read_file

for key in "${!result[@]}"; do
    echo "$key"
    echo "${result[$key]}"
    etcdctl --user "$USERPASS" --endpoints "$URL"   put "$key" -- "${result[$key]}"
done