#! /bin/bash

prog=$0
length=$1
unit=$2

function usage () {
  echo $prog "<length> <unit>"
  exit 1
}

if [[ -z $length ]] | [[ -z $unit ]]
then
  usage
fi

cat
echo "export EXPIRE_LENGTH=$length"
echo "export EXPIRE_UNIT=$unit"

