TOKEN='BAhJIiViYmFiZGZkZWMzMDM5OTY2OThlYTQ0MDEwMDIyYmMzMQY6BkVG--1acd3c027bdc41e7c86b0f5c3af9d123111b669e'

curl --include --request POST http://localhost:3000/contacts \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "contact": {
      "first_name": "Kitty",
      "last_name": "Holmes",
      "occupation": "Professor",
      "professional_relationship": "Mentor",
      "company": "BU",
      "last_contacted": "20120407",
      "fact": "Likes Pizza"
    }
  }'
