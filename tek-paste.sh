#! /bin/bash

cat

echo "if [[ ! -z \$STDIN_CONTENT ]]"
echo "then"
  echo 'export RESPONSE=`curl --silent --data "title=$TITLE&password=$PASSWORD&expireUnit=$EXPIRE_UNIT&expireLength=$EXPIRE_LENGTH&syntax=$SYNTAX&doNotTrack=true&hide=true" --data-urlencode "code=$(echo "$STDIN_CONTENT" | base64 --decode)" $PASTE_URL`'
  echo "export FILENAME='-'"
  echo 'export RESPONSE_ID=`json_extract $RESPONSE id`'
  echo 'export RESPONSE_URL=`json_extract $RESPONSE url`'
  echo 'export RESPONSE_EXPIRATION=`json_extract $RESPONSE expiration`'
  echo "response_output"
  echo "STDIN_CONTENT=''"
echo "fi"

for f in "$@"
do
  content=$(base64 $f)
  echo "export DATA='$content'"
  echo 'export RESPONSE=`curl --silent --data "title=$TITLE&password=$PASSWORD&expireUnit=$EXPIRE_UNIT&expireLength=$EXPIRE_LENGTH&syntax=$SYNTAX&doNotTrack=true&hide=true" --data-urlencode "code=$(echo "$DATA" | base64 --decode)" $PASTE_URL`'
  echo "export FILENAME='$f'"
  echo 'export RESPONSE_ID=`json_extract $RESPONSE id`'
  echo 'export RESPONSE_URL=`json_extract $RESPONSE url`'
  echo 'export RESPONSE_EXPIRATION=`json_extract $RESPONSE expiration`'
  echo "response_output"
done

