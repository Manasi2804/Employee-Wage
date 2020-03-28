#!/bin/bash -x

echo "Welcome to employee  wage computation"

ispresent=1
isPartTime=1
isFullTime=2
empRatePerHr=20

randomtemp=$(( RANDOM%3 ))

if [[ $ispresent -eq $randomtemp ]]
then
	echo "employee is present"
else
	echo "employee is not present"
fi

# Calculate daily employee wage

if [[ $ispresent -eq $randomtemp ]]
then
	empHrs=8;
	salary=$(( $empHrs*$empRatePerHr ));
else
	salary=0;
fi

# To add part time employee

if [[ $isFullTime -eq $randomtemp ]]
then
	empHrs=8;
elif [[ $isPartTime -eq $randomtemp ]]
then
	empHrs=4;
else
	empHrs=0;
fi
salary=$(($empHrs*$empRatePerHr))

#Using case statement

case $randomtemp in
	$isFullTime)
		empHrs=8;
		;;
	$isPartTime)
		empHrs=4;
		;;
	$*)
		empHrs=0;
		;;
esac
salary=$(( $empHrs*$empRatePerHr ))
