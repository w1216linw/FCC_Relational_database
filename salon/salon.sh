#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "Welcome to My Salon, how can I help you?"
  SERVICES=$($PSQL "select service_id, name from services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
   echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1 | 2 | 3 | 4 | 5 | 6)
    SERVICE
    ;;

    *) 
    MAIN_MENU "Please enter a valid option." 
    ;;
  esac
}

SERVICE() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nYou are first time here, may I have your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  fi

  echo -e "\nWhat times would you like to schedule a service?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU