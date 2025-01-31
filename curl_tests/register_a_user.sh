#!/usr/bin/env bash
# set -x

SCRIPT_NAME=$(basename "$0")


export OUTPUT_FILE="${SCRIPT_NAME}.json"


# export URL_PATH="/auth/register"
# export URL_PATH="/register"

# ---- Set the Post Data ---- #
# export POST_DATA=${POST_DATA:-'{
#   "email": "jamie.czuy+01_laravel_test@gmail.com",
#   "password": "Test123",
#   "first_name": "Jamie01",
#   "last_name": "Tester"
# }'}

export POST_DATA=${POST_DATA:-'{"email": "jamie.czuy+01_laravel_test@gmail.com", "password": "Password123!", "first_name": "Jamie01", "last_name": "Tester"}'}
# export POST_DATA=${POST_DATA:-'{"email": "jamie.czuy+02_laravel_test@gmail.com", "password": "Password123!", "first_name": "Jamie02", "last_name": "Tester"}'}
# export POST_DATA=${POST_DATA:-'{"email": "jamie.czuy+03_laravel_test@gmail.com", "password": "Password123!", "first_name": "Jamie03", "last_name": "Tester"}'}
# export POST_DATA=${POST_DATA:-'{"email": "jamie.czuy+04_laravel_test@gmail.com", "password": "Password123!", "first_name": "Jamie04", "last_name": "Tester"}'}



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

# ---- Handle Output File ---- #
OUTPUT_FILE=${OUTPUT_FILE:-"output.json"}
rm -f ${OUTPUT_FILE}

# ---- Make the curl call ---- #
NUM=04

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

# ---- Show the results (assumes json) ---- #
cat ${OUTPUT_FILE} | jq .


cp ${OUTPUT_FILE} output.html
open output.html
