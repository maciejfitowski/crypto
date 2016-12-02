#!/bin/bash 

# 1.1
openssl genrsa -out privkeyA.pem 2048

# 1.2
openssl req -new -key privkeyA.pem -out certA.csr

# 1.3
openssl genrsa -out privkeyB.pem 2048
openssl req -new -x509 -key privkeyB.pem -out CAcert.crt -days 15
openssl x509 -req -days 45 -in certA.csr -CA CAcert.crt -CAkey privkeyB.pem -set_serial 01 -out certA.crt
