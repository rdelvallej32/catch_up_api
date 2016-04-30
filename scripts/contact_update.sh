#!/bin/bash
TOKEN='BAhJIiU4YWRjM2YyYjVjMGM1N2Y1Njc1ZDA1YjlkNjViNGM1NgY6BkVG--f17abe6f21e8b559cb381d8f5b831bc557d7641f'
ID='4'

curl --include --request PATCH http://localhost:3000/contacts/${ID} \
--header "Authorization: Token token=${TOKEN}" \
--header "Content-Type: application/json" \
--data '{
  "contact": {
    "first_name": "RoRo",
    "last_name": "Married",
    "occupation": "Scientist",
    "professional_relationship": "Former Boss",
    "company": "BU",
    "last_contacted": "20130407",
    "fact": "Doesnt Likes Pizza"
  }
}'
