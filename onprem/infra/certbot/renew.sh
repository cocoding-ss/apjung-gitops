#!/bin/bash

DEV=dev
DEV_SECRET=tls-secret-dev
DEV_KEY_PATH=/etc/letsencrypt/live/apjung.xyz/privkey.pem
DEV_CERT_PATH=/etc/letsencrypt/live/apjung.xyz/cert.pem

# 기존 시크릿 제거
kubectl delete secret $DEV_SECRET
kubectl -n $DEV delete secret $DEV_SECRET 

# default에 시크릿생성
kubectl create secret tls $DEV_SECRET --key $DEV_KEY_PATH --cert $DEV_CERT_PATH

# Dev로 시크릿복사 
kubectl get secret $DEV_SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$DEV -f -

SECRET=tls-secret
KEY_PATH=/etc/letsencrypt/live/apjung.me/privkey.pem
CERT_PATH=/etc/letsencrypt/live/apjung.me/cert.pem


ARGOCD=argocd
JENKINS=jenkins
SONARQUBE=sonarqube
MONITORING=monitoring

# 기존 시크릿 제거
kubectl delete secret $SECRET
kubectl -n $ARGOCD delete secret $SECRET
kubectl -n $JENKINS delete secret $SECRET 
kubectl -n $SONARQUBE delete secret $SECRET
kubectl -n $MONITORING delete secret $SECRET

# default에 시크릿생성
kubectl create secret tls $SECRET --key $KEY_PATH --cert $CERT_PATH

# Argocd로 시크릿복사
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$ARGOCD -f -

# Jenkins로 시크릿복사
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$JENKINS -f -

# SonarQube로 시크릿복사
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$SONARQUBE -f -

kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$MONITORING -f -
