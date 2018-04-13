#!/bin/bash

echo "here3"

echo "$@"
echo "$0"
echo "$1"
echo "$2"
exec "$@"
sleep 1000
