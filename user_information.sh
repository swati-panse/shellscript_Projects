#!/bin/bash

# Prompt the user for employee information
echo "Enter employee's first name:"
read first_name

echo "Enter employee's surname:"
read surname

echo "Enter employee's salary:"
read salary

echo "Enter employee's department:"
read department

echo "Enter employee's position:"
read position

# Print a summary of the collected information
echo ""
echo "Employee Information Summary:"
echo "-----------------------------"
echo "Name: $first_name $surname"
echo "salary: $salary"
echo "Department: $department"
echo "Position: $position"
