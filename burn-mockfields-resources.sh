#!/bin/bash

echo "\n*************** Starting deletion of resources in mockfields ***************\n"
kubectl -n mockfields delete po --all
kubectl -n mockfields delete deployment.apps/mysql-primary
kubectl -n mockfields delete service/mysql-primary
kubectl -n mockfields delete sa task-setup-upgrades-replication
kubectl -n mockfields delete secret --all
kubectl -n mockfields delete cm upgrades-replication-mysql-config
kubectl -n mockfields delete pvc upgrades-replication-pvc
echo "\n*************** Starting deletion of resources in acquia-polaris-system ***************\n"
kubectl -n acquia-polaris-system delete svc mysql-primary
kubectl -n acquia-polaris-system delete deployment mysql-primary
kubectl -n acquia-polaris-system delete cm upgrades-replication-stunnel-config
kubectl -n acquia-polaris-system delete cm upgrades-replication-mysql-config
echo "\n*************** Showing resources in mockfields ***************\n"
kubectl -n mockfields get all
kubectl -n mockfields get pvc
kubectl -n mockfields get secrets
kubectl -n mockfields get cm

