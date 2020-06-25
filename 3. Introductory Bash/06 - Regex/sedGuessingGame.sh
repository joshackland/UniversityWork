#!/bin/bash

#replace the echo 'Correct' with 'Right'
sed -i '/echo .*".*!"/ s/Correct/Right/' '../04 - Functions/guessinggame.sh'