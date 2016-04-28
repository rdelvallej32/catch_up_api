#!/bin/bash
TOKEN='BAhJIiViYmFiZGZkZWMzMDM5OTY2OThlYTQ0MDEwMDIyYmMzMQY6BkVG--1acd3c027bdc41e7c86b0f5c3af9d123111b669e'
ID='1'

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
