#!/bin/bash

if [ $# != 3 ]; then
    echo "not three arguments"
else
    case $2 in
        "+")
            let result=$1+$3
            echo -e "\033[34m${result}"
            ;;
        "-")
            let result=$1-$3
            echo -e "\033[32m${result}"
            ;;
        "x")
            let result=$1*$3
            echo -e "\033[31m${result}"
            ;;
        "/")
            let result=$1/$3
            echo -e "\033[35m${result}"
            ;;
        *)
            echo -e "invalid option\n"
    esac
fi