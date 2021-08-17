#!/bin/bash

echo "# terraform.tfvars"
host="$(kubectl config view --minify --raw --output 'jsonpath={..cluster.server}' )"
echo "host = \"${host}\""

# Extract the Cluster Certificate Authorithy
cluster_ca_certificate=$(kubectl config view --minify --raw --output 'jsonpath={..cluster.certificate-authority-data}' )
echo "cluster_ca_certificate = \"${cluster_ca_certificate}\""

# Extract the Client Certificate
client_certificate=$(kubectl config view --minify --raw --output 'jsonpath={..user.client-certificate-data}' )
echo "client_certificate = \"${client_certificate}\""

# Extract the Client Private Key
client_key=$(kubectl config view --minify --raw --output 'jsonpath={..user.client-key-data}' )
echo "client_key = \"${client_key}\""
