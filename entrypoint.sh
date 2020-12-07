#!/bin/bash


addLabel="heeeey"
API_HEADER="Accept: application/vnd.github.v3+json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"
number=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")

curl -sSL \
        -H "${AUTH_HEADER}" \
        -H "${API_HEADER}" \
        -X POST \
        -H "Content-Type: application/json" \
        -d "{\"labels\":[\"${addLabel}\"]}" \
        "${URI}/repos/${GITHUB_REPOSITORY}/issues/${number}/labels"














AUTHOR_NAME=$(git log -1 --pretty=format:"%an")
AUTHOR_EMAIL=$(git log -1 --pretty=format:"%ae")
IS_AUTHOR_NAME_VALID=$(echo $AUTHOR_NAME | grep -P "^.+ .+$" | wc -l)
IS_AUTHOR_EMAIL_VALID=$(echo $AUTHOR_EMAIL | grep -P "^.+@.+\..+$" | wc -l)

if [[ $IS_AUTHOR_NAME_VALID == 0 ]]
then
  echo "The author name($AUTHOR_NAME) is invalid, right format is: NAME FAMILY"
  exit 1
fi

if [[ $IS_AUTHOR_EMAIL_VALID == 0 ]]
then
  echo "The author email($AUTHOR_EMAIL) is invalid, right format is: username@host.com"
  exit 1
fi


exit 0
