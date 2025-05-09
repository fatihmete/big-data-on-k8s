#!/bin/bash

# Kullanım bilgisi
if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <principal> <password> <keytab_file>"
    echo "Example: $0 hive@HOMELDAP.ORG mypassword hive.keytab"
    exit 1
fi

# Parametreleri değişkenlere atama
principal=$1
password=$2
keytab_file=$3

# ktutil komutlarını çalıştır
ktutil <<EOF
add_entry -password -p $principal -k 1 -e aes128-cts-hmac-sha1-96
$password
add_entry -password -p $principal -k 1 -e aes256-cts-hmac-sha1-96
$password
add_entry -password -p $principal -k 1 -e aes128-cts-hmac-sha256-128
$password
wkt $keytab_file
EOF

echo "Keytab file '$keytab_file' created successfully."
