#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Student Results Management System"
    echo "1. Add Student"
    echo "2. View Students"
    echo "3. Calculate Grade"
    echo "4. Exit"
}

# Function to add a student
add_student() {
    echo "Enter Student Name:"
    read name
    echo "Enter Student ID:"
    read id
    echo "Enter Marks for Subject 1:"
    read marks1
    echo "Enter Marks for Subject 2:"
    read marks2
    echo "Enter Marks for Subject 3:"
    read marks3
    
    echo "$id,$name,$marks1,$marks2,$marks3" >> students.csv
    echo "Student added successfully."
}

# Function to view students
view_students() {
    if [ ! -f students.csv ]; then
        echo "No student records found."
        return
    fi

    echo "ID,Name,Subject1,Subject2,Subject3"
    cat students.csv
}

# Function to calculate grade
calculate_grade() {
    if [ ! -f students.csv ]; then
        echo "No student records found."
        return
    fi

    echo "Enter Student ID:"
    read id

    student_record=$(grep "^$id," students.csv)
    if [ -z "$student_record" ]; then
        echo "Student ID not found."
        return
    fi

    IFS=',' read -r student_id name marks1 marks2 marks3 <<< "$student_record"
    
    total=$(echo "$marks1 + $marks2 + $marks3" | bc)
    average=$(echo "scale=2; $total / 3" | bc)

    if (( $(echo "$average >= 90" | bc -l) )); then
        grade="A"
    elif (( $(echo "$average >= 80" | bc -l) )); then
        grade="B"
    elif (( $(echo "$average >= 70" | bc -l) )); then
        grade="C"
    elif (( $(echo "$average >= 60" | bc -l) )); then
        grade="D"
    else
        grade="F"
    fi

    echo "Student ID: $student_id"
    echo "Name: $name"
    echo "Total Marks: $total"
    echo "Average Marks: $average"
    echo "Grade: $grade"
}

# Main script loop
while true; do
    display_menu
    echo "Enter your choice:"
    read choice

    case $choice in
        1) add_student ;;
        2) view_students ;;
        3) calculate_grade ;;
        4) exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
