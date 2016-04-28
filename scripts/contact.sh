TOKEN='BAhJIiViYmFiZGZkZWMzMDM5OTY2OThlYTQ0MDEwMDIyYmMzMQY6BkVG--1acd3c027bdc41e7c86b0f5c3af9d123111b669e'
ID='2'

curl --include --request GET http://localhost:3000/contacts/$ID \
--header "Authorization: Token token=$TOKEN" \
