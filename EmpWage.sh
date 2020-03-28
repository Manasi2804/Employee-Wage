#!/bin/bash -x

echo "Welcome to employee  wage computation"

ispresent=1
isPartTime=1
isFullTime=2
empRatePerHr=20
noWorkingDays=20
totalSalary=0

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
#Using case statement

for((day=1;day<=$noWorkingDays;day++))
do
	randomtemp=$(( RANDOM%3 ))
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
	salary=$(($empHrs*$empRatePerHr))
	totalSalary=$(($totalSalary+$salary))
done
