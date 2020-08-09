#!/bin/bash

# create the default database from the ADDed file.
echo "Create ironhack user"
mysql -e "CREATE USER IF NOT EXISTS ironhack IDENTIFIED WITH mysql_native_password BY 'ironhack';"
mysql -e "GRANT ALL PRIVILEGES ON  * . * TO 'ironhack';"

echo "Initialize database"
mysql < initdb/mysql_dump.sql

echo "Database initialized"

mysql -e "ALTER USER root IDENTIFIED WITH mysql_native_password BY 'rootpwd';"
