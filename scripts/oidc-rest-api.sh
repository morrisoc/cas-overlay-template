# Step 1: Obtain Authorization Code
curl --insecure -X GET "https://localhost:8443/cas/oidc/authorize?client_id=client&response_type=code&scope=openid%20profile%20email&redirect_uri=https://client.example.org/callback&state=xyz&nonce=abc"

## And set this to the return result
AUTH_CODE=

# Step 2: Exchange Authorization Code for Tokens

curl --insecure \
  -X POST "https://localhost:8443/cas/oidc/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=client&client_secret=secret&grant_type=authorization_code&code=$AUTH_CODE&redirect_uri=https://client.example.org/callback"

## And set this to the return result
ACCESS_TOKEN=

# Step 3: Access User Info

curl --insecure \
  -X GET "https://localhost:8443/cas/oidc/profile" \
  -H "Authorization: Bearer $ACCESS_TOKEN"
