#!/usr/bin/env bash

AWS_CRED_FILE="$HOME/.aws/credentials"

if [ $1 == "id" ]; then
    grep 'default' "$AWS_CRED_FILE" -A 2 | tail -2 | head -1 | awk '{ print "export AWS_ACCESS_KEY_ID=" $NF }' | tr -d "\n" | pbcopy
elif [ $1 == "secret" ]; then
    grep 'default' "$AWS_CRED_FILE" -A 2 | tail -2 | tail -1 | awk '{ print "export AWS_SECRET_ACCESS_KEY=" $NF }' | tr -d "\n" | pbcopy
fi
