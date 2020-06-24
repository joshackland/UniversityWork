#!/bin/bash



if ! [ -f "secret.txt" ]; then
    echo "error"
else
    cat "secret.txt"
fi