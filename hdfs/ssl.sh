# Replace these values
KEYSTORE_PATH="./files/keystore"
TRUSTSTORE_PATH="./files/truststore"
KEYSTORE_PASSWORD="Bigdata1"
KEY_PASSWORD="Bigdata1"
DOMAIN="*.company.bigdata.svc.cluster.local"    # Replace with your domain
VALIDITY=3650

echo "Cleaning up existing files..."
rm -f ${KEYSTORE_PATH}
rm -f ${TRUSTSTORE_PATH}
rm -f ./files/hadoop.cert

# Generate the keystore with wildcard
keytool -genkey \
  -alias hadoop \
  -keyalg RSA \
  -keysize 2048 \
  -keystore ${KEYSTORE_PATH} \
  -storetype JKS \
  -storepass ${KEYSTORE_PASSWORD} \
  -keypass ${KEY_PASSWORD} \
  -validity ${VALIDITY} \
  -dname "CN=${DOMAIN}, OU=Hadoop, O=YourOrganization, L=YourCity, ST=YourState, C=YourCountry"

# Export the certificate
keytool -exportcert \
  -alias hadoop \
  -keystore ${KEYSTORE_PATH} \
  -storepass ${KEYSTORE_PASSWORD} \
  -file ./files/hadoop.cert

keytool -importcert \
  -alias hadoop \
  -file ./files/hadoop.cert \
  -keystore ${TRUSTSTORE_PATH} \
  -storetype JKS \
  -storepass ${KEYSTORE_PASSWORD} \
  -noprompt