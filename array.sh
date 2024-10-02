#!/bin/bash
#declare array
my_array=("apple" "banana" "cherry")

#read array
echo "${my_array[@]}"
echo "${my_array[1]}"

###read array one by one
while read line;
do 
echo $line
done <<< ${my_array[@]}
 ##slice in array
echo "${my_array[@]:1:1}"

#readin array using for loop
for i in ${my_array[@]};
do
   echo $i
done