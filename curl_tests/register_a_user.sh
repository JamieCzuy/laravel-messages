#!/usr/bin/env bash
# set -x

# ---- Handle Output File ---- #
SCRIPT_NAME=$(basename "$0")
export OUTPUT_FILE="${SCRIPT_NAME}.json"
rm -f ${OUTPUT_FILE}

# ---- Build the URL ---- #
URL_METHOD="POST"
URL_PROTOCOL="http://"
URL_HOST="localhost"
URL_PORT="8000"
URL_PATH="/api/register"

URL=${URL:-"${URL_PROTOCOL}${URL_HOST}:${URL_PORT}${URL_PATH}"}

# ---- Show whats being used ---- #
echo "Calling curl with:"
echo "  Method: ${URL_METHOD}"
echo "  URL: ${URL}"
echo "  Output File: ${OUTPUT_FILE}"

# ---- Make the curl call ---- #
NUM=01

curl \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --json '{"email": "jamie.czuy+'${NUM}'_laravel_test@gmail.com", "password": "Password123", "first_name": "Jamie'${NUM}'", "last_name": "Tester"}' \
  --output ${OUTPUT_FILE} \
  --silent \
  --show-error \
  -w "Result Code: %{http_code}\n" \
  -X ${URL_METHOD} \
 ${URL}

# ---- Show the results (assumes json or html) ---- #
cat ${OUTPUT_FILE} | jq .

cp ${OUTPUT_FILE} output.html
open output.html
