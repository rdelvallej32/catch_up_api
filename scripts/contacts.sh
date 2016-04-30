TOKEN='BAhJIiVjNmJjYTQyYzVjNDRmM2E1MmYyNmIyYWRjZDNiZWY3OQY6BkVG--472e58373e0e91d4dd7f4f5fb43fcb5532eae7f6'

curl --include --request GET http://localhost:3000/contacts \
--header "Authorization: Token token=$TOKEN" \
