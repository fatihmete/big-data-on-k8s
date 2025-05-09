# Replace these values
KEYSTORE_PATH="./files/keystore"
TRUSTSTORE_PATH="./files/truststore"
KEYSTORE_PASSWORD="Bigdata1"
KEY_PASSWORD="Bigdata1"
DOMAIN="*.kube1"    # Replace with your domain
VALIDITY=3650

echo "Cleaning up existing files..."
rm -f ${KEYSTORE_PATH}
rm -f ${TRUSTSTORE_PATH}
rm -f ./files/trino.cert

# Generate the keystore with wildcard
keytool -genkey \
  -alias trino \
  -keyalg RSA \
  -keysize 2048 \
  -keystore ${KEYSTORE_PATH} \
  -storetype JKS \
  -storepass ${KEYSTORE_PASSWORD} \
  -keypass ${KEY_PASSWORD} \
  -validity ${VALIDITY} \
  -dname "CN=${DOMAIN}, OU=Trino, O=YourOrganization, L=YourCity, ST=YourState, C=YourCountry"

# Export the certificate
keytool -exportcert \
  -alias trino \
  -keystore ${KEYSTORE_PATH} \
  -storepass ${KEYSTORE_PASSWORD} \
  -file ./files/trino.cert

keytool -importcert \
  -alias hadoop \
  -file ./files/trino.cert \
  -keystore ${TRUSTSTORE_PATH} \
  -storetype JKS \
  -storepass ${KEYSTORE_PASSWORD} \
  -noprompt