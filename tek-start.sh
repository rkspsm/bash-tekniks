#! /bin/bash

echo "export BASE_URL=https://api.teknik.io/v1"
echo "export PASTE_URL=\$BASE_URL/Paste"
echo "export EXPIRE_LENGTH=1"
echo "export EXPIRE_UNIT=day"
echo "export SYNTAX="
echo "export PASSWORD="
echo "export TITLE="
echo 'function response_output () { echo $FILENAME $RESPONSE_URL ; }'
echo "function json_extract () {
  echo \$1 |
    python -c \"import json, sys; data=json.load (sys.stdin); print (data['result']['\$2']);\"
}"

read_stdin=$1

if [[ $read_stdin = "-" ]]
then
  content=$(base64)
  echo "export STDIN_CONTENT='$content'"
else
  echo "export STDIN_CONTENT=''"
fi

