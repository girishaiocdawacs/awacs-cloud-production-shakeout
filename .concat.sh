#! /bin/bash

cd zerossl/

rm -rf app.awacscloud.tech.*

for file in certificate.crt ca_bundle.crt; do cat $file >> app.awacscloud.tech.crt; echo >> app.awacscloud.tech.crt; done

rm -rf qa.awacscloud.tech.*

for file in qa_certificate.crt qa_ca_bundle.crt; do cat $file >> qa.awacscloud.tech.crt; echo >> qa.awacscloud.tech.crt; done

cp private.key app.awacscloud.tech.key

cp qa_private.key qa.awacscloud.tech.key
