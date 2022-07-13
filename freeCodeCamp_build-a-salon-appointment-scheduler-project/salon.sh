#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
	echo -e "\n~~~~~ MY SALON ~~~~~"
	echo -e "\nWelcome to My Salon, how can I help you?"
	echo -e "\n1) Bike_servicing\n2) Bike_deep_wash\n3) Bike_heavy_repair"
	read SERVICE_ID_SELECTED
	case $SERVICE_ID_SELECTED in
		1) SERVICE ;;
		2) SERVICE ;;
		3) SERVICE ;;
		*) MAIN_MENU "I could not find that service. What would you like today?" ;;
	esac
}

SERVICE() {
	echo "What's your phone number?"
	read CUSTOMER_PHONE
	NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
	if [[ -z $NAME ]]; then
		# No customer name found
		echo -e "\nI don't have a record for that phone number, what's your name?"
		read CUSTOMER_NAME
		# Insert the name of a new customer into the table
		INSERT_NAME=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	fi
	SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
	CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
	echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
	read SERVICE_TIME
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
	CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
	echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME.\n"
}

MAIN_MENU
