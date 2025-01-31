set -x

# ---- Build the URL ---- #
URL_METHOD=${URL_METHOD:-"GET"}
URL_PROTOCOL=${URL_PROTOCOL:-"http://"}
URL_HOST=${URL_HOST:-"localhost"}
URL_PORT=${URL_PORT:-"8000"}
URL_PATH=${URL_PATH:-"/"}
URL=${URL:-"${URL_PROTOCOL}${URL_HOST}:${URL_PORT}${URL_PATH}"}

# ---- Show whats being used ---- #
echo "Calling curl with:"
echo "  Method: ${URL_METHOD}"
# echo "  Data: ${POST_DATA}"
echo "  URL: ${URL}"
echo "  Output File: ${OUTPUT_FILE}"

# echo ${POST_DATA} | jq .

# ---- Handle Output File ---- #
OUTPUT_FILE=${OUTPUT_FILE:-"output.json"}
rm -f ${OUTPUT_FILE}

# ---- Make the curl call ---- #
#   --json \'${POST_DATA}\' \
#   --json '{"email": "jamie.czuy+01_laravel_test@gmail.com", "password": "Password123", "first_name": "Jamie01", "last_name": "Tester"}' \
#   --json '{"email": "jamie.czuy+02_laravel_test@gmail.com", "password": "Password123", "first_name": "Jamie02", "last_name": "Tester"}' \

curl \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --json '{"email": "jamie.czuy+02_laravel_test@gmail.com", "password": "Password123", "first_name": "Jamie02", "last_name": "Tester"}' \
  --output ${OUTPUT_FILE} \
  --show-error \
  -w "%{http_code}\n" \
  -X ${URL_METHOD} \
 ${URL}

# ---- Show the results (assumes json) ---- #
cat ${OUTPUT_FILE} | jq .
