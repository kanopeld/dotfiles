#!/usr/bin/env bash

FILE_NAME="99-custom"

FIX_FN_SCRIPT=fix_fn

if [[ -z "${SCRIPTS_PATH}" ]]; then
  SCRIPTS_PATH=/usr/bin
else
  SCRIPTS_PATH="${SCRIPTS_PATH}"
fi

mkdir ./tmp
touch ./tmp/$FILE_NAME

echo "$USER ALL=(ALL:ALL) $SCRIPTS_PATH/$FIX_FN_SCRIPT" > ./tmp/$FILE_NAME

if [ -f "/etc/sudoers.d/$FILE_NAME" ]; 
then 
  rm /etc/sudoers.d/$FILE_NAME
fi

cp ./tmp/$FILE_NAME /etc/sudoers.d/.

rm -rf ./tmp