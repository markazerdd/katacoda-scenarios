#!/bin/bash
mkdir ecommerce-workshop
git clone https://github.com/DataDog/ecommerce-workshop /ecommerce-workshop/
cd /ecommerce-workshop/
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
echo Welcome to the Ensuring Reliability with SLOs Training Workshop!