# this is simple code to tell how function works in bash
#!/bin/bash
function f1 {
    echo "hello"
    echo ${FUNCNAME}
    var="123"
}

f2() {
    p1=$1
    p2=$2
    sum=$((${p1} + ${p2}))
    echo "${sum}"
}

f1
echo "${var}"

mySum="$(f2 1 2)"
echo mySum = $mySum

mySum="$(f2 10 -2)"
echo mySum = $mySum