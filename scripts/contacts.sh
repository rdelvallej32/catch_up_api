TOKEN='BAhJIiU1Y2ExNWZmM2FjYzBkMjNkZDVjMTBkMDJkZTAwNzU4NAY6BkVG--d5fad93afaf24cd681e5c2e2750cfcd7dfcb2752'

curl --include --request GET http://localhost:3000/contacts \
--header "Authorization: Token token=$TOKEN" \
