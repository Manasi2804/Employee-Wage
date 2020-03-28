#!/bin/bash -x

echo "Welcome to employee  wage computation"
ispresent=1;
randomtemp=$(( RANDOM%2 ))
if [[ $ispresent -eq $randomtemp ]]
then
	echo "employee is present"
else
	echo "employee is not present"
fi
