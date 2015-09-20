#!/bin/bash
# Author Joseph Sviderski

echo "Initializing Certifcation Authority Environment: "  
cd && mkdir -pv myCA/ 
echo "Initializing Certificate Database: "
echo '01' > serial  && touch index.txt
echo "Initializing CA Configuration"

echo "[ ca ]
default_ca      = local_ca
[ local_ca ]
dir             = myCA
certificate     = myCA/cacert.pem
database        = myCA/index.txt
new_certs_dir   = myCA/signedcerts
private_key     = myCA/private/cakey.pem
serial          = myCA/serial
default_crl_days        = 365
default_days            = 1825
default_md              = sha1
policy          = local_ca_policy
x509_extensions = local_ca_extensions
copy_extensions = copy
[ local_ca_policy ]
commonName              = supplied
stateOrProvinceName     = supplied
countryName             = supplied
emailAddress            = supplied
organizationName        = supplied
organizationalUnitName  = supplied
[ local_ca_extensions ]
basicConstraints        = CA:false
[ req ]
default_bits    = 2048
default_keyfile = myCA/private/cakey.pem
default_md      = sha1
prompt                  = no
distinguished_name      = root_ca_distinguished_name
x509_extensions         = root_ca_extensions
[ root_ca_distinguished_name ]
commonName              = MyOwn Root Certificate Authority
stateOrProvinceName     = NC
countryName             = US
emailAddress            = root@tradeshowhell.com
organizationName        = Trade Show Hell
organizationalUnitName  = IT Department
[ root_ca_extensions ]
basicConstraints        = CA:true" >> myCA/caconfig.cnf

export OPENSSL_CONF=myCA/caconfig.cnf 
echo "Generating CA Certificate and Key: "
openssl req -x509 -newkey rsa:2048 -out cacert.pem -outform PEM -days 1825
 
echo "Strip the Certificate of Text -CERTIFCATE- Generating .crt: "
openssl x509 -in cacert.pem -out cacert.crt

echo "Generating a Self-Signed Certificate: "

echo " 
[ req ]
prompt                  = no
distinguished_name      = server_distinguished_name
req_extensions          = v3_req
[ server_distinguished_name ]
commonName              = tradeshowhell.com
stateOrProvinceName     = NC
countryName             = US
emailAddress            = root@tradeshowhell.com
organizationName        = My Organization Name
organizationalUnitName  = Subunit of My Large Organization
[ v3_req ]
basicConstraints        = CA:FALSE
keyUsage                = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName          = @alt_names
[ alt_names ]
DNS.0                   = tradeshowhell.com
DNS.1                   = alt.tradeshowhell.com" >> myCA/signed.cnf

export OPENSSL_CONF=myCA/signed.cnf 
echo "Generating the Server Certificate and Key: "
openssl req -newkey rsa:1024 -keyout tempkey.pem -keyform PEM -out tempreq.pem -outform PEM

echo "Translate Temporary Key to Unencrypted Key"
openssl rsa < tempkey.pem > server_key.pem

echo "Signing Server Certificate with the CA key"
openssl ca -in tempreq.pem -out server_crt.pem

echo "Cleanup Removing All Temporary Certificates and Keys: "
rm -f tempkey.pem && rm -f tempreq.pem

echo "Prepending Unencrypted Private Key to the Server Certificate: "

cat server_key.pem server_crt.pem > hold.pem
mv hold.pem server_crt.pem
chmod 400 server_crt.pem

echo "Converting X.509 Certificates to PKCS#12 for Client Application Certificate: "

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

echo "Compiling Certificate and Private Key: "
openssl pkcs12 -export -out mycert.pfx -in mycert.pem -name "Application"

echo "Generating Certificate and Private key Request: "
copenssl req -new -newkey rsa:1024 -nodes -keyout mykey.pem -out myreq.pem

echo "Signature Verification: "
penssl req -in myreq.pem -noout -verify -key mykey.pem

echo "Information Verification: "
openssl req -in myreq.pem -noout -text

echo "Deploy Certificate to the System Certificate Directory"
sudo cp mycert.pem /usr/share/ca-certificates/mycert.crt

echo "Appending CA-Certificates Configuration: "
sudo dpkg-reconfigure ca-certificates

echo "Updating CA Certificates Database: "
sudo update-ca-certificates

echo "Completed Successfully Imported Certificate into the System CA Certificates Database: "