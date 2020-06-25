triangleArea()
{
    echo "The area for a triangle with base: $1 and height: $2 is: "$(( $1 * $2 / 2 ))
}

for (( i=1; i<=5; i++ ))
do
    for (( j=1; j<=10; j++ ))
    do
        triangleArea $i $j
    done
done