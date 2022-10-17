#!/bin/bash

AUTHOR_NAME=$(git log -1 --pretty=format:"%an")
AUTHOR_EMAIL=$(git log -1 --pretty=format:"%ae")

IS_AUTHOR_NAME_VALID=$(echo $AUTHOR_NAME | grep -P "^.+ .+$" | wc -l)
IS_AUTHOR_EMAIL_VALID=$(echo $AUTHOR_EMAIL | grep -P "^.+@.+\..+$" | wc -l)

if [[ $IS_AUTHOR_NAME_VALID == 0 ]]
then
  echo "The author name($AUTHOR_NAME) is invalid, right format is: Firstname Lastname"
  echo 'You can use following command for changing your name: git config --global user.name "FIRST_NAME LAST_NAME"' 
  exit 1
fi

if [[ $IS_AUTHOR_EMAIL_VALID == 0 ]]
then
  echo "The author email($AUTHOR_EMAIL) is invalid, right format is: username@domain.com"
  echo 'You can use following command for changing your e-mail: git config --global user.email "username@domain.com"'
  exit 1
fi


exit 0
