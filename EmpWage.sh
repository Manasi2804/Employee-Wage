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

# Calculate daily employee wage

if [[ $ispresent -eq $randomtemp ]]
then
	empRatePerHr=20;
	empHrs=8;
	salary=$(( $empHrs*$empRatePerHr ));
else
	salary=0;
fi
