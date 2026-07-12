MY_GWAY_URL='https://6pc8dpxa07.execute-api.eu-north-1.amazonaws.com'

curl -X POST "${MY_GWAY_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello"}'


