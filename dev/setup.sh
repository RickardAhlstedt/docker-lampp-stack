#!/bin/bash

build_container() {
    folder="/data/mysql"
    file_to_check="dump.sql"

    if [ -f "$folder/$file_to_check" ]; then
        echo "A database-dump exists in the data-folder and will be imported during build."
    else
        echo ""
    fi
    echo "Building container..."
    docker-compose up -d
    docker-compose ps -a
}

# Ask the user for input
read -p "Enter the project-name: " user_input

# Copy sample.env to .env
cp sample.env .env

# Replace the known string in .env with user input
sed -i "" "s/\$NAME/$user_input/g" .env

read -re -p "Which PHP-version would you like to use?\n(php54, php56, php71, php72, php73, php74, php8, php81, php82): " php_version

sed -i "" "s/\$PHP/$php_version/g" .env

read -re -p "Which database would you like to use? (mysql57, mysql8, mariadb103, mariadb104, mariadb105, mariadb106)\nPlease note that Apple silicon users may have better success running mariadb:" db_version

sed -i "" "s/\$DB/$db_version/g" .env

# Ask the user a yes/no question
read -p "Do you want to build the container? (yes/no): " user_response

# Define a list of possible "yes" answers
yes_answers=("yes" "y" "YES" "Y")

# Check if the user's response is in the list of "yes" answers
if [[ " ${yes_answers[*]} " =~ " $user_response " ]]; then
    # Add your additional actions here
    build_container
else
    echo "Your environment is ready.\nHave a nice day!"
fi

