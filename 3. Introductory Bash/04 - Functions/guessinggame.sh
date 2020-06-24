printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

getNumber()
{
    read -p "$1: "

    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1:"
    done
}

guessnumber=42

while [[ $REPLY != $guessnumber ]]; do
    getNumber "please type a number between 1 and 100" 1 100

    if (( $REPLY < $guessnumber )); then
        echo "Too Low!"
    elif (( $REPLY > $guessnumber )); then
        echo "Too High!"
    else
        echo "Correct!"
    fi
done
