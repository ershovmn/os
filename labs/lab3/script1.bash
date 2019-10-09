a=$(ps | wc -l)
let "a=a-1"
echo "$a"