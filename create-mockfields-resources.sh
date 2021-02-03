#!/bin/bash

kubectl -n acquia-polaris-system apply -f tasks/rbac/polaris/setup-upgrades-replication.yaml
kubectl -n mockfields apply -f tasks/sample-parameters/mysql-db-stunnel-secret.yaml
kubectl -n mockfields apply -f tasks/sample-parameters/db-source-replication-user-secret.yaml
tools/argo-submit.sh tasks/tasks/polaris/setup-upgrades-replication.yaml --parameter-file tasks/sample-parameters/setup-upgrades-replication.yaml -n acquia-polaris-system
