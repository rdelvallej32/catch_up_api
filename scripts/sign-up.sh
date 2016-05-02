#!/bin/bash

curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "fire@aol.com",
      "password": "123",
      "password_confirmation": "123"
    },

    "profile": {
      "username": "2fiery",
      "phone_number": "+14108675309"
    }
  }'
