#!/bin/bash

cat ~/.polaris.yaml

echo "\n************ Updating fn-drupal-operator repo ************\n"
cd ~/polaris_code/fn-drupal-operator
git checkout master
git pull

echo "\n************ Updating fn-k8or repo ************\n"
cd ~/polaris_code/fn-k8or
git checkout master
git pull

#echo "\n************ Updating fn-task-operator repo ************\n"
#cd ~/polaris_code/fn-task-operator
#git checkout master
#git pull

echo "\n************ Updating fn-polaris repo ************\n"
cd ~/polaris_code/fn-polaris
git checkout master
git pull


echo "\n************ Burning down the cluster ************\n"
~/polaris_code/fn-polaris/local/local.py delete

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ecr_name>

echo "\n************ Resetting Polaris dev env.. ************\n"
~/polaris_code/fn-polaris/local/local.py create

echo "\n************ Installing polaris ************\n"
cd ~/polaris_code/fn-polaris/cli/polaris
unset ECR
polaris install -t local
