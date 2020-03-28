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
workHrs=0

randomtemp=$(( RANDOM%3 ))

if [[ $IS_PRESENT -eq $randomtemp ]]
then
	echo "employee is present"
else
	echo "employee is not present"
fi

# Calculate daily employee wage

function calcDailyWage()
{
	empHrs=$1
	wage=$(($EMP_RATE_PER_HR*$empHrs))
	echo $wage
}

function getWorkingHrs()
{
	case $1 in
		$IS_FULL_TIME)
			workHrs=8
			;;
		$IS_PART_TIME)
			workHrs=4
			;;
		*)
			workHrs=0
			;;
	esac
	echo $workHrs
}

# Calculate wages till a condition of total working hours is reached for a month
while [[ $totalWorkingDays -lt $MAX_WORKING_DAYS && $totalEmpHrs -lt $MAX_WORKING_HRS ]]
do
	((totalWorkingDays++))
	empHrs="$(getWorkingHrs((RANDOM%3)))"
	totalWorkHrs=$(($totalWorkHrs+$empHrs))
	empDailyWage[$totalWorkingDays]="$( calcDailyWage $empHrs )"
done

totalSalary=$(($totalWorkHrs*$EMP_RATE_PER_HR))
echo $totalSalary
echo "Daily Wage : " ${empDailyWage[@]}

