#!/bin/bash

# File to store passwords
PASSWORD_FILE="passwords.txt"

# Function to add a new password
add_password() {
    echo "Enter the account name:"
    read account
    echo "Enter the username:"
    read username
    echo "Enter the password:"
    read -s password
    echo "$account:$username:$password" >> $PASSWORD_FILE
    echo "Password added for account: $account"
}

# Function to retrieve a password
retrieve_password() {
    echo "Enter the account name to retrieve the password:"
    read account
    grep "^$account:" $PASSWORD_FILE | while IFS=: read -r acc user pass; do
        echo "Account: $acc"
        echo "Username: $user"
        echo "Password: $pass"
    done
}

# Function to display the menu
show_menu() {
    echo "Password Manager"
    echo "1. Add a new password"
    echo "2. Retrieve a password"
    echo "3. Exit"
    echo "Choose an option:"
}

# Main loop
while true; do
    show_menu
    read choice
    case $choice in
        1)
            add_password
            ;;
        2)
            retrieve_password
            ;;
        3)
            echo "Exiting Password Manager"
            break
            ;;
        *)
            echo "Invalid choice, please try again"
            ;;
    esac
done
