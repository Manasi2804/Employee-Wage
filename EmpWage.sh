#!/bin/bash -x

echo "Welcome to employee  wage computation"

IS_PRESENT=1
IS_PART_TIME=1
IS_FULL_TIME=2
MAX_WORKING_HRS=100
EMP_RATE_PER_HR=20
MAX_WORKING_DAYS=20

# Variables
totalSalary=0
totalEmpHrs=0
totalWorkingDays=0
salary=0


randomtemp=$(( RANDOM%3 ))

if [[ $IS_PRESENT -eq $randomtemp ]]
then
	echo "employee is present"
else
	echo "employee is not present"
fi

# Calculate daily employee wage

if [[ $IS_PRESENT -eq $randomtemp ]]
then
	empHrs=8;
	salary=$(( $empHrs*$EMP_RATE_PER_HRS ));
else
	salary=0;
fi

# To add part time employee
#Using case statement

for((day=1;day<=$MAX_WORKING_DAYS;day++))
do
	randomtemp=$(( RANDOM%3 ))
	case $randomtemp in
		$IS_FULL_TIME)
			empHrs=8;
			;;
		$IS_PART_TIME)
			empHrs=4;
			;;
		$*)
			empHrs=0;
			;;
	esac
	salary=$(($empHrs*$EMP_RATE_PER_HRS))
	totalSalary=$(($totalSalary+$salary))
done

# Calculate wages till a condition of total working hours is reached for a month

while [[ $totalWorkingDays -lt $MAX_WORKING_DAYS && $totalEmpHrs -lt $MAX_WORKING_HRS ]]
do
	((totalWorkingDays++))
	randomtemp=$((RANDOM%3))
  	case $randomtemp in
		$IS_FULL_TIME)
			empHrs=8
         ;;
      $IS_PART_TIME)
         empHrs=4
         ;;
      *)
         empHrs=0
         ;;
	esac
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HR))
