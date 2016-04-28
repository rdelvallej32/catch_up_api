#!/bin/bash
TOKEN='BAhJIiU0NDhjNzQzYjlmMjc2ZjU1MWJlODcwMDk0Y2MyODQwNAY6BkVG--397f130daa12e51ff83772a9a6716852ec64db7b'
ID='2'

curl --include --request DELETE http://localhost:3000/contacts/${ID} \
--header "Authorization: Token token=${TOKEN}"
