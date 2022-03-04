#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Please enter exactly two arguments: <image>.ppm and key to encrypt. E.g.
#./test.sh Tux.ppm my_password"
    exit 1
fi

if [[ ! $1 =~ ^[a-zA-Z0-9_-]+.ppm$ ]]; then
    echo "$1: First argument must be a .ppm file"
    exit 1
fi

if [ ! -f "$1" ]; then
    printf 'File does not exist: %s\n' "$1" >&2
    exit 1
fi

echo "File to encrypt: $1"
echo "Key to encrypt it with:: $2"

head -n 3 $1 > $1.header
tail -n +4 $1 > $1.body
openssl enc -aes-128-ecb -nosalt -pass pass:"$2" -in $1.body -out $1.body.ecb
cat $1.header $1.body.ecb > ecb_encrypted_art_$1
rm $1.body $1.header $1.body.ecb
