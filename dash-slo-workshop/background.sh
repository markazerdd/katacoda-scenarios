#!/bin/bash
mkdir /slo-workshop
git clone https://github.com/DataDog/ecommerce-workshop /ecommerce-workshop
cd /ecommerce-workshop
docker-compose pull