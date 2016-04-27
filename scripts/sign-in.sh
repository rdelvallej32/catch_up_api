#!/bin/bash
TOKEN= BAhJIiU3NDkyMjZiYzc4NTg0NTJlMDk1Y2VhOTc3ZWRkNzk5MAY6BkVG--2b8446a2226c750b1535e3be9879f1cb03ff72d3

curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
